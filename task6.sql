-- 1 start a transaction
 create table accounts(account_id INT PRIMARY KEY, account_name VARCHAR(50), balance DECIMAL(10,2));
 INSERT INTO accounts VALUES(1,'Riya',1000),(2,'Riya2',500);
 START TRANSACTION;
-- 2 insert recoreds into accounts
insert into accounts values(3,'Riya3',2000);
select * from accounts;
-- 3 rollback changes
rollback;
select * from accounts;
-- 4 commit valid transactions
start transaction;
insert into accounts values(3,'Riya3',2000);
commit;
rollback;
select * from accounts;
-- 5 demonstrate transfer of money using transaction
update accounts set balance = balance - 200 where account_id = 1;
update accounts set balance = balance + 200 where account_id = 2;
commit;
select * from accounts;