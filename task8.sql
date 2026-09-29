-- 1 add index to improve search on orders.customer_id
create index index_customer_id on orders(customer_id);
-- 2 use EXPLAIN to analyze query
explain select * from orders;
-- 3 optimize a slow join query
create index index_customer_id on orders(customer_id);
select c.customer_id,c.name from customers c join orders o on c.customer_id = o.customer_id;
