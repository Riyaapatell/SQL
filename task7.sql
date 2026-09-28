-- tables
create table customers(customer_id INT primary key,name varchar(50),city varchar(50));
create table orders(order_id INT,customer_id INT,order_date varchar(50),amount decimal(10,2));
create table products(product_id INT primary key,product_name varchar(50),price decimal(10,2));
CREATE TABLE order_items (order_id INT,product_id INT,quantity INT,PRIMARY KEY (order_id, product_id));
-- insert
insert into customers values(1,'Riya','china'),(2,'Riya1','assam'),(3,'Riya2','hyderabad'),(4,'Riya3','banglore'), (5,'Riya4','kolkata'),(6,'Riya5','mumbai');
insert into orders values(101, 1, '2026-08-05', 30000),(102, 1, '2026-09-10', 25000),(103, 2, '2026-09-12', 17000),(104, 3, '2026-08-20', 12000),(105, 4, '2026-08-15', 55000),(106, 4, '2026-09-05', 10000),(107, 5, '2026-09-18', 8000);
insert into products values(1,'laptop',50000),(2,'ipad',30000),(3,'watch',10000),(4,'tv',5000),(5,'phone',2000);
INSERT INTO order_items values (101, 2, 1),(102, 3, 2),(102, 4, 1),(103, 5, 1),(104, 4, 2),(105, 1, 1),(105, 4, 1),(106, 3, 1),(107, 5, 4);
-- 1 total order per customer
select c.customer_id,c.name,count(o.order_id) as total_orders from customers c left join orders o on o.customer_id = c.customer_id group by c.customer_id,c.name;
-- 2 customer who never placed an order
select c.customer_id,c.name from customers c left join orders o on c.customer_id = o.customer_id where o.order_id is null;
-- 3 highest selling product
select p.product_id,p.product_name,sum(oi.quantity) as sold_item from products p join order_items oi on p.product_id = oi.product_id group by p.product_id,p.product_name order by sold_item desc limit 1
-- 4 monthly sales report
select month(order_date) as month, sum(amount) as total_sales from orders group by month(order_date);
-- 5 customer with total purchase > 50000
select c.customer_id,c.name, sum(o.amount) as total_purchase from customers c join orders o on c.customer_id = o.customer_id group by c.customer_id having sum(o.amount) > 50000;
-- 6 top 3 cities by revenue 
select c.city, sum(o.amount) as revenue from customers c join orders o on c.customer_id = o.customer_id group by c.city order by revenue desc limit 3;
