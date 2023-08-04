create database students;

use students;

create table student(
id int primary key auto_increment,
first_name varchar(20)
);

create table paper(
title varchar(100),
grade int,
stud_id int,
foreign key(stud_id) references student(id) on delete set null
);

insert into student (first_name) values
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

insert into paper (stud_id, title, grade ) values
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

insert into paper (stud_id, title, grade ) values(null,null,null);
drop table paper;

select first_name, title, grade from student join paper on id=stud_id;
select first_name, title, grade from student left join paper on id=stud_id;
select first_name, title, grade from student right join paper on id=stud_id;



select * from paper;
select id,ifnull(title, 'missing'), ifnull(grade,0) from student left join paper on id=stud_id;



select stud_id, title, grade , coalesce(stud_id, title, grade, 'missing') from paper;

drop table paper;