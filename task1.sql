CREATE DATABASE assignment;

USE assignment;

CREATE TABLE students(student_id INT,name VARCHAR(50),department VARCHAR(30),year INT,marks INT);

INSERT INTO students(student_id, name, department, year, marks)VALUES
(1, 'Riya', 'CSE', 4, 98),
(2, 'Rutv', 'CSE', 3, 22),
(3, 'Riya', 'CE', 1, 56),


-- 1. Display all student records
SELECT * FROM students;

-- 2. Display only name and department
SELECT name, department FROM students;

-- 3. Find students with marks greater than 75
SELECT * FROM students WHERE marks > 75;

-- 4 Display students from CSE department
SELECT * FROM students WHERE department = 'CSE';

-- 5 sort students by marks(descending)
SELECT * FROM students ORDER BY marks DESC;

--  6 display top 3 scores
SELECT * FROM students ORDER BY marks DESC LIMIT 3;