-- 1. Find all employees who locate in the location with the id 1700
SELECT * FROM employees e, departments d
WHERE e.department_id=d.department_id
AND d.location_id=1700;

-- 2. Find all employees who do not locate at the location 1700
SELECT * FROM employees e, departments d
WHERE e.department_id=d.department_id
AND d.location_id<>1700;

-- 3. Finds the employees who have the highest salary
SELECT * FROM employees
WHERE salary=(SELECT MAX(salary) FROM employees);

-- 4. Finds all employees whose salaries are greater than the average salary of all employees
SELECT * FROM employees
WHERE salary>(SELECT AVG(salary) FROM employees);

-- 5. Finds all departments having at least one employee with salary greater than 10000
SELECT DISTINCT d.department_id,d.department_name
FROM departments d, employees e
WHERE d.department_id=e.department_id
AND e.salary>10000;

-- 6. Finds all departments that do not have any employee with salary greater than 10000
SELECT department_id,department_name
FROM departments
WHERE department_id NOT IN
(SELECT department_id FROM employees WHERE salary>10000);

-- 7. Finds all employees whose salaries are greater than the lowest salary of every department
SELECT * FROM employees
WHERE salary>(SELECT MIN(salary) FROM employees);

-- 8. Finds all employees whose salaries are greater than or equal to the highest salary of every department
SELECT * FROM employees
WHERE salary>=(SELECT MAX(salary) FROM employees);

-- 9. Calculate the average of average salary of departments
SELECT AVG(avg_sal)
FROM
(SELECT AVG(salary) avg_sal
FROM employees
GROUP BY department_id) a;

-- 10. Finds salaries of employees, average salary and difference
SELECT employee_id,salary,
(SELECT AVG(salary) FROM employees) avg_salary,
salary-(SELECT AVG(salary) FROM employees) difference
FROM employees;

-- 11. Finds employees whose salary is higher than average salary of their departments
SELECT * FROM employees e
WHERE salary>
(SELECT AVG(salary)
FROM employees
WHERE department_id=e.department_id);

-- 12. Returns all employees who have no dependents
SELECT * FROM employees
WHERE employee_id NOT IN
(SELECT employee_id FROM dependents);

-- 13. Display first name, last name, department name of employees of department 1,2,3
SELECT first_name,last_name,department_name
FROM employees e,departments d
WHERE e.department_id=d.department_id
AND d.department_id IN(1,2,3);

-- 14. Display first name, last name, job title and department name of employees in dept 1,2,3 with salary >10000
SELECT first_name,last_name,job_title,department_name
FROM employees e,jobs j,departments d
WHERE e.job_id=j.job_id
AND e.department_id=d.department_id
AND d.department_id IN(1,2,3)
AND salary>10000;

-- 15. Display department name, street address, postal code, country name and region name
SELECT department_name,street_address,postal_code,country_name,region_name
FROM departments d,locations l,countries c,regions r
WHERE d.location_id=l.location_id
AND l.country_id=c.country_id
AND c.region_id=r.region_id;

-- 16. Find employees who have or do not have a department
SELECT first_name,last_name,d.department_id,department_name
FROM employees e LEFT JOIN departments d
ON e.department_id=d.department_id;

-- 17. Find employees whose first name contains letter Z
SELECT first_name,last_name,department_name,city,state_province
FROM employees e,departments d,locations l
WHERE e.department_id=d.department_id
AND d.location_id=l.location_id
AND first_name LIKE '%Z%';

-- 18. Find all departments including those without employees
SELECT first_name,last_name,d.department_id,department_name
FROM departments d LEFT JOIN employees e
ON d.department_id=e.department_id;

-- 19. Find employees and their managers
SELECT e.first_name,m.first_name
FROM employees e LEFT JOIN employees m
ON e.manager_id=m.employee_id;

-- 20. Find employees who work in same department as Taylor
SELECT first_name,last_name,department_id
FROM employees
WHERE department_id=
(SELECT department_id FROM employees
WHERE last_name='Taylor');

-- 21. Calculate difference between max salary of job and employee salary
SELECT job_title,first_name,
(max_salary-salary) difference
FROM employees e,jobs j
WHERE e.job_id=j.job_id;

-- 22. Calculate average salary and number of employees in each department
SELECT department_name,
AVG(salary),COUNT(employee_id)
FROM departments d LEFT JOIN employees e
ON d.department_id=e.department_id
GROUP BY department_name;

-- 23. Create a view for employees belongs to department located in Delhi
CREATE VIEW delhi_view AS
SELECT first_name,employee_id,phone_number,
job_title,department_name
FROM employees e,jobs j,departments d,locations l
WHERE e.job_id=j.job_id
AND e.department_id=d.department_id
AND d.location_id=l.location_id
AND city='Delhi';

SELECT * FROM delhi_view;

-- 24. Use view to obtain names whose job title is Manager and department is Finance
SELECT first_name
FROM delhi_view
WHERE job_title='Manager'
AND department_name='Finance';

-- 25. Update phone number of employee Smith using view
UPDATE delhi_view
SET phone_number='9999999999'
WHERE first_name='Smith';

-- 26. Display details of employee who have no dependents
SELECT * FROM employees
WHERE employee_id NOT IN
(SELECT employee_id FROM dependents);

-- 27. Display details of employee whose manager id is 101 or 201
SELECT * FROM employees WHERE manager_id=101
UNION
SELECT * FROM employees WHERE manager_id=201;

-- 28. Display details of employees who have at least one dependent
SELECT * FROM employees
WHERE employee_id IN
(SELECT employee_id FROM dependents);
