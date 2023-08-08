create database triggers_db;

use triggers_db;

create table users(
username varchar(40),
age int);

delimiter ++

create trigger must_be_adult
before insert on users for each row
begin 
if new.age<18                    -- new refers to the new row that is ti be inserted
then signal sqlstate '45000'     -- 45000 is a whild card code that is left to us to define the error
set message_text = 'must be an adult';
end if ;
end
++

select * from users ++




