create database dominos;

use dominos;

create table customers(
cust_id int primary key auto_increment,
first_name varchar(100),
last_name varchar(100),
email varchar(50)
);

create table orders (
order_id int primary key auto_increment,
order_time timestamp default now(),
cust_id int,
amount decimal(6,2),
foreign key(cust_id) references customers(cust_id)
);


insert into customers (first_name, last_name, email)
values ('Boy', 'George', 'george@gmail.com'),
('George', 'Michael', 'gm@gmail.com'),
('David', 'Bowie', 'david@gmail.com'),
('Blue', 'Steele', 'blue@gmail.com'),
('Bette', 'Davis', 'bette@aol.com');

insert into  orders (amount, cust_id)
values (99.99, 1),
(35.50, 1),
(800.67, 2),
(12.50, 2),
(450.25, 5);

insert into  orders (amount, cust_id)
values (99.99, 6);



-- alter table orders add column amount decimal(6,2);
desc orders;
drop table orders;

-- cross join
select * from customers, orders;

-- inner join
select * from customers join orders on customers.cust_id = orders.cust_id;

select * from customers c, orders o where c.cust_id = o.cust_id;

-- left join
select * from customers left join orders on customers.cust_id = orders.cust_id;
create table orders (
order_id int primary key auto_increment,
order_time timestamp default now(),
cust_id int,
amount decimal(6,2),
foreign key(cust_id) references customers(cust_id)
);
-- right join
select * from customers right join orders on customers.cust_id = orders.cust_id;

select * from customers  join orders ;

select * from orders natural join customers;

select first_name, last_name , cust_id from customers left join orders on  customers.cust_id = orders.cust_id group by  first_name, last_name;

create table orders2 (
order_id int primary key auto_increment,
order_time timestamp default now(),
cust_id int,
amount decimal(6,2), 
foreign key(cust_id) references customers(cust_id) on delete cascade
);

insert into  orders2 (amount, cust_id)
values (99.99, 1),
(35.50, 1),
(800.67, 2),
(12.50, 2),
(450.25, 5);

create table orders3 (
order_id int primary key auto_increment,
order_time timestamp default now(),
cust_id int,
amount decimal(6,2), 
foreign key(cust_id) references customers(cust_id) on update set null on delete set null
);

drop table orders;


insert into  orders3 (amount, cust_id)
values (99.99, 1),
(35.50, 1),
(800.67, 2),
(12.50, 2),
(450.25, 5);

select * from orders2;
select * from orders3;

delete from customers where cust_id = 5;
select * from customers;

drop table customers;



