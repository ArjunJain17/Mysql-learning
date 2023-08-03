create database data_type_db;

use data_type_db;

create table dataType(
age int,
weight double(4,2), -- here out of 4, 2 places are set after decimal point leaves 3 places before decimal point
					-- if we give more than 2 places after decimal point in input but the over all no. has digits <4 it 
                    -- will round off the digits after decimal places and store 2 digits only
id tinyint
);

--  char : fixed length such as area code, zip code, phone number

desc dataType;

insert into dataType values(2147483647, 23.90, 127);

select * from dataType;


insert into dataType values(2147483644, 2.908, 125); -- each value is exceeds the max values that can be stored in these datatypes

create table numbers(a float, b double);

insert into numbers values(1.1234567,1.123456789101112131415);
insert into numbers values(1.1234567,1.123456789123456789);
insert into numbers values(1.123456789,1.123456789123456789);
insert into numbers values(12.123456789,12.123456789123456789);

select format(a,7), format(b,15) from numbers;


CREATE TABLE children (
    name varchar(100),
    birthdate date,
    birthtime time,
    birthdt datetime
);

insert into children values('Arjun', '2001-09-12', '17:45:00', '2001-09-12 17:45:00');
select * from children;

insert into children values('krishna', curDate(), curTime(), now()); -- curTime() - current_time()
																	 -- curDate() - current_date()
                                                                     --   now gives current date and time both
                                                                     
select birthdate, day(birthdate), monthname(birthdate), dayofweek(birthdate), dayname(birthdate), dayofyear(birthdate) from children;

select date_format(birthdate, '%b %a %d') from children;
select date_format(birthdate, '%b %a %d') from children;

select date_format(birthdate, '%Y %y') from children; -- %Y - year in 4 digits , %y- year in 2 digits
select date_format(birthdate, '%D %d') from children;-- %D- 12th   %d- 12
select date_format(birthdate, '%M %m') from children; -- %M - gives full name, %m- gives month no.
  
  
select datediff(curDate(), birthdate) from children;
select date_add(birthDate, interval 18 month) from children;
select birthDate, (birthDate + interval  18 year) from children;
select birthDate, date_add(birthDate , interval 18 year) as will_be_18_in_year from children;
select birthDate, year(date_add(birthDate , interval 18 year)) as will_be_18_in_year from children;

select timediff(curTime(),birthtime) from children;

create table captions(
text varchar(50),
created_at timestamp default current_timestamp,
updated_at timestamp on update current_timestamp
);
insert into captions(text) values('Stop looking at me'),('Just chilling');

select * from captions;

update captions set text='Look at me now' where text='Stop looking at me';

-- exercise
select curtime();
select curdate();
select dayofweek(curDate()), dayname(curDate());
select date_format(curDate(), '%m/%d/%Y');
 
select curdate(), date_format(now(), '%M %D at %h:%i') as formatted_time; -- we can use date_format for formatting both date and time, but use time_format is used to format time only

-- caste
select cast('09:45:00' as time);
select * from children where birthtime between cast('9:00:00' as time) and cast('15:00:00' as time);


