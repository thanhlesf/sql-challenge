-- Drop all tables if exists.
DROP TABLE departments;
DROP TABLE employees;
DROP TABLE dept_manager;
DROP TABLE dept_emp;
DROP TABLE salaries;
DROP TABLE titles;
--------------------
-- Create table for departments
CREATE TABLE departments (
	dept_no VARCHAR(30) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(100) NOT NULL
);

-- Create table for employees
CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
	title_id VARCHAR(5) NOT NULL,
	birth_date Date NOT NULL,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	gender VARCHAR(100) NOT NULL,
	hire_date Date NOT NULL
);

-- Create table for dept_emp
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(30) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Create table for dept_manager
CREATE TABLE dept_manager (
	dept_no VARCHAR(30) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create table for salaries
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT NOT NULL
);

-- Create table for titles
CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR(100) NOT NULL
);

-- Create command for view each table
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;
SELECT * FROM salaries;
SELECT * FROM titles;

-- Questions:
-- Do we need to have start date and end date for each table? and why?
-- Do we need Primary Key for each tables? and why? Id Serial Key?
-- When do we use References vs Alter Table?
-- 
------------------
