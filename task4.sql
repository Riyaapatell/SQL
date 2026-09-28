-- 1 find employee earning more than average salary
select * from employee where salary > (select avg(salary) from employee)

-- 2 find department with highest total salary
select d.dept_name, sum(e.salary) as total_salary from employee e join departments d on d.dept_id = e.dept_id group by d.dept_name order by total_salary desc limit 1;

-- 3 display employee with 2nd highest salary 
select * from employee order by salary desc limit 1 offset 1;

-- 4 display employee working in same department as "Riya"
select e.emp_name,d.dept_name from employee e join departments d on d.dept_id = e.dept_id where d.dept_id = (select dept_id from employee where emp_name = 'Riya') AND e.emp_name <> 'Riya';
