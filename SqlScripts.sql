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