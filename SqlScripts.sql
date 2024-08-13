/* 1. Retrieve the first name and last name of all employees*/ 

select  First_name as First_Name, last_name as Surname  from  Employees

/* 2. Find the department numbers and names. */
select 
	dep_no as Department_Number, 
	dep_name as Department_Name 
from departments

/* 3.Get the total number of employees */
Select count (*) as Total_Number_of_Employees from  Employees


/* 4.Find the average salary of all employees. */
Select avg(Salary)  from salaries

/* 5.Retrieve the birth date and hire date of employee with emp_no 10003.*/
select  emp_no, 
		CONVERT(DATE, birth_date) as DOB,
		CONVERT(DATE,hire_date)  as Date_of_Hire
from Employees
where emp_no = 10003

/* 6. Find the titles of all employees*/
select ee.first_name, ee.last_name, et.title from Employees ee
inner join employee_titles et 
on et.emp_no =  ee.emp_no

/* 7. Get the total number of departments. */
select count(distinct dep_name) as Number_of_Departments from departments

/* 8.   Retrieve the department number and name where employee with emp_no 10004 works*/

select dd.dep_no as Department_number,
	dd.dep_name as Department_name from departments dd
	inner join dept_emp de on
	dd.dep_no = de.dept_no
	where de.emp_no = 10004
	


/* 9.Find the gender of employee with emp_no 10007. */

select emp_no, first_name, last_name, gender  from employees
where emp_no = 10007

 
/* 10.Get the highest salary among all employees.*/

Select e.emp_no, max(salary) As Highest_Salary from
salaries s
Join employees e on
e.emp_no= s.emp_no


Select max(salary) As highest_salary
FROM
(
	Select s.salary from employees e 
	join salaries s on e.emp_no = s.emp_no

) As Subquery 

/* 11.Retrieve the names of all managers along with their department names.*/

select 
	ee.first_name as First_Name, 
	ee.last_name as Last_Name,
	dd.dep_name as Department_Name,
	tt.title
from employees as ee
	join dept_manager dm on dm.emp_no = ee.emp_no
	join departments dd on dd.dep_no = dm.dept_no
	join employee_titles tt on tt.emp_no = ee.emp_no 
WHERE tt.title = 'Manager' 

select * from departments

/* 12.Find the department with the highest number of employees. */
select count(ee.emp_no) as Number_Of_Employees, dd.dep_name as Department from Employees ee
join dept_emp de on ee.emp_no = de.emp_no
join departments dd on dd.dep_no = de.dept_no
Group by dep_name
order by dd.dep_Name Asc

/*12B*/
SELECT 
    m.first_name, 
    m.last_name, 
    d.dep_name
FROM 
    (SELECT 
         e.emp_no, 
         e.first_name, 
         e.last_name, 
         dm.dept_no
     FROM 
         Employees e
     JOIN 
         dept_manager dm ON e.emp_no = dm.emp_no) AS m
JOIN 
    (SELECT 
         d.dep_no, 
         d.dep_name
     FROM 
         departments d) AS d ON m.dept_no = d.dep_no;

/* 13.Retrieve the employee number, first name, last name, and salary of 
employees earning more than $60,000. */

select  ee.emp_no, ee.first_name as First_Name, ee.last_name as Last_Name, ss.salary 
from employees  ee
	join salaries ss on ee.emp_no = ss.emp_no
	where ss.salary > 60000
	order by salary

/* 14.Get the average salary for each department. */
select dd.dep_name, avg(salary) As Average_Salary from salaries ss
join dept_emp de on de.emp_no = ss.emp_no
join departments dd on dd.dep_no = de.dept_no
group by dd.dep_name

/* 15.Retrieve the employee number, first name, last name, and title of all employees who are 
currently managers. */

Select emp_no, first_name, last_name from employees 
select * from employee_titles
select * from dept_manager
select * from dept_emp

/* 16. Find the total number of employees in each department.*/

select count(ee.emp_no), dep_name
from employees ee 
join dept_emp de on ee.emp_no = de.emp_no
Join departments dd on de.dept_no = dd.dep_no
Group by dep_name

/* 17. Retrieve the department number and name 
where the most recently hired employee works.*/  

select dd.dep_no, dd.dep_name 
from departments dd
join dept_emp de on de.dept_no = dd.dep_no
Join Employees ee on ee.emp_no = de.emp_no
where ee.hire_date = 
	(select Max(hire_date) from employees)

/* 18.Get the department number, name, and average salary for 
departments with more than 3 employees. */
select dd.dp_no, dd.dep_name from departments dd
join 


select  count(ee.emp_no), dd.dep_name from employees  ee
join dept_emp de on de.emp_no = ee.emp_no
join departments dd on de.dept_no = dd.dep_no
group by dep_name


/* 19.Retrieve the employee number, first name, last name, and 
title of all employees hired in 2005.*/
select  ee.emp_no, ee.first_name, tt.title from employees  ee
join employee_titles tt on tt.emp_no = ee.emp_no
where ee.hire_date between '2005-01-01' AND  '2005-12-31';

/* 20.Find the department with the highest average salary. */
select TOP 1 dd.dep_name, avg(ss.salary)  Average_Amount from departments dd
join dept_emp de on  de.dept_no = dd.dep_no
join salaries ss on ss.emp_no =  de.emp_no
group by dd.dep_name
Order by Average_Amount desc


/* 21.  Retrieve the employee number, first name, last name, and 
salary of employees hired before the year 2005. */

select ee.emp_no, ee.first_name, ee.last_name, ss.salary from Employees ee
join salaries ss on ss.emp_no =  ee.emp_no
where ee.hire_date < '2005-01-01'

