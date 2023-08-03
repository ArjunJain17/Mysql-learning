create database shirt_db;

use shirt_db;

create table shirt(
shirt_id int PRIMARY KEY auto_increment,
article varchar(15),
color varchar(15),
shirt_size varchar(10),
last_worn int
);

desc shirt;

insert into shirt(article, color, shirt_size, last_worn) values
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

insert into shirt(article, color, shirt_size, last_worn) values ('polo shirt', 'purple', 'M', 50);

select * from shirt;

update shirt set shirt_size = 'L' where article = 'polo shirt';

update shirts set shirt_size = 'XS', color = 'off white' where color = 'white';

delete from shirt where last_worn = 200;










