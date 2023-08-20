CREATE TABLE department(
	dept_no VARCHAR,
	dept_name VARCHAR,
	PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp(
	emp_no int,
	dept_no VARCHAR
);

CREATE TABLE dept_manager(
	dept_no VARCHAR,
	emp_no int
);

CREATE TABLE salaries(
	emp_no int,
	salary int,
	PRIMARY KEY (emp_no)
);

CREATE TABlE titles(
	title_id Varchar,
	title VARCHAR,
	PRIMARY KEY (title_id)
);

CREATE TABLE employees(
	emp_no SERIAL PRIMARY KEY,
	emp_title_id VARCHAR,
	birth_date date,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL, 	
	sex VARCHAR,
	hire_date date
	
);

SELECT * FROM department;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries on 
employees.emp_no = salaries.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date.year = 1986;

SELECT department.dept_no, 
	department.dept_name, 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name
FROM department
INNER JOIN dept_manager on 
department.dept_no = dept_manager.dept_no
INNER JOIN employees on
employees.emp_no = dept_manager.emp_no;

SELECT dept_manager.dept_no, 
	dept_manager.emp_no,
	department.dept_name,  
	employees.last_name, 
	employees.first_name,
	department.dept_name
FROM dept_manager
INNER JOIN department on 
department.dept_no = dept_manager.dept_no
INNER JOIN employees ON
employees.emp_no = dept_manager.emp_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

SELECT dept_manager.dept_no, 
	dept_manager.emp_no,
	employees.last_name, 
	employees.first_name
FROM dept_manager
INNER JOIN employees on 
dept_manager.emp_no = employees.emp_no;

SELECT dept_manager.dept_no,
	dept_manager.emp_no,
	employees.last_name, 
	employees.first_name,
	department.dept_name
FROM dept_manager
INNER JOIN employees on 
dept_manager.emp_no = employees.emp_no
INNER JOIN department ON
dept_manager.dept_no = department.dept_no;

SELECT last_name, COUNT(last_name) AS "emp_no" 
FROM employees 
GROUP BY last_name 
ORDER BY "emp_no" DESC;


