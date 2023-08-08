create database procedure_db;

use procedure_db;

create table employee(
id int primary key auto_increment,
emp_name varchar(20)
);

insert into employee(emp_name) values ('Arjun');


delimiter $$
create procedure getname (in emp_id int, out empname varchar(20) )
begin
-- select * from employee where id = emp_id;
select emp_name into empname from  employee where id = emp_id;
end;

$$

delimiter ;

set @name ='';

call getname(1, @name);
select @name;

drop procedure getname;


