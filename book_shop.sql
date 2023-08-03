create database book_shop;

use book_shop;


create table books
	(
		book_id int not null auto_increment,
		title varchar(100),
		author_fname varchar(100),
		author_lname varchar(100),
		released_year int,
		stock_quantity int,
		pages int,
		primary key (book_id)
	);
    
insert into  books (title, author_fname, author_lname, released_year, stock_quantity, pages) values
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);


select concat(author_fname, ' ', author_lname) AS author_name from books;
select concat_ws('-', title, author_fname, author_lname) AS author_name from books;

select substring('Hey there', 5);
select substr('hey there', -5, 1);
select
    concat(substr(title, 1, 10), '...') AS short_title
from
    books;
    
select replace('ABJ', 'AB', 'Krishna') AS replace_demo;
select replace('Hey buddy', ' ', ' there, ') AS replace_demo;
select replace(title, ' ', '-') from books;

select
    author_lname, reverse(author_fname)
from
    books;

--     
SELECT CHAR_LENGTH('Hello');
SELECT LENGTH('Hello'); -- length gives byte length

-- upper lower
select upper(title) from books;
select concat('I LOVE ', upper(title), ' !!!') from books;

select insert('Hi guys', 3, 1, ' dudes and '); -- inserts ' dudes and ' in position 3 and replaces 1 character
Jhumpa
-- left and right
select left('lalilalo', 3);
select right('lalilalo', 3); -- leftmost and rightmost 3 characters

-- repeat
select repeat('hi', 10); -- repeats hi 10 times

-- trim
select trim('   Arjun '); -- trims only leading and trailing spaces
select trim(leading '.' from '...Arjun...'); -- trims only leading '.'
select trim(trailing '.' from '...ArjuJhumpan...'); -- trims only trailing '.'
select trim(both '.' from '...Arjun...'); -- trims both trailing and leading '.'


-- reverse
select reverse(upper('hey there buddy!'));

select distinct author_fname from books;
SELECT distinct CONCAT(author_fname, ' ', author_lname) from books;
select distinct author_fname, author_lname, released_year FROM books;

select author_fname from books order by author_fname desc;

select book_id, author_fname, author_lname from books order by 2; --  ordered by 2nd column name (here author_fname)
select * from books order by author_lname, released_year;

select concat(author_fname, ' ', author_lname) as author from books order by author;

-- limitJhumpa

select author_fname, author_lname, released_year from books order by released_year desc limit 4, 5;
 -- 4-> starts from 4th row and give 5 rows
select title, pages from books order by pages desc limit 1;

select title, pages from books order by pages limit 1;

-- like
select title, author_fname, author_lname from books where author_fname like '%da%'; -- % means 0 or more characters
select title, author_fname, author_lname from books where author_fname like '____'; -- _ means 1 character(here we have used 4 _)
select title, author_fname, author_lname from books where author_fname like '%n'; -- author name has 'n' at the end

select title, author_fname, author_lname from books where title like '%\%%'; -- escape character for % is \

select title from books where title like '%stories%';


select concat(title, ' - ', released_year) from books as summary order by released_year desc limit 3;

select title, author_lname from books order by author_lname, title;

-- count
select count(*) from books;
select count(author_fname) from books; 
select count(distinct author_fname) from books; -- counts only the distinct first names
select count(title) from books where title like '%the%';
Jhumpa
select author_lname, count(*) from books group by author_lname;

select sum(pages), author_lname from books group by author_lname; -- groups by the author_lname behind the scenes and then shows their respective counts
select released_year, count(*) from books group by released_year;
create table books
	(
		book_id int not null auto_increment,
		title varchar(100),
		author_fname varchar(100),
		author_lname varchar(100),
		released_year int,
		stock_quantity int,
		pages int,
		primary key (book_id)
	);
select author_lname from books group by author_lname;

-- max min
select max(pages) from books;
select title, pages from books where pages = (select max(pages) from books);
select title, released_year from books where released_year = (select min(released_year) from books);

select max(pages), title from books; -- this wont work as max result and title results are different. max works on column
									--  while title will look on rows

select author_fname, auth or_lname, count(*) from books group by author_lname, author_fname;

select author_lname, MIN(released_year) from books group by author_lname;

select author_lname, MAX(released_year) from books group by author_lname;

select author_fname, author_lname, count(*) as books_written, max(pages) most_pages, max(released_year) as latest_release, min(released_year) as earliest_release from books group by author_lname, author_fname;
select count(*) from books;


select avg(released_year) from books group by author_lname, author_fname;


-- exercise
select concat(author_fname, ' ', author_lname), pages from books where pages = (select max(pages) from books);
select released_year, count(*), avg(pages) from books group by released_year;
-- --

select released_year from books where released_year > 2000;
select * from books;

select released_year from books where released_year <= 2000;
select released_year from books where released_year >= 1998 and released_year <= 2005;

select released_year from books where released_year between 2000 and 2015; -- It includes  both lower and upper limit
																			-- Between is mainly used for dates as the cannot be compared using signs
                                                                            

-- in keyword               
select released_year,author_fname, author_lname from books where released_year in (1995, 1996,1998,1990);                                                             
select released_year,author_fname, author_lname from books where released_year in (select released_year from books where released_year<2000);

-- case (switch case in sql)stock_quantity
select stock_quantity,author_fname, author_lname ,
case when stock_quantity> 40 and stock_quantity<60 then '*'
	when stock_quantity> 60 then '**'
     else 'no star'
     end 
as stars from books;     

-- not like and not null
select * from books where stock_quantity is null;
select * from books where stock_quantity is not null;
select * from books where stock_quantity  not like '%0';

-- ** like and = both are case insensitive
select author_fname from books where binary author_fname = 'JHUMPA';
select author_fname from books where author_fname like 'JHUMPA';

-- to make them case sensitive ass keyword binary - it considers the case of the characters
select author_fname from books where binary author_fname = 'JHUMPA';
select author_fname from books where binary author_fname = 'Jhumpa';

select author_fname from books where binary author_fname like 'JHUMPA';

-- exercise
select 10 !=10; -- result= 0 (false)
select 15>14 and 99-5<=94;  -- result= 1 (true)
select 1 in (3,4) or 9 between 8 and 10; -- result= 1 (true)

select * from books where  released_year>2000;
select * from books where pages between 100 and 200;
select author_fname, author_lname from books where author_lname like 'c%' or 's%';

select title , author_fname, case when title like '%stories%' then 'short stories'
								  when title like '%just kids' and 'a heartbreaking work' then 'memoir'
								  else 'novel'
                                  end
                                  from books;
                                  
select author_fname, author_lname, concat (count(*), ' books') from books group by author_fname, author_lname;
select * from books;

create table palindrome(
 title varchar(15) check(title = reverse(title))
 );
 
 insert into palindrome values('abbba');