select * from Employees


/*22.Get the department number, name, and total number of employees 
for departments with a female manager. */

select dep_no, dep_name from departments dd
select * from dept_emp


/*23. Retrieve the employee number, first name, last name, and department
name of employees who are currently working in the Finance department*/

select ee.emp_no, ee.first_name, ee.last_name, dd.dep_name as Department_Name
from Employees ee
 
join dept_emp as de on ee.emp_no = de.emp_no 
join departments as dd on dd.dep_no = dept_no
where dd.dep_name = 'Finance'

/*24.  Find the employee with the highest salary in each department. */


select ee.first_name, dd.dep_name, ss.salary as highest_salary from Employees ee
join salaries ss on ss.emp_no = ee.emp_no
join dept_emp de on ee.emp_no = de.emp_no
join departments dd on  dd.dep_no = de.dept_no
WHERE ss.salary =
			(
			select max(s2.salary) from salaries s2
			join dept_emp de2 on s2.emp_no = de2.emp_no
			join departments  on dd.dep_no = de2.dept_no
			)



 /*25. Retrieve the employee number, first name, last name, and department 
 name of employees who  have held a managerial position.*/
 
 
 select ee.emp_no, ee.first_name, ee.last_name, dd.dep_name, et.title
  from employees ee
 JOIN dept_emp de on de.emp_no = ee.emp_no
 join departments dd on dd.dep_no = de.dept_no
 join employee_titles et on ee.emp_no = et.emp_no
 where title like '%Manager'


  
  /*26.Get the total number of employees who have held the title "Senior Manager.".*/
  select count (ee.emp_no)
  from employees ee
 JOIN dept_emp de on de.emp_no = ee.emp_no
 join departments dd on dd.dep_no = de.dept_no
 join employee_titles et on ee.emp_no = et.emp_no
 where title like 'Senior Manager'


  /*27.Retrieve the department number, name, and the number of employees 
  who have worked there for more than 5 years. .*/

 select dd.dep_name, dd.dep_no, count(ee.emp_no) as Number_of_Emmployees
 from departments dd
  join dept_emp de on de.dept_no = dd.dep_no
  join employees ee on ee.emp_no = de.emp_no
  where  DATEDIFF(YEAR, ee.hire_date, GETDATE()) >=20
  group by dd.dep_name, dd.dep_no
  




   
  /*28.Find the employee with the longest tenure in the company. .*/
 SELECT 
    ee.emp_no,
    ee.first_name,
    ee.last_name,
    dd.dep_no,
    dd.dep_name,
    DATEDIFF(YEAR, ee.hire_date, GETDATE()) AS Years_of_Service
FROM 
    employees ee
JOIN 
    dept_emp de ON ee.emp_no = de.emp_no
JOIN 
    departments dd ON de.dept_no = dd.dep_no
WHERE 
    DATEDIFF(YEAR, ee.hire_date, GETDATE()) = (
        SELECT 
            MAX(DATEDIFF(YEAR, e.hire_date, GETDATE()))
        FROM 
            employees e
    )
ORDER BY 
    ee.hire_date ASC;

/*28b. Find the employee with the longest tenure in the company by Department. .*/
SELECT 
	dd.dep_no,
	dd.dep_name, 
	ee.first_name,
	ee.last_name,
	DATEDIFF(YEAR, ee.hire_date, GETDATE()) as Years_of_Service
from 
	departments dd 

JOIN 
	dept_emp de ON dd.dep_no = de.dept_no

JOIN 
	employees ee on ee.emp_no = de.emp_no

JOIN (SELECT 
	d.dept_no, MAX(DATEDIFF(YEAR, e.hire_date, GETDATE())) AS MaxYears
	FROM
	Employees e
	JOIN 
	 dept_emp d ON e.emp_no = d.emp_no
	 GROUP BY d.dept_no)
	 AS  MaxYears ON MaxYears.dept_no = dd.dep_no
	 where 
	 DATEDIFF(YEAR, ee.hire_date, GETDATE())  = MaxYears.MaxYears


/*29. Retrieve the employee number, first name, last name, and title 
  of employees whose hire date is between '2005-01-01' and '2006-01-01'.  .*/

  SELECT 
    ee.emp_no,
	ee.first_name, 
	ee.last_name, 
	et.title
FROM 
	employees ee 
  JOIN employee_titles et ON  ee.emp_no = et.emp_no
WHERE
	ee.hire_date between '2005-01-01' and '2006-01-01'

  
 
  
  
/*30. Get the department number, name, and the oldest employee's birth 
  date for each department..*/

SELECT 
	dd.dep_name,
	MIN(ee.birth_date) as Oldest_Staff
	
FROM 
	departments  dd
	JOIN  dept_emp de ON de.dept_no = dd.dep_no
	JOIN  employees ee ON ee.emp_no = de.emp_no

GROUP by dd.dep_name;

	
FROM 
     departments dd
join dept_emp de ON dept_no = dd.dep_no
Join (
        
	Select max(birth_date) from Employees ee
	JOIN dept_emp de2 ON de2.emp_no = ee.emp_no

	)  as Oldest_in_Department


/*31. Show the number of years each employee hhas worked for .*/
  select 
	dd.dep_name, 
	dd.dep_no, ee.first_name, 
	Year(ee.hire_date) as Year_of_Hire,
	DATEDIFF(YEAR, ee.hire_date, GETDATE()) AS Years_worked
  FROM departments dd
  join dept_emp de on de.dept_no = dd.dep_no
  join employees ee on ee.emp_no = de.emp_no
  
  
 