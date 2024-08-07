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

/* 13.*/
/* 14.*/
/* 15.*/
/* 16.*/
/* 17.*/
/* 18.*/
/* 19.*/
/* 20.*/

