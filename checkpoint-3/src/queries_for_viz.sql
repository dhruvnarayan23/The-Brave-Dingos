--Question 1
--Creating allegation table with custom weights for allegation category
-- drop view if exists allegation cascade;
-- create TEMP view allegation as (
--     SELECT A.officer_id, B.category, count(*),
--        (case when B.category='Bribery / Official Corruption' then 3
--                     when B.category='Racial Profiling' then 2
--                     when B.category='Conduct Unbecoming (Off-Duty)' then 1
--                     when B.category='Criminal Misconduct' then 5
--                     when B.category='False Arrest' then 3
--                     when B.category='Operation/Personnel Violations' then 3
--                     when B.category='Excessive Force' then 5
--                     when B.category='Domestic' then 1
--                     when B.category='Use Of Force' then 4
--                     when B.category='Money / Property' then 2
--                     when B.category='Supervisory Responsibilities' then 1
--                     when B.category='Traffic' then 1
--                     when B.category='Incident' then 4
--                     when B.category='Illegal Search' then 3
--                     when B.category='Medical' then 1
--                     when B.category='Lockup Procedures' then 2
--                     when B.category='Unknown' then 1
--                     when B.category='First Amendment' then 1
--                     when B.category='Verbal Abuse' then 3
--                     when B.category='Drug / Alcohol Abuse' then 4
--                 else 0
--                 end) as weights
--      FROM  data_officerallegation A
--     LEFT JOIN data_allegationcategory B on B.id = A.allegation_category_id
-- GROUP BY A.officer_id, B.category);

