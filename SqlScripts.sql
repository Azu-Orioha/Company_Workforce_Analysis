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
	


/* 9.Find the gender of employee with emp_no 10007. * /



/* 10. /


