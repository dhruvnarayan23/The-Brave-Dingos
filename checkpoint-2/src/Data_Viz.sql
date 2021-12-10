--Start of Question 1 and 2:
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

--Creating Officer CSS Awards table which is a join between Officer CSS and data award tables
create TEMP view officer_css_awards as (
select A.officer_id, round(avg(A.CSS),4) as CSS, B.award_type, count(B.award_type) as award_count
from officer_css A left join data_award B on A.officer_id = B.officer_id
group by A.officer_id, B.award_type
);

select * from officer_css_awards;
--End of Question 1 and 2