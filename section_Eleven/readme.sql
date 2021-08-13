#Logical Operators

-- like all programming languages, you need to be able to write a function

-- Logical operators are typically how you would do that
#NOT EQUAL -- != // EQUAL =

SELECT title FROM books WHERE released_year=2017
-- LINCOLN IN THE BARDO`

SELECT title, author_lname, author_fname, released_year FROM books WHERE released_year != 2017;
-- everything but lincoln. in the bardo

# I THINK When we were doing compound statemnets in the beginning i also placed a = because it does work teh same as any functional != logical operator. 

-- IF title != X then run Y

-- NOT LIKE != LIKE

SELECT title FROM books WHERE title LIKE '%w%';

-- gives you everything with W in it

SELECT title FROM books WHERE title NOT LIKE '%w%';
-- gives you everything that don't have a w in it

-- -- REMINDER % in the quotations is wildcard. 

# and as always you can add and compound things into your functionsALTER

 SELECT COUNT(title) FROM books WHERE title NOT LIKE '%w%';
 -- in human: all titles without 'w'
# +--------------+
# | COUNT(title) |
# +--------------+
# |           14 |
# +--------------+
# 1 row in set (0.00 sec)


# -- # -- # -- # greater than/ less than / (Greater than/less) equal

-- this logical operator does what it saysALTER
SELECT * FROM books WHERE released_year > 2000;
SELECT * FROM books WHERE stock_quantity <10;
SELECT * FROM books WHERE stock_quantity =< 10;

SELECT * FROM books WHERE stock_quantity > 10;

SELECT * FROM books WHERE stock_quantity >= 10;

SELECT 'A' <= 'a';
# 1- true
SELECT 'A' <= 'b';
# 1 - true
SELECT 'a' >= 'B';
# 0 - false
SELECT 'A' = 'a';
#1 - true

-- LOGICAL AND 
# && 
-- good for stacking conditions
-- all conditions MUST BE true
#SELECt BOOKS written by DAVE EGGERS that were published after 2010. 

SELECT title FROM books WHERE author_lname = 'EGGERS';
SELECT title FROM books WHERE released_year > '2010';

-- you can use the logical and to throw these together. 

SELECT title, author_lname FROM books WHERE author_lname = 'Eggers' 
#AND or && 
&& released_year >'2010';

# PSEUDO - SELECT * FROM  products WHERE brand = 'lego' && in_stock='true'; 

## LOGICAL OR ||
 SELECT title, author_lname, released_year from books WHERE author_lname ='Eggers' OR author_lname = 'gaiman';
# +-------------------------------------------+--------------+
# | title                                     | author_lname |
# +-------------------------------------------+--------------+
# | Norse Mythology                           | Gaiman       |
# | American Gods                             | Gaiman       |
# | A Hologram for the King: A Novel          | Eggers       |
# | The Circle                                | Eggers       |
# | A Heartbreaking Work of Staggering Genius | Eggers       |
# | Coraline                                  | Gaiman       |
# +-------------------------------------------+--------------+
# 6 rows in set (0.00 sec)


## and once again, stacking the features. 
SELECT title, author_lname, released_year from books WHERE (author_lname ='Eggers' || author_lname
 = 'gaiman') && released_year >2010;
# +----------------------------------+--------------+---------------+
# | title                            | author_lname | released_year |
# +----------------------------------+--------------+---------------+
# | Norse Mythology                  | Gaiman       |          2016 |
# | A Hologram for the King: A Novel | Eggers       |          2012 |
# | The Circle                       | Eggers       |          2013 |
# +----------------------------------+--------------+---------------+
# 3 rows in set (0.00 sec)

## BETWEEN  

-- Long way
SELECT title FROM books WHERE released_year >= '2004' && released_year <='2015'

SELECT title, released_year FROM books WHERE released_year BETWEEN 2004 AND 2015; 
-- between requires and to be AND not &&? 
## NOT BETWEEN

SELECT title, released_year FROM books WHERE released_year NOT BETWEEN 2004 AND 2015; 


## FOR DATES AND TIMES, YOU 'SHOULD' CAST THE DATA TYPES

-- IE: IF CAST() 

# '2017-05-02' is a varchar. 
SELECT CAST('2017-05-02' AS DATETIME);


SELECT CAST('2017-05-02' AS DATE);


###### in / not in

-- SELECT ALL BOOKS WRITTEN BY carver, lahiri, smith. 
# not dry code

SELECT title, author_lname FROM books WHERE author_lname = 'CARVER' || WHERE author_lname = 'lahiri' || WHERE author_lname = 'smith';

SELECT title, author_lname FROM books
WHERE author_lname IN ('CARVER', 'LAHIRI', 'smith');
# +-----------------------------------------------------+--------------+
# | title                                               | author_lname |
# +-----------------------------------------------------+--------------+
# | The Namesake                                        | Lahiri       |
# | Interpreter of Maladies                             | Lahiri       |
# | Just Kids                                           | Smith        |
# | What We Talk About When We Talk About Love: Stories | Carver       |
# | Where I'm Calling From: Selected Stories            | Carver       |
# +-----------------------------------------------------+--------------+
# 5 rows in set (0.01 sec)


SELECT title, author_lname FROM books WHERE author_lname NOT IN ('CARVER', 'LAHIRI', 'smith');
# +-------------------------------------------+----------------+
# | title                                     | author_lname   |
# +-------------------------------------------+----------------+
# | Norse Mythology                           | Gaiman         |
# | American Gods                             | Gaiman         |
# | A Hologram for the King: A Novel          | Eggers         |
# | The Circle                                | Eggers         |
# | The Amazing Adventures of Kavalier & Clay | Chabon         |
# | A Heartbreaking Work of Staggering Genius | Eggers         |
# | Coraline                                  | Gaiman         |
# | White Noise                               | DeLillo        |
# | Cannery Row                               | Steinbeck      |
# | Oblivion: Stories                         | Foster Wallace |
# | Consider the Lobster                      | Foster Wallace |
# | 10% Happier                               | Harris         |
# | fake_book                                 | Harris         |
# | Lincoln In The Bardo                      | Saunders       |
# +-------------------------------------------+----------------+
# 14 rows in set (0.00 sec)

-- ## ASIDE: remainder modulo %

SELECT title FROM books WHERE released_year >= 2000 AND released_year % 2 != 0;



### CASE STATEMENTS (if else loops... but ACTUALLY " WHEN and THEN" )


SELECT title, released_year, 
    CASE
    ## Case switch statements are when and then statements in sql
        WHEN released_year >= 2000
            THEN 'Modern Lit'
            ELSE '20th Century Lit'
    END AS 'GENRE'
FROM books; 


-- using multiple variblesALTER

SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS stock
FROM books;


-- more cocisely 

SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;