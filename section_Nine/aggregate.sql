#aggregate functions

#these are more complicated questions to answer. 



-- How many books are in the database?

SELECT COUNT(*) FROM books; 


SELECT COUNT(author_lname) from books;
# +---------------------+
# | COUNT(author_lname) |
# +---------------------+
# |                  19 |
# +---------------------+
# 1 row in set (0.00 sec)

SELECT COUNT(DISTINCT author_lname) from books;
# +------------------------------+
# | COUNT(DISTINCT author_lname) |
# +------------------------------+
# |                           11 |
# +------------------------------+

#Doesn't really check if the first and last name are different so lets... do that. 
SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;



# how about how many books have "the"

first: discover the answer, 

SELECT title FROM books WHERE title LIKE '%the%';

# +-------------------------------------------+
# | title                                     |
# +-------------------------------------------+
# | The Namesake                              |
# | A Hologram for the King: A Novel          |
# | The Circle                                |
# | The Amazing Adventures of Kavalier & Clay |
# | Consider the Lobster                      |
# | Lincoln In The Bardo                      |
# +-------------------------------------------+


-- okay now if you want to do that as a count, we are back to the select all 

SELECT * FROM books WHERE title LIKE '%the%';

# +---------+-------------------------------------------+--------------+----------------+---------------+----------------+-------+
# | book_id | title                                     | author_fname | author_lname   | released_year | stock_quantity | pages |
# +---------+-------------------------------------------+--------------+----------------+---------------+----------------+-------+
# |       1 | The Namesake                              | Jhumpa       | Lahiri         |          2003 |             32 |   291 |
# |       5 | A Hologram for the King: A Novel          | Dave         | Eggers         |          2012 |            154 |   352 |
# |       6 | The Circle                                | Dave         | Eggers         |          2013 |             26 |   504 |
# |       7 | The Amazing Adventures of Kavalier & Clay | Michael      | Chabon         |          2000 |             68 |   634 |
# |      16 | Consider the Lobster                      | David        | Foster Wallace |          2005 |             92 |   343 |
# |      19 | Lincoln In The Bardo                      | George       | Saunders       |          2017 |           1000 |   367 |
# +---------+-------------------------------------------+--------------+----------------+---------------+----------------+-------+
# 6 rows in set (0.00 sec)

-- OKAY AND NOW... TO TURN IT INTO A COUNT

SELECT COUNT(*) FROM books WHERE title LIKE '%the%';


# SELECT COUNT(*) FROM books WHERE title LIKE '%the%';
# +----------+
# | COUNT(*) |
# +----------+
# |        6 |
# +----------+




 -- #################################### GROUP BY ############################
 -- essential for the rest of the section
 
 ## ITS A LIL WEIRD!
 
             # Challenging to teach. 
             
        # it isn't just a drop in and bam done like everything else,it's like a sub-function. 
        
    # but... it is the way to actually aggregate your data. 
    
    
# Group by summarizes or aggregates identical data into single rows

-- IE: TAKE ALL the books and group them by authors. 

-- then tell me how many books each author makes. 

-- add together all the sales data from each genre, then see what genre sells the best?


SELECT title, author_lname FROM books GROUP BY author_lname;
# +-----------------------------------------------------+----------------+
# | title                                               | author_lname   |
# +-----------------------------------------------------+----------------+
# | What We Talk About When We Talk About Love: Stories | Carver         |
# | The Amazing Adventures of Kavalier & Clay           | Chabon         |
# | White Noise                                         | DeLillo        |
# | A Hologram for the King: A Novel                    | Eggers         |
# | Oblivion: Stories                                   | Foster Wallace |
# | Norse Mythology                                     | Gaiman         |
# | 10% Happier                                         | Harris         |
# | The Namesake                                        | Lahiri         |
# | Lincoln In The Bardo                                | Saunders       |
# | Just Kids                                           | Smith          |
# | Cannery Row                                         | Steinbeck      |
# +-----------------------------------------------------+----------------+



SELECT author_lname,COUNT(*) FROM books GROUP BY author_lname; -- This is wrong since there are 2 harris' so ... gotta ensure both fname and lname are considered. 

SELECT author_fname, author_lname,COUNT(*) FROM books GROUP BY author_lname, author_fname;
# +----------------+----------+
# | author_lname   | COUNT(*) |
# +----------------+----------+
# | Carver         |        2 |
# | Chabon         |        1 |
# | DeLillo        |        1 |
# | Eggers         |        3 |
# | Foster Wallace |        2 |
# | Gaiman         |        3 |
# | Harris         |        1 |
# | Harris         |        1 |
# | Lahiri         |        2 |
# | Saunders       |        1 |
# | Smith          |        1 |
# | Steinbeck      |        1 |
# +----------------+----------+

# max and min
SELECT Max(pages) FROM books ;


# Subqueries 

# you can layer features in side of a query,you are basically running a select INSIDE of a variable.  ... 

SELECT title, pages FROM books WHERE pages=(SELECT Min(pages) FROM books);

# but like, why do you need to do that when...
SELECT title, pages FROM books ORDER BY pages ASC LIMIT 1;


#Using GroupBy with Min/Max
SELECT   -- Obviously... selecting 
    author_fname, 
    author_lname,
    Min(released_year) -- now only grabbing the minimum released years
FROM books
GROUP BY -- Remember that first and last names can be the same ... so you gotta put both names in. 
    author_lname,
    author_fname;
    
    
    #test  -- Find the longest page count 
SELECT Max(pages) author_fname, author_lname
FROM books
GROUP BY 
author_lname, author_fname;


# -- # -- # 
## SUM- adds things together. 


-- Example 1
SELECT SUM(pages) FROM books;

-- Example 2 -- WITH GROUP BY!

SELECT SUM(pages), author_fname, author_lname 
    FROM books
    GROUP BY 
    author_fname, author_lname; 
    

-- example 3 -- with group By and Concat

SELECT SUM(pages), CONCAT(author_fname, ' ', author_lname) FROM books
GROUP BY author_fname, author_lname;

-- example 4 -- lets sort these mother-lickers


SELECT SUM(pages), CONCAT(author_fname, ' ', author_lname) FROM books
GROUP BY author_fname, author_lname ORDER BY SUM(pages) ASC; 

# MAXIMUM EFFORT! 
SELECT SUM(pages) AS 'Total Pages written', CONCAT(author_fname, ' ', author_lname) AS 'Author Full Name' FROM books
GROUP BY author_fname, author_lname ORDER BY SUM(pages) DESC;


## -- ## -- ## -- THE AVERAGE FUNCTION AVG

SELECT AVG(released_year), CONCAT(author_fname, ' ', author_lname) FROM books 
GROUP BY author_fname, author_lname

-- yknow sometimes you feel like you just are starting to get it. 
SELECT AVG(pages), CONCAT(author_fname, ' ', author_lname) FROM books 
GROUP BY author_fname, author_lname


-- "Calculate the average stock quantity for books released in the same released_year"

SELECT AVG(stock_quantity), released_year FROM books GROUP BY released_year;

