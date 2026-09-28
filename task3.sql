-- 1 display employee name with department name
select e.emp_name,d.dept_name from employee e join departments d on e.dept_id = d.dept_id;

-- 2 display employees earing more than 50,000
select e.emp_name from employee e join departments d on e.dept_id = d.dept_id where salary > 50000

-- 3 display department-wise total salary
select d.dept_name,SUM(e.salary) as Total_salary from employee e join departments d on e.dept_id = d.dept_id group by d.dept_name;

-- 4 display departments with more than 2 employee
select d.dept_name, count(e.emp_id) as employee_count from employee e join departments d on e.dept_id = d.dept_id group by d.dept_name having count(e.emp_id) > 2;

-- 5 display employee without department
select e.emp_name from employee e left join departments d on e.dept_id = d.dept_id where d.dept_id is null;