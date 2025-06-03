create database hr_project;
select * from hr_data;
##kpi1
select Department,avg(Attrition_number) from (select Department,
case when Attrition = "Yes" then 1 else 0 end as Attrition_number From hr_data)as KPi1
group by Department;

####KPI 2
select avg(HourlyRate) from hr_data
group by jobRole,Gender having JobRole="Research Scientist" and Gender="Male";

##kpi3
select Avg(Attrition_Rate),MonthlyIncomeStat from (
SELECT 
    CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END AS Attrition_Rate,
    CASE 
        WHEN MonthlyIncome < 20000 THEN 'LOW'
        WHEN MonthlyIncome < 35000 THEN 'MID'
        ELSE 'HIGH'
    END AS MonthlyIncomeStat
FROM Hr_data) as KPI3
group by MonthlyIncomeStat;


##kpi4
select Department,avg(TotalWorkingYears) from hr_data
group by Department;


#kpi5
select JobRole,avg(WorkLifeBalance) from hr_data
group by JobRole;

##kpi6
SELECT YearsSinceLastPromotion, AVG(Attrition_number) AS Avg_Attrition_rate
FROM (
    SELECT YearsSinceLastPromotion,
           CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END AS Attrition_number
    FROM hr_data
) AS subquery
GROUP BY YearsSinceLastPromotion
ORDER BY YearsSinceLastPromotion;





