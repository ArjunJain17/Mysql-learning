Create database people;

use people;
create table person(
first_name varchar(20),
last_name varchar(20),
age int
);

insert into person values("Arjun","Jain",21);
insert into person(first_name) values("sankalan");

insert into person values("Arjun","Jain",21),(12,13,14); --  We can insert integer values in varchar without using inverted commas

select * from person;

insert into person() values(); -- inserts null values in all attributes of the row

create table person2(
first_name varchar(20) NOT NULL ,
last_name varchar(20) NOT NULL ,
age int NOT NULL
);

insert into person2 values("Arjun","Jain",21),(12,13,14);

select * from person2;

insert into person2 values('mario\'s castle',' queen', 14); -- put a \ before ' if the single inverted comma is being used in the sring itself 
-- 															avoid confusion with the string delimiter


create table person3(
first_name varchar(20) not null default 'Mario',
last_name varchar(20) NOT NULL default 'Lucifer' ,
age int NOT NULL default '56'
);

														-- using default does not eliminate the use of not null because even 
-- 														if default values are set and if not null is not used we can  still 
-- 														insert null into the field

desc person3;

create table person4(
person_id int auto_increment primary key,
first_name varchar(20) not null default 'Mario',
last_name varchar(20) NOT NULL default 'Lucifer' ,
age int NOT NULL default '56'
);

insert into person4(first_name,last_name,age) values('Arjun','Jain',5);

select * from person4;

create table employee(
id int auto_increment primary key,
first_name varchar(100) not null ,
last_name varchar(100) NOT NULL ,
middle_name varchar(100) ,
age int not null,
current_status varchar(15) not null default 'employed'
);

desc employee;
insert into employee(first_name,last_name, age) values ('\'Jain','Jain',21);
select * from employee;
update employee set first_name = 'Arjun' where last_name ='Jain';

