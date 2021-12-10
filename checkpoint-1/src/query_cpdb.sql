--Start of Question 1:
--Creating allegation table with custom weights for allegation category
create TEMP view allegation as (
    SELECT A.officer_id, B.category, count(*),
       (case when B.category='Bribery / Official Corruption' then 3
                    when B.category='Racial Profiling' then 2
                    when B.category='Conduct Unbecoming (Off-Duty)' then 1
                    when B.category='Criminal Misconduct' then 5
                    when B.category='False Arrest' then 3
                    when B.category='Operation/Personnel Violations' then 3
                    when B.category='Excessive Force' then 5
                    when B.category='Domestic' then 1
                    when B.category='Use Of Force' then 4
                    when B.category='Money / Property' then 2
                    when B.category='Supervisory Responsibilities' then 1
                    when B.category='Traffic' then 1
                    when B.category='Incident' then 4
                    when B.category='Illegal Search' then 3
                    when B.category='Medical' then 1
                    when B.category='Lockup Procedures' then 2
                    when B.category='Unknown' then 1
                    when B.category='First Amendment' then 1
                    when B.category='Verbal Abuse' then 3
                    when B.category='Drug / Alcohol Abuse' then 4
                else 0
                end) as weights
     FROM  data_officerallegation A
    LEFT JOIN data_allegationcategory B on B.id = A.allegation_category_id
GROUP BY A.officer_id, B.category);

--Creating employment duration table and impute missing value of end date with the maximum of end date assuming these officers are still active
create TEMP view employment_duration as (SELECT A.officer_id, A.effective_date,
       case when A.end_date is Null then (SELECT max(end_date) from data_officerhistory) else A.end_date end as end_date
       from data_officerhistory A);
--Creating officer duration table which consists of officers along with the number of years they worked, for the last 50 years
create TEMP view officer_duration as (select officer_id, (max(end_date) - min(effective_date))/365 as duration
from employment_duration group by officer_id
having ((max(end_date) - min(effective_date))>0) and (min(effective_date) > ((SELECT max(end_date) from data_officerhistory) - 365*50))
);

-- Final CSS score table --> Complaint count * weights / employment duration for EACH officer
create TEMP view officer_css as (select A.officer_id, sum(A.count * A.weights) / min((B.duration+1)) as CSS
from allegation A inner join officer_duration B on A.officer_id = B.officer_id
group by A.officer_id);

-- Distribution of CSS table
select round(min(CSS),4) as min, round(max(CSS),4) as max, round(avg(CSS),4) as min, count(CSS),
       PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY round(CSS,4)) as median,
       PERCENTILE_CONT(0.25) WITHIN GROUP(ORDER BY round(CSS,4)) as PCT_25,
       PERCENTILE_CONT(0.75) WITHIN GROUP(ORDER BY round(CSS,4)) as PCT_75,
       round(stddev(CSS),4) as STDEV
from officer_css;

--End of Question 1

--Start of Question 2
select award_type, count(award_type) as count
from data_award group by award_type
order by count desc;

select officer_id, award_type, count(award_type) as count
from data_award group by officer_id, award_type
order by count desc;
--End of Question 2

--Start of Question 3
select foo.officer_id, avg (foo.new - foo.old) as avg_hike, round(min(foo.new - foo.old),4) as min_hike, round(max(foo.new - foo.old),4) as max_hike, count(foo.new - foo.old) as number_of_hikes,
       PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY round(foo.new - foo.old,4)) as median_hike,
       round(stddev(foo.new - foo.old),4) as Stdev_hike
from
(select a.officer_id, a.year, b.year, a.salary as old, b.salary as new
from data_salary as a, data_salary as b
where a.officer_id = b.officer_id and b.year - a.year = 1) as foo
group by foo.officer_id;
--End of Question 3

--Start of Question 4
--Creating Officer CSS Awards table which is a join between Officer CSS and data award tables
create TEMP view officer_css_awards as (
select A.officer_id, round(avg(A.CSS),4) as CSS, B.award_type, count(B.award_type) as award_count
from officer_css A left join data_award B on A.officer_id = B.officer_id
group by A.officer_id, B.award_type
);
--Final table of how rewards change based on different CSS percentiles (may be computationally expensive ~20-30sec as it includes nested statements all in one operation)
select award_type, sum(award_count) as OVERALL,
        sum(CASE WHEN CSS < (select PERCENTILE_CONT(0.1) WITHIN GROUP(ORDER BY round(CSS,4)) from officer_css_awards) THEN award_count ELSE 0 END) as PCT_10,
        sum(CASE WHEN CSS between (select PERCENTILE_CONT(0.1) WITHIN GROUP(ORDER BY round(CSS,4)) from officer_css_awards) and (select PERCENTILE_CONT(0.2) WITHIN GROUP(ORDER BY round(CSS,4)) from officer_css_awards) THEN award_count ELSE 0 END) as PCT_10_20,
        sum(CASE WHEN CSS between (select PERCENTILE_CONT(0.2) WITHIN GROUP(ORDER BY round(CSS,4)) from officer_css_awards) and (select PERCENTILE_CONT(0.3) WITHIN GROUP(ORDER BY round(CSS,4)) from officer_css_awards) THEN award_count ELSE 0 END) as PCT_20_30,
        sum(CASE WHEN CSS between (select PERCENTILE_CONT(0.3) WITHIN GROUP(ORDER BY round(CSS,4)) from officer_css_awards) and (select PERCENTILE_CONT(0.4) WITHIN GROUP(ORDER BY round(CSS,4)) from officer_css_awards) THEN award_count ELSE 0 END) as PCT_30_40,
        sum(CASE WHEN CSS between (select PERCENTILE_CONT(0.4) WITHIN GROUP(ORDER BY round(CSS,4)) from officer_css_awards) and (select PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY round(CSS,4)) from officer_css_awards) THEN award_count ELSE 0 END) as PCT_40_50,
        sum(CASE WHEN CSS between (select PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY round(CSS,4)) from officer_css_awards) and (select PERCENTILE_CONT(0.6) WITHIN GROUP(ORDER BY round(CSS,4)) from officer_css_awards) THEN award_count ELSE 0 END) as PCT_50_60,
        sum(CASE WHEN CSS between (select PERCENTILE_CONT(0.6) WITHIN GROUP(ORDER BY round(CSS,4)) from officer_css_awards) and (select PERCENTILE_CONT(0.7) WITHIN GROUP(ORDER BY round(CSS,4)) from officer_css_awards) THEN award_count ELSE 0 END) as PCT_60_70,
        sum(CASE WHEN CSS between (select PERCENTILE_CONT(0.7) WITHIN GROUP(ORDER BY round(CSS,4)) from officer_css_awards) and (select PERCENTILE_CONT(0.8) WITHIN GROUP(ORDER BY round(CSS,4)) from officer_css_awards) THEN award_count ELSE 0 END) as PCT_70_80,
        sum(CASE WHEN CSS between (select PERCENTILE_CONT(0.8) WITHIN GROUP(ORDER BY round(CSS,4)) from officer_css_awards) and (select PERCENTILE_CONT(0.9) WITHIN GROUP(ORDER BY round(CSS,4)) from officer_css_awards) THEN award_count ELSE 0 END) as PCT_80_90,
        sum(CASE WHEN CSS > (select PERCENTILE_CONT(0.9) WITHIN GROUP(ORDER BY round(CSS,4)) from officer_css_awards) THEN award_count ELSE 0 END) as PCT_90_100
from officer_css_awards group by award_type;
--End of Question 4
