-- 1.List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON (e.emp_no = s.emp_no);

--2.List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31'
ORDER BY hire_date;

--3.List the manager of each department with the following information: 
----department number, department name, the manager's employee number, last name, first name.
SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM dept_manager m
JOIN employees e
ON (m.emp_no = e.emp_no)
JOIN departments d
ON (m.dept_no = d.dept_no)
ORDER BY m.dept_no;

--4.List the department of each employee with the following information: 
----employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp de ON de.emp_no = e.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no
;

--5.List first name, last name, and sex for employees 
----whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6.List all employees in the Sales department including their 
----employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON (de.emp_no = e.emp_no)
JOIN departments d ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales';

--7.List all employees in the Sales and Development departments, including their 
----employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON (de.emp_no = e.emp_no)
JOIN departments d ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--8.In descending order, list the frequency count of employee last names.
SELECT last_name, count(emp_no) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;

--bonus --average salary by title
SELECT t.title, ROUND(AVG(s.salary),2) as avg_salary
FROM salaries s
JOIN employees e
ON e.emp_no = s.emp_no
JOIN titles t
ON t.title_id = e.emp_title_id
GROUP BY t.title;

SELECT first_name, last_name
FROM employees
WHERE emp_no = 499942;

