create database windows_db;

use windows_db;

create table  employees (
    emp_no int primary key auto_increment,
    department varchar(20),
    salary int
);

insert into employees (department, salary) values
('engineering', 80000),
('engineering', 69000),
('engineering', 70000),
('engineering', 103000),
('engineering', 67000),
('engineering', 89000),
('engineering', 91000),
('sales', 59000),
('sales', 70000),
('sales', 159000),
('sales', 72000),
('sales', 60000),
('sales', 61000),
('sales', 61000),
('customer service', 38000),
('customer service', 45000),
('customer service', 61000),
('customer service', 40000),
('customer service', 31000),
('customer service', 56000),
('customer service', 55000);

select * from employees;

select department, sum(salary) from employees group by department; -- we can only select department or aggregate functions on other fields;

select department, sum(salary) over() from employees group by department;

select department, sum(salary) over(partition by department) from employees ;

-- NOTE*

select department, sum(salary),  avg(salary) from employees ;-- this wont work as sum and avg work on columns and department will work on row
															-- we have to use either group by or over to make groups to make this work
select department, sum(salary) over(),  avg(salary) over() from employees ; -- this will work

select sum(*) from employees group by department; -- sum(*) not valid

select department, sum(salary) over(partition by department), sum(salary) over() as total_sum from employees ;
select emp_no, department, salary, rank() over(partition by department order by salary desc) as dept_salary_rank,
rank() over(order by salary desc) as overall_salary_rank from employees order by department;
select department, min(salary) over(partition by department), min(salary) over(partition by department order by salary desc )  as rolling_min from employees ;

select department, sum(salary) over(partition by department), sum(salary) over(partition by department order by department) as total_sum from employees ;

select emp_no, department, salary, rank() over(partition by department order by salary desc) as dept_salary_rank,
rank() over(order by salary desc) as overall_salary_rank from employees order by department;

-- rank will work only with order by o/w it will give 1 to all
select emp_no, department, salary, rank() over(partition by department order by salary desc) as dept_salary_rank,
rank() over() as overall_salary_rank from employees order by department;


-- first_value
select emp_no, department, salary, first_value(emp_no) over( order by salary desc), first_value(emp_no) over( partition by department order by salary desc)  as dept_salary from employees;

-- lead/ lag

select emp_no, department, salary, salary - lag(salary) over(partition by department order by salary desc) as dept_salary from employees;
select emp_no, department, salary, salary - lag(salary) over() as dept_salary from employees;

select emp_no, department, salary, salary + lead(salary) over( order by salary desc) as dept_salary from employees;
