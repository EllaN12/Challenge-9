Drop Table Departments;
Drop Table Employees;
Drop Table Department_Employees;
Drop Table department_Managers;
Drop Table Salaries;
Drop Table Titles;

CREATE TABLE Departments (
  Dept_No VARCHAR(10) PRIMARY KEY,
  Dept_Name VARCHAR(20) NOT NULL
);

CREATE TABLE Titles (
  Title_ID VARCHAR(10) PRIMARY KEY,
  Title VARCHAR(50) NOT NULL);


CREATE TABLE Employees (
  Emp_No INT PRIMARY KEY,
  Emp_title_id VARCHAR(20) NOT NULL,
  Birth_date DATE NOT NULL,
  First_Name VARCHAR(50) NOT NULL,
  Last_Name VARCHAR(50) NOT NULL,
  Sex VARCHAR(10) NOT NULL,
  Hire_date DATE NOT NULL,
  CONSTRAINT unique_emp_no UNIQUE (Emp_No),
  FOREIGN KEY (Emp_title_id) REFERENCES Titles(Title_ID)
);

CREATE TABLE Department_Employees (
  Emp_No INT Not NULL,
  Dept_No VARCHAR(10) NOT NULL,
  FOREIGN KEY (Dept_No) REFERENCES Departments(Dept_No),
  FOREIGN KEY (Emp_No) REFERENCES Employees(Emp_No),
  PRIMARY KEY (Emp_No, Dept_No)
);


CREATE TABLE department_Managers (
  Dept_No VARCHAR(10) Not NULL,
  Emp_No INT NOT NULL,
  FOREIGN KEY (Dept_No) REFERENCES Departments(Dept_No),
  FOREIGN KEY (Emp_No) REFERENCES Employees(Emp_No),
  PRIMARY KEY (Emp_No)
);

CREATE TABLE Salaries (
  Emp_No INT NOT NULL PRIMARY KEY ,
  Salary INT NOT NULL,
  FOREIGN KEY (Emp_No) REFERENCES Employees(Emp_No)
);