drop view if exists allegation cascade;
create TEMP view allegation as (
    SELECT A.officer_id, B.category, count(*),
       (case when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Unfit For Duty' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 0.77
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Absence Without Permission' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Medical Roll Violation' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 13.8
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Medical Roll - Fail To Notify Spvsr' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 13.8
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Medical Roll - Fail To Rpt In Person To Mss 2Nd Day For Eval' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 13.8
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Medical Roll - Absent From Residence' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 13.8
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Medical Roll - Fail To Rpt To Mss Or Other Medical Service' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 13.8
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Medical Roll - Other And Specify' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 13.8
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Tardiness' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 0.77
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Court Appearance Violation' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Uniform Violation - General Order' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Uniform Violation - Official Duty' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Equipment Violation' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 20.52
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Weapons/Ammunition Violation' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 20.52
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Back In Service Violation' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Excessive Time Violation' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Courteous Police Service' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 13.42
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Lounging' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 1.06
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Unnecessary Visiting With Public' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 14.73
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Unnecessary Visiting With Officers' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 14.73
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Parking Vehicles' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 1.06
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Transporting Persons' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 21.18
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Congregating' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 1.06
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Absent/Leaving Duty Assignment' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Failure To Perform Assigned Tasks' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Radio/Television Violation' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Commercial Publications Violation' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 13.87
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Inattention To Duty' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Reports - Fail To Submit' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Reports - Failure To Report Incident' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Verbal Abuse' and B.allegation_name = 'Use Of Profanity' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 3.18
when B.Category = 'Verbal Abuse' and B.allegation_name = 'Racial / Ethnic, Etc.' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 5.89
when B.Category = 'Verbal Abuse' and B.allegation_name = 'Sexual Orientation' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 5.89
when B.Category = 'Verbal Abuse' and B.allegation_name = 'Religious Affiliation' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 3.18
when B.Category = 'Verbal Abuse' and B.allegation_name = 'Miscellaneous' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 3.18
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Misuse Of Equipment/Supplies' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 18.97
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Radio Call Violation' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Failure To Perform Any Duty' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 9.56
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Current Il License Plates And/Or City Vehicle Sticker' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 7.21
when B.Category = 'Conduct Unbecoming (Off-Duty)' and B.allegation_name = 'Indebtedness To The City' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.07
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Statement Of Financial Interest' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 4.05
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Smoking Violation' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 1.42
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Preventable Accident' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 8.16
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Supervisor Responsibility' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 17.67
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Non Compliance With Motor Vehicle Pursuit Requirements' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 0.77
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Compensatory Time Violation' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 4.05
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Failure To Identify' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 7.66
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Intoxicated On Duty' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Intoxicated Off Duty' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'D.U.I. - On Duty' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'D.U.I. - Off Duty' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Possession / Drinking Alcohol - On Duty' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 4.42
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Impairment .04 Or Greater - On Duty' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 4.42
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Impairment .04 Or Greater - Off Duty' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 4.42
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Random Drug/Return To Duty 6 Mos Follow-Up .021 Or Greater' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Miscellaneous' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Lockup Procedures' and B.allegation_name = 'Neglect Of Duty' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 8.21
when B.Category = 'Lockup Procedures' and B.allegation_name = 'Conduct Unbecoming' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 15.18
when B.Category = 'Lockup Procedures' and B.allegation_name = 'Inventory Procedure' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 11.6
when B.Category = 'Lockup Procedures' and B.allegation_name = 'Inventory Procedures - Non-Arrestee' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 11.6
when B.Category = 'Traffic' and B.allegation_name = 'Traffic Bonding Procedures' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 1.14
when B.Category = 'Traffic' and B.allegation_name = 'Traffic Citation Processing' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 1.14
when B.Category = 'Traffic' and B.allegation_name = 'Traffic Crash Report - Fail To Properly Process' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 1.14
when B.Category = 'Traffic' and B.allegation_name = 'Traffic Regulations - Fail To Enforce' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 1.14
when B.Category = 'Lockup Procedures' and B.allegation_name = 'Improper Arrest/Booking/Processing' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 9.37
when B.Category = 'Lockup Procedures' and B.allegation_name = 'Improper Bonding Procedures' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 11.6
when B.Category = 'Lockup Procedures' and B.allegation_name = 'Search Improper - Person/Property' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 14.73
when B.Category = 'Lockup Procedures' and B.allegation_name = 'Prisoners Property - Fail To Inventory' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 9.6
when B.Category = 'First Amendment' and B.allegation_name = 'First Amendment' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 10.39
when B.Category = 'Illegal Search' and B.allegation_name = 'Improper Search Of Person' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 14.73
when B.Category = 'Illegal Search' and B.allegation_name = 'Search Of Premise Without Warrant' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 9.6
when B.Category = 'False Arrest' and B.allegation_name = 'Illegal Arrest / False Arrest' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 9.56
when B.Category = 'Use Of Force' and B.allegation_name = 'Injury / Death (Under Color Of Law)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 39.48
when B.Category = 'First Amendment' and B.allegation_name = 'Failure To Ensure Civil Rights' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 11.17
when B.Category = 'Illegal Search' and B.allegation_name = 'Improper Search Of Vehicle' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 9.6
when B.Category = 'False Arrest' and B.allegation_name = 'Planting Controlled Substance On Person' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 14.79
when B.Category = 'False Arrest' and B.allegation_name = 'Planting Controlled Substance In Premise' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 14.79
when B.Category = 'False Arrest' and B.allegation_name = 'Planting Controlled Substance In Vehicle' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 14.79
when B.Category = 'False Arrest' and B.allegation_name = 'Planting Controlled Substance - Other' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 14.79
when B.Category = 'Racial Profiling' and B.allegation_name = 'Racial Profiling' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 5.89
when B.Category = 'False Arrest' and B.allegation_name = 'Improper Detention' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 11.17
when B.Category = 'False Arrest' and B.allegation_name = 'Unlawful / Excessive Investigative Detention (Witness)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 11.17
when B.Category = 'Use Of Force' and B.allegation_name = 'Illegal Threat Of Arrest' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.11
when B.Category = 'Illegal Search' and B.allegation_name = 'Search Of Person - Property / Usc Taken' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 14.73
when B.Category = 'Illegal Search' and B.allegation_name = 'Search Of Premise - Property / Usc Taken' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 9.6
when B.Category = 'Illegal Search' and B.allegation_name = 'Search Of Vehicle - Property / Usc Taken' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 9.6
when B.Category = 'Illegal Search' and B.allegation_name = 'Miscellaneous' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 10.39
when B.Category = 'Lockup Procedures' and B.allegation_name = 'Bonding/Booking/Processing' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 11.6
when B.Category = 'Lockup Procedures' and B.allegation_name = 'Arrest, Improper Procedures' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 9.56
when B.Category = 'Lockup Procedures' and B.allegation_name = 'Excessive Detention - After Arrest' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 11.17
when B.Category = 'Lockup Procedures' and B.allegation_name = 'Search - Person / Property' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 14.73
when B.Category = 'Lockup Procedures' and B.allegation_name = 'Prisoners Property' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 9.6
when B.Category = 'Lockup Procedures' and B.allegation_name = 'Escape' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 15.51
when B.Category = 'Lockup Procedures' and B.allegation_name = 'Telephone / Attorney / Relative Privileges' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 9.56
when B.Category = 'Lockup Procedures' and B.allegation_name = 'Proper Care - Injury / Death' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 42.38
when B.Category = 'Lockup Procedures' and B.allegation_name = 'Miscellaneous' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 9.56
when B.Category = 'Lockup Procedures' and B.allegation_name = 'Miscellaneous' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 9.56
when B.Category = 'Use Of Force' and B.allegation_name = 'Excessive Force / On Duty - Injury' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 16.59
when B.Category = 'Use Of Force' and B.allegation_name = 'Excessive Force / On Duty - No Injury' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Excessive Force / Off Duty - Injury' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 16.59
when B.Category = 'Use Of Force' and B.allegation_name = 'Excessive Force / Off Duty - No Injury' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Excessive Force - Use Of Firearm / On Duty - Injury' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 16.59
when B.Category = 'Use Of Force' and B.allegation_name = 'Excessive Force - Use Of Firearm / On Duty - No Injury' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Excessive Force - Use Of Firearm / Off Duty - Injury' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 16.59
when B.Category = 'Use Of Force' and B.allegation_name = 'Excessive Force - Use Of Firearm / Off Duty - No Injury' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'U Converted To C.R. (Records Keeping Only, Initial)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Domestic' and B.allegation_name = 'Domestic Altercation - Physical Abuse' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 15
when B.Category = 'Domestic' and B.allegation_name = 'Domestic Incident - Not Physical' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.11
when B.Category = 'Use Of Force' and B.allegation_name = 'Unnecessary Physical Contact / On Duty - No Injury' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Unnecessary Physical Contact / Off Duty - No Injury' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Unnecessary Display Of Weapon / On Duty' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.11
when B.Category = 'Use Of Force' and B.allegation_name = 'Unnecessary Display Of Weapon / Off Duty' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 7.11
when B.Category = 'Use Of Force' and B.allegation_name = 'Civil Suits - Third Party' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Excessive Force - Taser - Use Of' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Miscellaneous' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Arrestee-During  Arrest' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Arrestee-After Arrest,Prior To Lockup' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Arrestee-Lockup/Deletion' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'No Arrest' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Traffic' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Domestic' and B.allegation_name = 'Domestic' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 19.9
when B.Category = 'Domestic' and B.allegation_name = 'Domestic Altercation/Incident - Off Duty' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 7.11
when B.Category = 'Use Of Force' and B.allegation_name = 'Unnecessary Physical Contact -On Duty' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Unnecessary Physical Contact/ Off -No Injury' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Weapon-Unnecessary Display Of' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.07
when B.Category = 'Use Of Force' and B.allegation_name = 'Excessive Force-Off Duty(Includes Neighbor,Traffic,Tav)' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Excessive Force-Taser Use Of' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Bribery / Official Corruption' and B.allegation_name = 'Solicit / Accept Bribe (Non-Traffic)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.31
when B.Category = 'Bribery / Official Corruption' and B.allegation_name = 'Solicit / Accept Bribe (Traffic)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 9.04
when B.Category = 'Bribery / Official Corruption' and B.allegation_name = 'Extortion' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.31
when B.Category = 'Bribery / Official Corruption' and B.allegation_name = 'Bribe, Failure To Report' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 9.04
when B.Category = 'Bribery / Official Corruption' and B.allegation_name = 'Gratuity' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 9.04
when B.Category = 'Bribery / Official Corruption' and B.allegation_name = 'Recommend Professional Service' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.31
when B.Category = 'Bribery / Official Corruption' and B.allegation_name = 'Use Of Official Position' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 15.38
when B.Category = 'Bribery / Official Corruption' and B.allegation_name = 'An Act To Circumvent Criminal Prosecution' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 15.75
when B.Category = 'Bribery / Official Corruption' and B.allegation_name = 'Gang Affiliation' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.31
when B.Category = 'Bribery / Official Corruption' and B.allegation_name = 'False Testimony In Court' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 15.38
when B.Category = 'Bribery / Official Corruption' and B.allegation_name = 'Miscellaneous' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.31
when B.Category = 'Traffic' and B.allegation_name = 'Misconduct During Issuance Of Citation' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.11
when B.Category = 'Traffic' and B.allegation_name = 'Improper Processing / Reporting / Procedures' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 11.37
when B.Category = 'Traffic' and B.allegation_name = 'Violation (Other Than D.U.I.) - On Duty' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 0.77
when B.Category = 'Traffic' and B.allegation_name = 'Parking Complaints' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 1.06
when B.Category = 'Traffic' and B.allegation_name = 'Fail To Enforce Traffic Regulations' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Traffic' and B.allegation_name = 'Miscellaneous' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 5.04
when B.Category = 'Traffic' and B.allegation_name = 'Preventable Traffic Accident' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Traffic' and B.allegation_name = 'Miscellaneous' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 5.04
when B.Category = 'Criminal Misconduct' and B.allegation_name = 'Murder / Manslaughter, Etc.' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 42.38
when B.Category = 'Criminal Misconduct' and B.allegation_name = 'Assault / Battery, Etc.' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 19.9
when B.Category = 'Criminal Misconduct' and B.allegation_name = 'Criminal Sexual Assault' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 23.21
when B.Category = 'Criminal Misconduct' and B.allegation_name = 'Burglary' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.07
when B.Category = 'Criminal Misconduct' and B.allegation_name = 'Auto Theft' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.07
when B.Category = 'Criminal Misconduct' and B.allegation_name = 'Theft' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.07
when B.Category = 'Criminal Misconduct' and B.allegation_name = 'Shoplifting' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.07
when B.Category = 'Criminal Misconduct' and B.allegation_name = 'Robbery' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.07
when B.Category = 'Criminal Misconduct' and B.allegation_name = 'Drugs / Controlled Substance, Possession Or Sale' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Criminal Misconduct' and B.allegation_name = 'Damage / Trespassing To Property' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 9.6
when B.Category = 'Criminal Misconduct' and B.allegation_name = 'Arson' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 19.97
when B.Category = 'Criminal Misconduct' and B.allegation_name = 'Other Felony' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.66
when B.Category = 'Criminal Misconduct' and B.allegation_name = 'Conspiracy To Commit A Crime' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.66
when B.Category = 'Criminal Misconduct' and B.allegation_name = 'Police Impersonator (Advocate Section Use Only)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.21
when B.Category = 'Criminal Misconduct' and B.allegation_name = 'Other Misdemeanor Arrest' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 15.73
when B.Category = 'Criminal Misconduct' and B.allegation_name = 'Sex Offense Other' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 23.21
when B.Category = 'Criminal Misconduct' and B.allegation_name = 'Judicial Process' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.76
when B.Category = 'Criminal Misconduct' and B.allegation_name = 'Miscellaneous' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 15.73
when B.Category = 'Conduct Unbecoming (Off-Duty)' and B.allegation_name = 'Altercation / Disturbance - Other' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 1.14
when B.Category = 'Conduct Unbecoming (Off-Duty)' and B.allegation_name = 'Altercation / Disturbance - Neighbor' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 1.14
when B.Category = 'Conduct Unbecoming (Off-Duty)' and B.allegation_name = 'Altercation / Disturbance - Traffic' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 1.14
when B.Category = 'Conduct Unbecoming (Off-Duty)' and B.allegation_name = 'Traffic Violations (Other Than D.U.I.)' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 3.26
when B.Category = 'Conduct Unbecoming (Off-Duty)' and B.allegation_name = 'Misdemeanor Arrest' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 9.56
when B.Category = 'Conduct Unbecoming (Off-Duty)' and B.allegation_name = 'Sexual Misconduct' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 23.21
when B.Category = 'Conduct Unbecoming (Off-Duty)' and B.allegation_name = 'Abuse Of Authority' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 15.38
when B.Category = 'Conduct Unbecoming (Off-Duty)' and B.allegation_name = 'Judicial Process/Directive - Contempt' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 6.3
when B.Category = 'Conduct Unbecoming (Off-Duty)' and B.allegation_name = 'Association With Felon' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 7.66
when B.Category = 'Conduct Unbecoming (Off-Duty)' and B.allegation_name = 'Indebtedness To City' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 6.07
when B.Category = 'Conduct Unbecoming (Off-Duty)' and B.allegation_name = 'Drivers License - Revoked / Suspended' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 6.76
when B.Category = 'Conduct Unbecoming (Off-Duty)' and B.allegation_name = 'Equipment Irregularity' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 3.49
when B.Category = 'Conduct Unbecoming (Off-Duty)' and B.allegation_name = 'Weapon Irregularity' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 13.42
when B.Category = 'Conduct Unbecoming (Off-Duty)' and B.allegation_name = 'Vehicle Licensing - City' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.76
when B.Category = 'Conduct Unbecoming (Off-Duty)' and B.allegation_name = 'Vehicle Licensing - State' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.76
when B.Category = 'Conduct Unbecoming (Off-Duty)' and B.allegation_name = 'Residency' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.76
when B.Category = 'Conduct Unbecoming (Off-Duty)' and B.allegation_name = 'Altering Official Documents' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 11.6
when B.Category = 'Conduct Unbecoming (Off-Duty)' and B.allegation_name = 'Miscellaneous' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 8.99
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Absent Without Permission' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Failure To Identify' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 7.66
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Seat Belts' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 0.64
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Conduct Unbecoming' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 0.77
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Compensatory Time' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Employment Action - Shakman Decree' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 14.1
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Slow / No Response' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Secondary/Special Employment' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 14.1
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Court Attendance Irregularities' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Unfit For Duty' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 0.77
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Leaving Assignment (District, Beat, Sector, Court)' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Neglect Of Duty' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Late - Roll Call / Assignment / Court' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Weapon / Ammunition' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 3.49
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Insubordination' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Lunch / Personal Violations' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 13.42
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Misuse Of Department Equipment / Supplies' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 20.52
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Misuse Of Department Records' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Residency' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 17.67
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Eeo Investigations' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 5.89
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Reports' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Inadequate / Failure To Provide Service' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 0.77
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Inventory Procedures' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Traffic Pursuit' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 3.26
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Political Activity' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 14.1
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Miscellaneous' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 8.22
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Forwarded To O.E.C.' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 22.89
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Equal Employment Opportunities Investigations' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 5.89
when B.Category = 'Supervisory Responsibilities' and B.allegation_name = 'Initiate Proper Action' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 7.66
when B.Category = 'Supervisory Responsibilities' and B.allegation_name = 'Properly Direct Subordinate' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 17.67
when B.Category = 'Supervisory Responsibilities' and B.allegation_name = 'Properly Review / Inspect Subordinate' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 17.67
when B.Category = 'Supervisory Responsibilities' and B.allegation_name = 'Fail To Obtain A Complaint Register Number' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Supervisory Responsibilities' and B.allegation_name = 'Conduct An Improper / Inadequate Investigation' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 7.66
when B.Category = 'Supervisory Responsibilities' and B.allegation_name = 'Failure To Ensure - Civil Rights' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 5.89
when B.Category = 'Supervisory Responsibilities' and B.allegation_name = 'Miscellaneous' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 0.08
when B.Category = 'Supervisory Responsibilities' and B.allegation_name = 'State Civil Suit' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 17.67
when B.Category = 'Supervisory Responsibilities' and B.allegation_name = 'Federal Civil Suit' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 17.67
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Use / Abuse Drugs / Controlled Substance - On Duty' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Use / Abuse Drugs / Controlled Substance - Off Duty' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'D.U.I., Drugs / Controlled Substance - On Duty' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'D.U.I., Drugs / Controlled Substance - Off Duty' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Positive Drug Screen - Originated From Complaint' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Positive Drug Screen - Promotion Physical' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Positive Drug Screen - Other Physical Exam' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Refusal Of Direct Order To Provide Drug Screen Specimen' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 4.42
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Just Cause' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Miscellaneous' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Money / Property' and B.allegation_name = 'Damage Property' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 18.81
when B.Category = 'Illegal Search' and B.allegation_name = 'Failure To Leave Notification' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 9.6
when B.Category = 'Money / Property' and B.allegation_name = 'Missing Money Or Property' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.95
when B.Category = 'Illegal Search' and B.allegation_name = 'Wrong Address' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 9.6
when B.Category = 'Illegal Search' and B.allegation_name = 'Improper Service Of Warrant' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 10.39
when B.Category = 'Illegal Search' and B.allegation_name = 'Improper Documentation' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 11.6
when B.Category = 'Illegal Search' and B.allegation_name = 'Miscellaneous' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 10.39
when B.Category = 'Medical' and B.allegation_name = 'Working While On The Medical / Iod' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 16.59
when B.Category = 'Medical' and B.allegation_name = 'Altering Medical Documents' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 13.8
when B.Category = 'Medical' and B.allegation_name = 'Medical Roll Violation' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 13.8
when B.Category = 'Medical' and B.allegation_name = 'False Reporting Of Iod' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Medical' and B.allegation_name = 'Refusal Of Direct Order For Physical' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Medical' and B.allegation_name = 'Refusal Of Direct Order For Psychological' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Medical' and B.allegation_name = 'Violation Of Medical Restrictions' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 1.42
when B.Category = 'Medical' and B.allegation_name = 'Miscellaneous' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 7.63
when B.Category = 'Excessive Force' and B.allegation_name = 'Firearm Discharge With Hits / On Duty' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 20.52
when B.Category = 'Use Of Force' and B.allegation_name = 'Firearm Discharge With Hits / Off Duty' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 20.52
when B.Category = 'Use Of Force' and B.allegation_name = 'Coercion - Violence' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.11
when B.Category = 'Use Of Force' and B.allegation_name = 'Coercion - Threat Of Arrest/Charges' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.11
when B.Category = 'Use Of Force' and B.allegation_name = 'Coercion -Threat Of Non-Criminal Govt Enforcement (Ie. Dcfs)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.11
when B.Category = 'Use Of Force' and B.allegation_name = 'Coercion - Miscellaneous' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Shots Fired - No Hits' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 12.28
when B.Category = 'Use Of Force' and B.allegation_name = 'Shots Fired - Destruction Of Animal' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 2.1
when B.Category = 'Use Of Force' and B.allegation_name = 'Taser Discharge' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Oc Discharge' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Miscellaneous' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Compliance With Motor Vehicle Pursuit Requirements' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 0.77
when B.Category = 'Use Of Force' and B.allegation_name = 'Closed Hand Strike (Punch)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Open Hand Strike (Slap)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Elbow Strike' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Knee Strike' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Kicked' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Stomped / Stepped On' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Choked' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Take Down (Thrown To Ground)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Dragged' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Impact Weapon - Authorized (Baton / Asp)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.88
when B.Category = 'Use Of Force' and B.allegation_name = 'Impact Weapon - Unauthorized (Flashlight, Handcuffs, Etc)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.88
when B.Category = 'Use Of Force' and B.allegation_name = 'Firearm Used As An Impact Weapon' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 21.83
when B.Category = 'Use Of Force' and B.allegation_name = 'Oc Chemical Weapon' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Taser (Probe Discharge)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Taser (Contact Stun)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Taser (Laser Targeted)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Taser (Spark Displayed)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Vehicle' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 18.81
when B.Category = 'Use Of Force' and B.allegation_name = 'Miscellaneous' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Closed Hand Strike (Punch)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Open Hand Strike (Slap)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Elbow Strike' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Knee Strike' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Kicked' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Stomped / Stepped On' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Choked' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Take Down (Thrown To Ground)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Dragged' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Impact Weapon - Authorized (Baton / Asp)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.88
when B.Category = 'Use Of Force' and B.allegation_name = 'Impact Weapon - Unauthorized (Flashlight, Handcuffs, Etc)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.88
when B.Category = 'Use Of Force' and B.allegation_name = 'Firearm Used As An Impact Weapon' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 21.83
when B.Category = 'Use Of Force' and B.allegation_name = 'Oc Chemical Weapon' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Taser (Probe Discharge)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Taser (Contact Stun)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Taser (Laser Targeted)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Taser (Spark Displayed)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Canine' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Vehicle' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 18.81
when B.Category = 'Use Of Force' and B.allegation_name = 'Miscellaneous' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Closed Hand Strike (Punch)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.17
when B.Category = 'Use Of Force' and B.allegation_name = 'Closed Hand Strike (Punch)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.17
when B.Category = 'Use Of Force' and B.allegation_name = 'Open Hand Strike (Slap)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.17
when B.Category = 'Use Of Force' and B.allegation_name = 'Open Hand Strike (Slap)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.17
when B.Category = 'Use Of Force' and B.allegation_name = 'Elbow Strike' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Kicked' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Kicked' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Stomped / Stepped On' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Choked' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Choked' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Take Down (Thrown To Ground)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Take Down (Thrown To Ground)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Impact Weapon - Authorized (Baton / Asp)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.88
when B.Category = 'Use Of Force' and B.allegation_name = 'Impact Weapon - Authorized (Baton / Asp)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.88
when B.Category = 'Use Of Force' and B.allegation_name = 'Impact Weapon - Unauthorized (Flashlight, Handcuffs, Etc)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.88
when B.Category = 'Use Of Force' and B.allegation_name = 'Impact Weapon - Unauthorized (Flashlight, Handcuffs, Etc)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.88
when B.Category = 'Use Of Force' and B.allegation_name = 'Firearm Used As An Impact Weapon' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 21.83
when B.Category = 'Use Of Force' and B.allegation_name = 'Oc Chemical Weapon' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Oc Chemical Weapon' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Vehicle' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 18.81
when B.Category = 'Use Of Force' and B.allegation_name = 'Miscellaneous' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Miscellaneous' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Firearm Discharge With Hits - Handgun' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 20.52
when B.Category = 'Use Of Force' and B.allegation_name = 'Firearm Discharge With Hits - Handgun' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 20.52
when B.Category = 'Use Of Force' and B.allegation_name = 'Firearm Discharge With Hits - Miscellaneous Firearm' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 20.52
when B.Category = 'Use Of Force' and B.allegation_name = 'Firearm Discharge No Hits - Handgun' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 12.28
when B.Category = 'Use Of Force' and B.allegation_name = 'Firearm Discharge No Hits - Handgun' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 12.28
when B.Category = 'Use Of Force' and B.allegation_name = 'Firearm Discharge No Hits - Miscellaneous Firearm' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 12.28
when B.Category = 'Use Of Force' and B.allegation_name = 'Unjustified Pointing Of Firearm - Handgun' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 12.28
when B.Category = 'Use Of Force' and B.allegation_name = 'Unjustified Pointing Of Firearm - Handgun' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 12.28
when B.Category = 'Use Of Force' and B.allegation_name = 'Injury' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 16.59
when B.Category = 'Use Of Force' and B.allegation_name = 'No Injury' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Domestic' and B.allegation_name = 'Stalking' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.11
when B.Category = 'Domestic' and B.allegation_name = 'Harassment' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 19.9
when B.Category = 'Domestic' and B.allegation_name = 'Verbal Abuse' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.11
when B.Category = 'Domestic' and B.allegation_name = 'Threats' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.11
when B.Category = 'Domestic' and B.allegation_name = 'Violation Of Court Order' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 11.37
when B.Category = 'Domestic' and B.allegation_name = 'Miscellaneous' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 12.79
when B.Category = 'Use Of Force' and B.allegation_name = 'Push/Pull/Grab' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Push/Pull/Grab' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Pushed To Ground' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Pushed To Ground' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Handcuff Too Tight' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Handcuff Too Tight' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Twisted Extremities (Wrist/Arm/Leg)' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Twisted Extremities (Wrist/Arm/Leg)' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 6.8
when B.Category = 'Use Of Force' and B.allegation_name = 'Miscellaneous' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Use Of Force' and B.allegation_name = 'Miscellaneous' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Unknown' and B.allegation_name = 'Accident - Fatal' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 19.48
when B.Category = 'Unknown' and B.allegation_name = 'Accident - Injury' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 16.59
when B.Category = 'Unknown' and B.allegation_name = 'Accident - No Injury' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Money / Property' and B.allegation_name = 'Money - Failed To Inventory' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 18.81
when B.Category = 'Money / Property' and B.allegation_name = 'Property - Failed To Inventory' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.07
when B.Category = 'Money / Property' and B.allegation_name = 'Property - Failed To Issue Receipt' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.07
when B.Category = 'Traffic' and B.allegation_name = 'Citation' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 1.14
when B.Category = 'Traffic' and B.allegation_name = 'Traffic Crash Report' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 7.66
when B.Category = 'Unknown' and B.allegation_name = 'Unauthorized Weapon' and B.on_duty = FALSE and B.citizen_dept = 'dept' then 3.49
when B.Category = 'Unknown' and B.allegation_name = 'Lost / Stolen Weapon' and B.on_duty = FALSE and B.citizen_dept = 'dept' then 3.49
when B.Category = 'Unknown' and B.allegation_name = 'Failure To Register' and B.on_duty = FALSE and B.citizen_dept = 'dept' then 7.66
when B.Category = 'Unknown' and B.allegation_name = 'Other' and B.on_duty = FALSE and B.citizen_dept = 'dept' then 11.15
when B.Category = 'Unknown' and B.allegation_name = 'Federal' and B.on_duty = FALSE and B.citizen_dept = 'dept' then 17.67
when B.Category = 'Unknown' and B.allegation_name = 'Wrong Ammunition' and B.on_duty = FALSE and B.citizen_dept = 'dept' then 3.49
when B.Category = 'Unknown' and B.allegation_name = 'Lost / Stolen Weapon' and B.on_duty = FALSE and B.citizen_dept = 'dept' then 3.49
when B.Category = 'Unknown' and B.allegation_name = 'Failure To Register' and B.on_duty = FALSE and B.citizen_dept = 'dept' then 7.66
when B.Category = 'Unknown' and B.allegation_name = 'Other' and B.on_duty = FALSE and B.citizen_dept = 'dept' then 11.15
when B.Category = 'Money / Property' and B.allegation_name = 'Missing Money' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 18.81
when B.Category = 'Money / Property' and B.allegation_name = 'Missing Property' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.07
when B.Category = 'Money / Property' and B.allegation_name = 'Missing Both' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.95
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Accident - Property Damage' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 18.81
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'With Keys' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.07
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Without Keys' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.07
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Street' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 0.73
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Facility' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 18.81
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Vehicle' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 18.81
when B.Category = 'Money / Property' and B.allegation_name = 'Money - Failed To Issue Receipt' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 4.05
when B.Category = 'Criminal Misconduct' and B.allegation_name = 'Contempt' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.76
when B.Category = 'Unknown' and B.allegation_name = 'Sexual Harassment' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 23.21
when B.Category = 'Unknown' and B.allegation_name = 'Racial' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 5.89
when B.Category = 'Unknown' and B.allegation_name = 'Ageism' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 5.89
when B.Category = 'Unknown' and B.allegation_name = 'Sexual Orientation' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 5.89
when B.Category = 'Unknown' and B.allegation_name = 'Gender' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 5.89
when B.Category = 'Unknown' and B.allegation_name = 'Hostile Work Environment' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 3.18
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Fail To Submit' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Improper' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 0.77
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'FALSE' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 8.22
when B.Category = 'Unknown' and B.allegation_name = 'Accident - Fatal' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 19.48
when B.Category = 'Unknown' and B.allegation_name = 'Accident - Injury' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 16.59
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Amphetamines' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Benzodiazepine' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Benzodiazepine' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Opiate' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Opiate' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Propoxyphene' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Marijuana' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Marijuana' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Cocaine' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Cocaine' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Other' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Medical' and B.allegation_name = 'Timely Notification To Unit' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Medical' and B.allegation_name = 'Failure To Appear At Mss' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Medical' and B.allegation_name = 'Failure To Provide Proper Documentation' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 13.8
when B.Category = 'Medical' and B.allegation_name = 'Not At Home' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Use Of Force' and B.allegation_name = 'Firearm Discharge With Hits - Handgun' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 20.52
when B.Category = 'Use Of Force' and B.allegation_name = 'Firearm Discharge With Hits - Shotgun' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 20.52
when B.Category = 'Use Of Force' and B.allegation_name = 'Firearm Discharge With Hits - Rifle / Assault Weapon' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 20.52
when B.Category = 'Use Of Force' and B.allegation_name = 'Firearm Discharge With Hits - Miscellaneous Firearm' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 20.52
when B.Category = 'Use Of Force' and B.allegation_name = 'Firearm Discharge With Hits - Handgun' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 20.52
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Dui-No Accident' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Unknown' and B.allegation_name = 'Non Arrestee' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 21.18
when B.Category = 'Medical' and B.allegation_name = 'Failure To Receive Approval For Travel' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 6.3
when B.Category = 'Medical' and B.allegation_name = 'Misrepresentation Of Injury' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 11.37
when B.Category = 'Medical' and B.allegation_name = 'Disability' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 5.89
when B.Category = 'Incident' and B.allegation_name = 'Firearm Discharge' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Incident' and B.allegation_name = 'Other Use Of Force' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Incident' and B.allegation_name = 'Taser Discharge' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Incident' and B.allegation_name = 'Incident in Police Custody' and B.on_duty = FALSE and B.citizen_dept = 'citizen' then 13.42
when B.Category = 'Operation/Personnel Violations' and B.allegation_name = 'Vehicle Licensing - State' and B.on_duty = TRUE and B.citizen_dept = 'dept' then 7.21
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Positive Drug Screen - Recruit' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Drug / Alcohol Abuse' and B.allegation_name = 'Drug/Substance Abuse' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 7.08
when B.Category = 'Unknown' and B.allegation_name = 'Motor Vehicle Fatality - On Duty' and B.on_duty = TRUE and B.citizen_dept = 'citizen' then 19.48
                else 0
                end) as weights
     FROM  data_officerallegation A
    LEFT JOIN data_allegationcategory B on B.id = A.allegation_category_id
GROUP BY A.officer_id, B.category, B.allegation_name, B.on_duty, B.citizen_dept);


