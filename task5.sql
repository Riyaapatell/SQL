-- 1 create user table with primary key // 2 unique email// 3 not null password//4 add foreign key between orders and users 
create table users(user_id INT PRIMARY KEY, name VARCHAR(50),email VARCHAR(50), password VARCHAR(50) NOT NULL);

-- 5 create index on email coloumn 
create index idx_name on users(email);

-- 6 create view to display user order summary 
create or replace view order_summary as select u.user_id, u.name, count(o.order_id) as total_order,sum(o.order_amount) from users u left join orders o on u.user_id = o.user_id group by u.user_id,u.name;