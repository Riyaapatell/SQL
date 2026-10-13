-- Mess management system
-- 1 create table
create table students(student_id int, student_name varchar(50),room_number int, department varchar(50));
create table meals(meal_id int, meal_date varchar(50),meal_type varchar(50), menu varchar(50));
create table meal_attendence(attendence_id int, student_id int, meal_id int, status varchar(50));
create table payments(payment_id int, student_id int, amount int,payment_date varchar(50), payment_status varchar(50));
create table mess_menu(menu_id int, meal_date varchar(50),meal_type varchar(50),item varchar(50));
-- 2 create relationships 
-- alter table students add primary key(student_id);
alter table meal_attendence ADD FOREIGN KEY(student_id) references students(student_id);
alter table meal_attendence ADD FOREIGN KEY(meal_id) references meals(meal_id);
alter table payments ADD FOREIGN KEY(student_id) references students(student_id);
-- 3 sample data
insert into students values(1,'Riya',101,'CSE'),(2,'Riya2',102,'IT'),(3,'Riya3',103,'CSE'),(4,'Riya4',104,'ECE'),(5,'Riya5',105,'CSE');
INSERT INTO meals VALUES(1,'2026-10-01','Breakfast','idli'),(2,'2026-10-01','Lunch','Rice Dal'),(3,'2026-10-01','Dinner','Roti Paneer');
INSERT INTO meal_attendence VALUES(1,1,1,'Present'),(2,2,1,'Absent'),(3,3,2,'Present'),(4,4,2,'Present'),(5,5,3,'Absent');
INSERT INTO payments VALUES(1,1,3000,'2026-09-01','Paid'),(2,2,3000,'2026-09-02','Paid'),(3,3,3000,'2026-09-03','Pending'),(4,4,3000,'2026-09-04','Paid'),(5,5,3000,'2026-09-05','Pending');
INSERT INTO mess_menu VALUES(1,'2026-10-01','Breakfast','idli'),(2,'2026-10-01','Lunch','Rice Dal'),(3,'2026-10-01','Lunch','Rice Dal'),(4,'2026-10-01','Dinner','Roti Paneer'),(5,'2026-10-01','Dinner','Roti Paneer');
-- 4 write 15 business queries
-- 1) Display all students
select * from students;
-- 2) students from cse department
select * from students where department = 'CSE';
-- 3) display students and their room number
select student_name,room_number from students;
-- 4) all students with their meal attendence
select s.student_name,m.status,a.meal_type from students s join meal_attendence m on s.student_id = m.student_id join mess_menu a on m.meal_id = a.meal_id;
-- 5) students who are absent
select s.student_name, m.meal_type from students s join meal_attendence a on s.student_id = a.student_id join meals m on m.meal_id = a.meal_id where a.status ='absent';
-- 6) count present meal for each student
SELECT s.student_name, COUNT(*) AS meals_attended FROM students s JOIN meal_attendence a ON s.student_id = a.student_id WHERE a.status = 'present' GROUP BY s.student_id, s.student_name;
-- 7) count absent meal for each student
select s.student_name, count(*) as meal_not_attended from students s join meal_attendence a on a.student_id = s.student_id where a.status = 'absent' group by s.student_name, s.student_id;
-- 8) students with pending payments
select s.student_name, count(*) as pending from students s join payments p on p.student_id = s.student_id where p.payment_status = 'pending' group by s.student_name,s.student_id;
-- 9) find total payment by each students
select s.student_name,sum(p.amount) as total_amount from students s join payments p on p.student_id = s.student_id group by s.student_id, s.student_name;
-- 10) student who paid the highest amount
select s.student_name, p.amount from students s join payments p on p.student_id = s.student_id order by p.amount limit 1;
-- 11) find total mess revenue
select sum(amount) as revenue from payments where payment_status = 'Paid';
-- 12) total number students in each department
select department, count(*) as total_student from students group by department;
-- 13) most popular meal type
select m.meal_type ,count(*) as total_attendence from meals m join meal_attendence a on m.meal_id = a.meal_id where a.status = 'present' group by meal_type order by total_attendence desc limit 1;
-- 14) students who have never been absent
select s.student_name from students s join meal_attendence a on s.student_id = a.student_id group by s.student_id, s.student_name having sum(a.status = 'absent') = 0;
-- 15) student whose payment is greater than the avg payment
select s.student_name, p.amount from students s join payments p on p.student_id = s.student_id where p.amount > (select avg(amount) from payments);

-- 5 optimize at least 3
CREATE INDEX idx_attendance_student ON meal_attendence(student_id);
CREATE INDEX idx_attendance_meal ON meal_attendence(meal_id);
CREATE INDEX idx_payment_student ON payments(student_id);