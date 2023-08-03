create database demo;
show databases;
use demo;
select database();  -- currently used database

create table cats(
	name varchar(50),
    age int);
    
    
show tables;

describe cats;
desc cats;


insert into cats values('shino',2);
insert into cats values('jeckey',1);
insert into cats(name,age) values('victoria',2);
insert into cats(age,name) values(4,'queen');

insert into cats values("sweetball",3),("Potato face",5),("Tom",6);

select * from cats;





-- ------------------------------------

drop table cats;
CREATE TABLE cats(
cat_id INT AUTO_INCREMENT PRIMARY KEY,
name varchar(100),
breed VARCHAR(100),
age int
);

SELECT * FROM cats;
SHOW COLUMNS FROM cats;
DESC cats;
INSERT INTO cats(name, breed, age)
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
       
select name from cats;

select * from cats where age=4;
select * from cats where cat_id=age;

select name as catName from cats;

update cats set name = 'Shankalan' where age =7; 

Delete from cats where age=9;
select * from cats;















