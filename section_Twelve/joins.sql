d## how do you access data from two tables?!ALTER
-- JOIN THEM!!

-- IE: 

#How do you get all orders from boy george

-- Before joins? 

SELECT first_name, last_name, id FROM customers WHERE first_name = 'boy' && last_name = 'george';
# (answer) boy George id 1 

-- then

SELECT * FROM orders WHERE customer_id = 1;
# +----+------------+--------+-------------+
# | id | order_date | amount | customer_id |
# +----+------------+--------+-------------+
# |  1 | 2016-02-10 |  99.99 |           1 |
# |  2 | 2017-11-11 |  35.50 |           1 |
# +----+------------+--------+-------------+
# 2 rows in set (0.00 sec)

-- //NOT VERY EFFICIENT

#Maybe with subquery? 

SELECT * FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'boy' && last_name = 'George');

## Works, is inelegant, also limited to the foreign linked select.


## lets start with a basic ass joins
SELECT * FROM customers, orders;

# +----+------------+-----------+------------------+----+------------+--------+-------------+
# | id | first_name | last_name | email            | id | order_date | amount | customer_id |
# +----+------------+-----------+------------------+----+------------+--------+-------------+
# |  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
# |  2 | George     | Michael   | gm@gmail.com     |  1 | 2016-02-10 |  99.99 |           1 |
# |  3 | David      | Bowie     | david@gmail.com  |  1 | 2016-02-10 |  99.99 |           1 |
# |  4 | Blue       | Steele    | blue@gmail.com   |  1 | 2016-02-10 |  99.99 |           1 |
# |  5 | Bette      | Davis     | bette@aol.com    |  1 | 2016-02-10 |  99.99 |           1 |
# |  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
# |  2 | George     | Michael   | gm@gmail.com     |  2 | 2017-11-11 |  35.50 |           1 |
# |  3 | David      | Bowie     | david@gmail.com  |  2 | 2017-11-11 |  35.50 |           1 |
# |  4 | Blue       | Steele    | blue@gmail.com   |  2 | 2017-11-11 |  35.50 |           1 |
# |  5 | Bette      | Davis     | bette@aol.com    |  2 | 2017-11-11 |  35.50 |           1 |
# |  1 | Boy        | George    | george@gmail.com |  3 | 2014-12-12 | 800.67 |           2 |
# |  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
# |  3 | David      | Bowie     | david@gmail.com  |  3 | 2014-12-12 | 800.67 |           2 |
# |  4 | Blue       | Steele    | blue@gmail.com   |  3 | 2014-12-12 | 800.67 |           2 |
# |  5 | Bette      | Davis     | bette@aol.com    |  3 | 2014-12-12 | 800.67 |           2 |
# |  1 | Boy        | George    | george@gmail.com |  4 | 2015-01-03 |  12.50 |           2 |
# |  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
# |  3 | David      | Bowie     | david@gmail.com  |  4 | 2015-01-03 |  12.50 |           2 |
# |  4 | Blue       | Steele    | blue@gmail.com   |  4 | 2015-01-03 |  12.50 |           2 |
# |  5 | Bette      | Davis     | bette@aol.com    |  4 | 2015-01-03 |  12.50 |           2 |
# |  1 | Boy        | George    | george@gmail.com |  5 | 1999-04-11 | 450.25 |           5 |
# |  2 | George     | Michael   | gm@gmail.com     |  5 | 1999-04-11 | 450.25 |           5 |
# |  3 | David      | Bowie     | david@gmail.com  |  5 | 1999-04-11 | 450.25 |           5 |
# |  4 | Blue       | Steele    | blue@gmail.com   |  5 | 1999-04-11 | 450.25 |           5 |
# |  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
# +----+------------+-----------+------------------+----+------------+--------+-------------+

-- cartesian join? -- Implicit Join  -- Cross Join. tries every possible combo 

    -- Takes everything and applies it to everything... BUT IT WORKS! .. sorta 
#very meaningless. 
SELECT * FROM customers, orders WHERE customers.id = orders.customer_id;


            #it is good convention to list each table whenever located. if you say customers.id you must also say orders.id whenever applicable
            
-- explicit inner join
SELECT * FROM customers 
JOIN orders
    ON customers.id = orders.customer_id;
    
    
SELECT first_name, last_name, order_date, amount FROM customers 
JOIN orders
    ON customers.id = orders.customer_id;
    
    -- This is also just a standard table once built, so you can add different functions like order by 
    
    SELECT first_name, last_name, order_date, amount FROM customers 
JOIN orders
    ON customers.id = orders.customer_id ORDER BY order_date;
    -- you can stack these functions like anything else in sql 
    
    SELECT first_name, last_name, order_date, amount FROM customers WHERE MAX()
JOIN orders
    ON customers.id = orders.customer_id ;
    
    
    
    #--#--# -- Left and Right Joins -- #--#--# 
    
    
#     The above listed join is called an INNER join, and if you imagine a venn diagram of where the two tables meet, that inner section is the part that's being joined. 

# a left join extends that join to the entirity of the table on the left side of the venn diagram 
-- Inner Join 
SELECT * FROM customers 
INNER JOIN orders ON customers.id = orders.customer_id;

-- left join

SELECT * FROM customers 
LEFT JOIN orders ON customers.id = orders.customer_id;

# SELECT * FROM customers
#     -> LEFT JOIN orders ON customers.id = orders.customer_id;
# +----+------------+-----------+------------------+------+------------+--------+-------------+
# | id | first_name | last_name | email            | id   | order_date | amount | customer_id |
# +----+------------+-----------+------------------+------+------------+--------+-------------+
# |  1 | Boy        | George    | george@gmail.com |    1 | 2016-02-10 |  99.99 |           1 |
# |  1 | Boy        | George    | george@gmail.com |    2 | 2017-11-11 |  35.50 |           1 |
# |  2 | George     | Michael   | gm@gmail.com     |    3 | 2014-12-12 | 800.67 |           2 |
# |  2 | George     | Michael   | gm@gmail.com     |    4 | 2015-01-03 |  12.50 |           2 |
# |  5 | Bette      | Davis     | bette@aol.com    |    5 | 1999-04-11 | 450.25 |           5 |
# |  3 | David      | Bowie     | david@gmail.com  | NULL | NULL       |   NULL |        NULL | --
# |  4 | Blue       | Steele    | blue@gmail.com   | NULL | NULL       |   NULL |        NULL | --
# +----+------------+-----------+------------------+------+------------+--------+-------------+
# 7 rows in set (0.00 sec)
-- Notice how the orders do NOT need to have any orders if you use a left join

SELECT * FROM customers 
RIGHT JOIN orders ON customers.id = orders.customer_id;


-- Why would you want this? 

-- maybe you want to order all the accounts by how much they spend? maybe you want to send promos who havent spent a coupon to get started
SELECT first_name, last_name, IFNULL(SUM(amount), 0) AS total_spent 
FROM customers 
LEFT JOIN orders ON customers.id = orders.customer_id GROUP BY customers.id;

-- left join and right join are the same at the ennd of the day. The "Left" table is the one where you SELECT * FROM and the right table is where you pull other data from. 

-- thus, if you right join you pull all the data from the second table entered. 
-- or if you reverse, so SELECT * FROM the other table first, you get all the data from that second table. 

-- So much so that sometimes some softwares or environments will not let you right join at all
-- you just have to re-write it and join the tables in reverese. 

