create database partition_db;

use partition_db;

CREATE TABLE Sales (
    sale_id INT ,
    product_id INT,
    sale_date DATE,
    amount DECIMAL(10, 2),
    
    PRIMARY KEY uk_sale_date (sale_date, sale_id)
)

PARTITION BY RANGE (YEAR(sale_date)) (        -- here sales date must be a part of the primary key
    PARTITION p0 VALUES LESS THAN (2000),
    PARTITION p1 VALUES LESS THAN (2001),
    PARTITION p2 VALUES LESS THAN (2002),
    PARTITION p3 VALUES LESS THAN (2003),
    PARTITION p4 VALUES LESS THAN MAXVALUE
);

drop table Sales;

INSERT INTO Sales (sale_id, product_id, sale_date, amount)
VALUES
    (1, 101, '2000-01-15', 100.00),
    (2, 102, '2001-03-22', 150.00),
    (3, 103, '2002-07-10', 200.00),
    (4, 101, '2005-11-30', 75.00),
    (5, 104, '2019-04-05', 300.00);

select * from Sales;
select * from Sales partition (p2);