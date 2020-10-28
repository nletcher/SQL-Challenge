-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM Employee AS e
INNER JOIN Salaries AS s
ON e.emp_no = s.emp_no;

-- List first name, last name, and hire date for Employee who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM Employee
WHERE hire_date 
BETWEEN '01/01/1986' AND '12/31/1986';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name
FROM Departments AS d
LEFT JOIN managers AS m
ON d.dept_no = m.dept_no
LEFT JOIN Employee AS e
ON m.emp_no = e.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Employee AS e
LEFT JOIN Emp_Dept AS de
ON e.emp_no = de.emp_no
LEFT JOIN Departments AS d
ON de.dept_no = d.dept_no;

-- List first name, last name, and sex for Employee whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM Employee
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- List all Employee in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Employee AS e
LEFT JOIN Emp_Dept AS de
ON e.emp_no = de.emp_no
LEFT JOIN Departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- List all Employee in the Sales and Development Departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Employee AS e
LEFT JOIN Emp_Dept AS de
ON e.emp_no = de.emp_no
LEFT JOIN Departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many Employee share each last name.
SELECT last_name, count(last_name) AS "No of Employee with last_name"
FROM Employee
GROUP BY last_name
ORDER BY "No of Employee with last_name" DESC;

-- Find average salary by title
SELECT t.title, round(avg(s.salary))
FROM Salaries s
LEFT JOIN Employee e
ON e.emp_no = s.emp_no
LEFT JOIN Titles t
ON e.emp_title_id = t.title_id
GROUP BY t.title;

SELECT * FROM Employee;

-- Epilogue
SELECT * FROM Employee
WHERE emp_no = '499942';
-- Hahaa.. April Foolsday, but why!? :-)
