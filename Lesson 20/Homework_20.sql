-- task 1

SELECT m.first_name
    ,m.last_name
FROM employees m
JOIN employees e ON m.employee_id = e.manager_id
GROUP BY m.first_name
    ,m.last_name
HAVING
    COUNT(e.employee_id) > 6;


-- task 2

SELECT d.department_name
    ,MIN(e.salary * (1 - e.commission_pct / 100)) AS min_salary
    ,MAX(e.salary * (1 - e.commission_pct / 100)) AS max_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_id
    ,d.department_name;


-- task 3

SELECT TOP 1 r.region_name
    ,COUNT(1) AS count_empl
FROM employee e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
JOIN regions r ON c.region_id = r.region_id
GROUP BY r.region_name
ORDER BY count_empl DESC;


-- task 4

SELECT d.department_name
	,(AVG(e.salary) / (SELECT AVG(salary) FROM  employee) - 1) * 100 AS diff_avg
FROM  employee e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;


-- task 5

WITH y_of_work AS
(
SELECT j.employee_id
	,j.department_id
	,  CASE WHEN j.end_date IS NULL THEN DATEDIFF(YEAR, j.start_date, GETDATE())
			ELSE DATEDIFF(YEAR, j.start_date, j.end_date)
		END AS years_of_work
FROM job_history j
GROUP BY j.employee_id
	,j.department_id
)

SELECT e.first_name
    ,e.last_name
	,y_of_work.years_of_work
FROM employees e
JOIN y_of_work ON e.employee_id = y_of_work.employee_id
WHERE y_of_work.years_of_work > 10;


-- task 6

SELECT first_name
    ,last_name
    ,salary
FROM
    (
    SELECT employee_id
		,first_name
		,last_name
		,salary
        ,ROW_NUMBER() OVER (ORDER BY salary DESC) AS rn
    FROM employees
    )
WHERE rn BETWEEN 5 AND 10;