
Data Analysis
------------------
-- 1) List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT 
	e.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	e.gender as "Gender",
	s.salary as "Salary"
FROM employees as e
JOIN salaries as s
ON e.emp_no=s.emp_no
ORDER BY e.emp_no;

-- 2)List first name, last name, and hire date for employees who were hired in 1986.

SELECT 
	e.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	e.hire_date as "Hire Date"	
FROM employees as e
WHERE date_part('year', hire_date)= 1986 

-- worked WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-30';

-- (why does not work when using wildcard?)
-- WHERE cast(hire_date as varchar) LIKE "1986";
-- WHERE hire_date LIKE "1986%"; -- WHERE hire_date LIKE "1986-%-%"" 

-- 3)List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT 
	d.dept_name as "Department Name",
	dm.dept_no as "Department Number",
	dm.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name"
		
FROM dept_manager as dm
INNER JOIN departments as d
ON dm.dept_no = d.dept_no
INNER JOIN employees as e
ON dm.emp_no = e.emp_no
ORDER BY "Department Number";

-- 4)List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT 
	e.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	d.dept_name as "Department Name"
		
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN departments as d
ON de.dept_no = d.dept_no
ORDER BY "Employee Number";

-- 5)List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name , gender		
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- also worked: WHERE first_name='Hercules' And last_name LIKE 'B%' ORDER BY last_name;

-- 6)List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT 
	e.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	d.dept_name as "Department Name"
		
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN departments as d
ON de.dept_no = d.dept_no
ORDER BY "Employee Number";

-- 7)List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN departments as d
ON d.dept_no =de.dept_no
WHERE d.dept_name in ('Sales','Development')
ORDER BY e.emp_no;

-- WHERE d.dept_name = 'Sales' AND d.dept_name = 'Development' ## Just return columns information but not details below
-- WHERE d.dept_name in ('Sales','Development') ## Give you details information

-- 8) In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "Frequency Count"
FROM employees
GROUP BY last_name
ORDER By "Frequency Count" DESC;
