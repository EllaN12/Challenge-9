
-- List the employee number, last name, first name, sex, and salary of each employee --
Select e.Emp_No, e.Last_Name, e.First_Name, e.Sex, s.Salary
From Employees as e
inner join Salaries as s ON
s.Emp_No=e.Emp_No;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B --
Select First_Name, Last_Name, Sex
From Employees
Where First_Name = 'Hercules' AND Last_Name like 'B%';

-- List the first name, last name, and hire date for the employees who were hired in 1986--
Select First_Name, Last_Name, Hire_date
From Employees
Where extract (Year FROM Hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name__
Select e.Last_Name, e.First_Name, d.Dept_Name, dm.Dept_No, dm.Emp_No
From Employees as e
inner join department_Managers as dm on 
e.Emp_No = dm.Emp_No
inner join Departments as d on 
dm.Dept_No = d.Dept_No;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name--
Select e.Last_Name, e.First_Name, d.Dept_Name, de.Dept_No, de.Emp_No
From Employees as e
inner join Department_Employees as de on 
e.Emp_No = de.Emp_No
inner join Departments as d on 
de.Dept_No = d.Dept_No;

--List each employee in the Sales department, including their employee number, last name, and first name--
Select Last_Name, First_Name, Emp_No
From Employees 
Where Emp_No 
IN (
    Select Emp_No
     From Department_Employees
     Where Dept_No 
     In (
	      Select Dept_No
	      From Departments
	      Where Dept_Name = 'Sales' ));
		  
-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.--
     
Select e.Last_Name, e.First_Name, d.Dept_Name, de.Emp_No
From Employees as e
inner join Department_Employees as de on 
e.Emp_No = de.Emp_No
inner join Departments as d on 
de.Dept_No = d.Dept_No
Where d.Dept_No 
IN (
	Select Dept_No
    From Departments
    Where Dept_Name = 'Sales' OR Dept_Name = 'Development');	

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
Select Last_Name, count (Last_Name) AS "Frequency"
From Employees 
Group By Last_Name
Order by "Frequency" DESC;