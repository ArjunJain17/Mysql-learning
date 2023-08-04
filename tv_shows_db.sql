create  database tv_shows_db;

use tv_shows_db;

create table reviewers (
reviewer_id int primary key auto_increment,
first_name varchar(20),
last_name varchar(20)
);

create table series (
series_id int primary key auto_increment,
title varchar(100),
released_year year ,
genre varchar(90)
);

create table reviews(
id int primary key auto_increment,
rating double(3,1) ,
reviewer_id int,
series_id int,
-- constraint rating_range_out_of_bound check(rating>0 and rating<=5),
foreign key (reviewer_id) references reviewersseries_id(reviewer_id),
foreign key (series_id) references series(series_id)

);


drop table reviews;

insert into series (title, released_year, genre) values
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
    
insert into reviewers (first_name, last_name) values
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    
insert into  reviews(series_id, reviewer_id, rating) values
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);

select * from reviewers ;
select * from reviews ;

select * from series ;

select title, rating from series natural join reviews;
select title, round(rating,2) from series natural join reviews;

select first_name, last_name, rating from reviewers natural join reviews ;


select genre, avg(rating) from series natural join reviews group by series,reviewsr_id;

select first_name, last_name, count(rating), min(rating), max(rating), avg(rating), 
case when count(rating) >0 then 'active' 
     else 'inactive'
     end
     from reviewers ri left join reviews re on ri.reviewer_id = re.reviewer_id group by  first_name, last_name;

SELECT 
    title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM
    series s
        JOIN
    reviews re
        JOIN
    reviewers rev
WHERE
    s.series_id = re.series_id
        AND rev.reviewer_id = re.reviewer_id;
        
        
-- view   -- these are virtual tables
create view series_ratings as 
select title, rating, concat(first_name,' ', last_name) as reviewer from series s join reviews re join reviewers rev
 where s.series_id = re.series_id and rev.reviewer_id = re.reviewer_id;
 
 select * from series_ratings;
 
 
-- having and  with rollup
-- with rollup applies the same function to all the ros of the output that was applied on groups
select first_name, last_name, count(rating), min(rating), max(rating), avg(rating)
     from reviewers ri left join reviews re on ri.reviewer_id = re.reviewer_id 
     group by  first_name, last_name with rollup having max(rating)>=8 ;
     
     
-- sql modes

select @@global.sql_mode;

-- 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION'

-- STRICT_TRANS_TABLES -> removing this we can insert value of any type in any data type variable

select @@session.sql_mode;
    -- 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION'

select 3/0;
show warnings;

set session sql_mode = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';



