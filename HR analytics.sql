select * from hr_1;
select * from hr_2;


# KPI 1 (Average Attrition rate for all Departments)

select e.Department,e.`Count of Attrition` as "Count of Attrition",r.`Count of Attrition` as "Count of Attrition",concat(round((r.`Count of Attrition`/e.`Count of Attrition`)*100,0)," ","%") as "Attrition Rate"
 from hr as e inner join hrr as r on e.Department=r.Department order by concat(round((r.`Count of Attrition`/e.`Count of Attrition`)*100,0)," ","%") desc ;

# KPI 2 (Average Hourly rate of Male Research Scientist)

select e.JobRole,e.Gender,round(avg(e.hourlyrate),0) as "Average of HourlyRate" from hr_1 as e inner join hr_2 as r on e.EmployeeNumber=r.employeeid where e.JobRole="Research Scientist" and e.gender="Male" ;

# KPI 3 (Attrition rate Vs Monthly income stats)

select e.attrition Attrition,sum(r.MonthlyIncome) "Sum of MonthlyIncome",round(avg(r.MonthlyIncome),0) "Average of MonthlyIncome",max(r.MonthlyIncome) "Max of MonthlyIncome",min(r.MonthlyIncome) "Min of MonthlyIncome" 
from hr_1 as e inner join hr_2 as r on e.EmployeeNumber=r.employeeid where Attrition="Yes"; 

# KPI 4 (Average working years for each Department)

select e.department Department ,round(avg(r.totalworkingyears),2) "Average of TotalWorkingYears" from hr_1 as e inner join hr_2 as r on e.EmployeeNumber=r.employeeid group by e.department ;

# KPI 5 (Job Role Vs Work life balance)

select WorkLifeBalance,count(e.jobrole) as "Count of JobRole"from hr_1 as e inner join hr_2 as r on e.EmployeeNumber=r.employeeid group by r.WorkLifeBalance order by WorkLifeBalance;

# KPI 6 (Attrition rate Vs Year since last promotion relation)

select  r.YearsSinceLastPromotion,concat(round(count(e.attrition)/(select count(Attrition) from hr_1 where attrition="Yes")*100,2)," ","%")
as" AttritionRate" from hr_1 as e inner join hr_2 as r on e.EmployeeNumber=r.employeeid group by e.attrition,r.YearsSinceLastPromotion having Attrition="yes" order by r.YearsSinceLastPromotion  ;























