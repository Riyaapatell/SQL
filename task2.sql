-- 1 count total number of students
SELECT COUNT(student_id) FROM students;

-- 2 find avg marks of students
SELECT AVG(marks) FROM students;

-- 3 find higest and lowest marks
SELECT MAX(marks), MIN(marks) FROM students;

-- 4 find department-wise avg marks
select department, avg(marks) as avg_marks from students group by department;

-- 5 display departments where avg marks > 70
select department, avg(marks) as avg_marks from students group by department having avg(marks) > 70;
