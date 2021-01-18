DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- import tables in the following sequence: titles, salaries, employees, departments, dept_manager, dept_emp
CREATE TABLE titles(
	title_id VARCHAR(5) PRIMARY KEY NOT NULL,
	title VARCHAR(20)
);
SELECT * FROM titles;

CREATE TABLE salaries(
	emp_no INT PRIMARY KEY NOT NULL,
	salary INT
);
SELECT * FROM salaries;

CREATE TABLE employees(
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(5),
	birth_date DATE,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	sex CHAR(1),
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);
SELECT * FROM employees;

CREATE TABLE departments(
	dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
	dept_name VARCHAR (20)
);
SELECT * FROM departments;

CREATE TABLE dept_manager(
	dept_no VARCHAR(4),
	emp_no INT PRIMARY KEY NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);
SELECT * FROM dept_manager;

CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR(4),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY(emp_no, dept_no)
);
SELECT * FROM dept_emp;