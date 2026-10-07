CREATE TABLE employees (emp_id INT,emp_name VARCHAR(50),department VARCHAR(50),salary INT,hire_date DATE);
INSERT INTO employees(emp_id, emp_name, department, salary, hire_date)VALUES(1, 'Riya', 'IT', 60000, '2025-01-15'),(2, 'Riya2', 'HR', 50000, '2026-02-10'),(3, 'Riya3', 'IT', 75000, '2026-05-20'),(4, 'Riya4', 'Finance', 60000, '2026-06-15'),(5, 'Riya5', 'IT', 90000, '2024-11-10'),(6, 'Riya6', 'HR', 75000, '2026-07-01'),(7, 'Riya7', 'IT', 60000, '2025-01-15'),(8, 'Riya8', 'IT', 75000, '2026-05-20'),(9, 'Riya9', 'Finance', 45000, '2026-08-12'),(10, 'Riya10', 'IT', 90000, '2026-08-20');

CREATE TABLE employee2 (emp_id INT,emp_name VARCHAR(50),department VARCHAR(50),salary INT);
INSERT INTO employee2(emp_id, emp_name, department, salary)VALUES
(1, 'Riya1', 'IT', 60000),
(3, 'Riya3', 'IT', 75000),
(5, 'Riya5', 'IT', 90000),
(11, 'Riya11', 'Sales', 55000);
-- 1 write query to find nth highest salary
select distinct salary from employees order by salary desc limit 1; -- for nth, use offset
-- 2 remove duplicate records
delete e1 from employees e1 join employees e2 on e1.emp_name = e2.emp_name and e1.salary = e2.salary and e1.department =  e2.department and e1.emp_id > e2.emp_id;
-- 3 find records common in two tables
select e.* from employees e inner join employee2 e2 on e.emp_id = e2.emp_id and e.emp_name = e2.emp_name and e.department = e2.department and e.salary = e2.salary;
-- 4 find employees hired in last 6 months
select emp_name, hire_date from employees where hire_date >= date_sub(curdate(), interval 6 month);
-- 5 find continous duplicate values
select emp_id, emp_name, salary from (select emp_id, emp_name, salary, LAG(salary) over (order by emp_id) as previous from employees) as previous_salary where salary = previous;