--Creating employment duration table and impute missing value of end date with the maximum of end date assuming these officers are still active
drop view if exists employment_duration cascade;
create TEMP view employment_duration as (SELECT A.officer_id, A.effective_date,
       case when A.end_date is Null then (SELECT max(end_date) from data_officerhistory) else A.end_date end as end_date
       from data_officerhistory A);
--Creating officer duration table which consists of officers along with the number of years they worked, for the last 50 years
drop view if exists officer_duration cascade;
create TEMP view officer_duration as (select officer_id, (max(end_date) - min(effective_date))/365 as duration
from employment_duration group by officer_id
having ((max(end_date) - min(effective_date))>0) and (min(effective_date) > ((SELECT max(end_date) from data_officerhistory) - 365*50))
);

-- Final CSS score table --> Complaint count * weights / employment duration for EACH officer
drop view if exists officer_css cascade;
create TEMP view officer_css as (select A.officer_id, (sum(A.count * A.weights) / min((B.duration+1))) as CSS
from allegation A inner join officer_duration B on A.officer_id = B.officer_id
group by A.officer_id);

-- select * from officer_css;
-- select officer_id, category, max(CSS) from officer_css group by officer_id, category;
-- select count(distinct officer_id) from officer_css;
-- select distinct officer_id from officer_css;
-- select * from allegation;
-- select * from officer_duration;

drop view if exists officer_css_salary cascade;
create TEMP view officer_css_salary as (select A.officer_id, C.category, round(max(A.CSS),2) as CSS, max(B.salary) as Salary, D.gender
from officer_css A left join data_salary B on A.officer_id = B.officer_id
    left join allegation C on A.officer_id = C.officer_id
    left join data_officer D on B.officer_id = D.id
where salary is not null
group by A.officer_id, C.category, D.gender);

select * from officer_css_salary;


--Question 2
drop view if exists xyz cascade;
create TEMP view xyz as (select B.award_type, (2021-A.birth_year) as age, A.gender,  A.race, count(A.id) as officer_id_count,count(A.id)+5 as officer_id_count5
from data_officer A inner join data_award B on A.id = B.officer_id
group by B.award_type, A.birth_year, A.race, A.gender);
select count(*) from xyz;

select * from xyz;