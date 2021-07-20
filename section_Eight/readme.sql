#DISTINCT


-- Distinct lets you choose all the 
 SELECT DISTINCT author_lname FROM books;
 # this will choose all individual names from books; 
 
# +----------------+
# | author_lname   |
# +----------------+
# | Lahiri         |
# | Gaiman         |
# | Eggers         |
# | Chabon         |
# | Smith          |
# | Carver         |
# | DeLillo        |
# | Steinbeck      |
# | Foster Wallace |
# | Harris         |
# | Saunders       |
# +----------------+

#which actually has an issue, since there are two authors with the same last name
 SELECT DISTINCT CONCAT(author_lname, ',' , author_fname) FROM books;
# +------------------------------------------+
# | CONCAT(author_lname, ',' , author_fname) |
# +------------------------------------------+
# | Lahiri,Jhumpa                            |
# | Gaiman,Neil                              |
# | Eggers,Dave                              |
# | Chabon,Michael                           |
# | Smith,Patti                              |
# | Carver,Raymond                           |
# | DeLillo,Don                              |
# | Steinbeck,John                           |
# | Foster Wallace,David                     |
# | Harris,Dan                               |
# | Harris,Freida                            |
# | Saunders,George                          |
# +------------------------------------------+


#order by- 
-- You can order the lists, they start out in the order you input them in, 
-- but if you use order by, you can order it in an alphabetical. 


#example INSTEAD of 
SELECT author_lname FROM books; 
# +----------------+
# | author_lname   |
# +----------------+
# | Lahiri         |
# | Gaiman         |
# | Gaiman         |
# | Lahiri         |
# | Eggers         |
# | Eggers         |
# | Chabon         |
# | Smith          |
# | Eggers         |
# | Gaiman         |
# | Carver         |
# | Carver         |
# | DeLillo        |
# | Steinbeck      |
# | Foster Wallace |
# | Foster Wallace |
# | Harris         |
# | Harris         |
# | Saunders       |
# +----------------+


SELECT author_lname FROM books ORDER BY author_lname;

# +----------------+
# | author_lname   |
# +----------------+
# | Carver         |
# | Carver         |
# | Chabon         |
# | DeLillo        |
# | Eggers         |
# | Eggers         |
# | Eggers         |
# | Foster Wallace |
# | Foster Wallace |
# | Gaiman         |
# | Gaiman         |
# | Gaiman         |
# | Harris         |
# | Harris         |
# | Lahiri         |
# | Lahiri         |
# | Saunders       |
# | Smith          |
# | Steinbeck      |
# +----------------+
# and putting that together with what we have already learned: 

SELECT DISTINCT author_lname FROM books ORDER BY author_lname;

#or ... if you want to descend 

SELECT DISTINCT author_lname FROM books ORDER BY author_lname DESC;

SELECT DISTINCT author_lname FROM books ORDER BY author_lname ASC;

SELECT SUBSTR(title, 1, 10), CONCAT_WS(',', author_fname, author_lname) as author, stock_quantity AS "stock" FROM books ORDER BY stock_quanti
ty DESC;

# +----------------------+----------------------+-------+
# | SUBSTR(title, 1, 10) | author               | stock |
# +----------------------+----------------------+-------+
# | Lincoln In           | George,Saunders      |  1000 |
# | fake_book            | Freida,Harris        |   287 |
# | Oblivion:            | David,Foster Wallace |   172 |
# | A Hologram           | Dave,Eggers          |   154 |
# | A Heartbre           | Dave,Eggers          |   104 |
# | Coraline             | Neil,Gaiman          |   100 |
# | Interprete           | Jhumpa,Lahiri        |    97 |
# | Cannery Ro           | John,Steinbeck       |    95 |
# | Consider t           | David,Foster Wallace |    92 |
# | The Amazin           | Michael,Chabon       |    68 |
# | Just Kids            | Patti,Smith          |    55 |
# | White Nois           | Don,DeLillo          |    49 |
# | Norse Myth           | Neil,Gaiman          |    43 |
# | The Namesa           | Jhumpa,Lahiri        |    32 |
# | 10% Happie           | Dan,Harris           |    29 |
# | The Circle           | Dave,Eggers          |    26 |
# | What We Ta           | Raymond,Carver       |    23 |
# | Where I'm            | Raymond,Carver       |    12 |
# | American G           | Neil,Gaiman          |    12 |
# +----------------------+----------------------+-------+
-- LOOKS like we need to sell whatever that George Saunders book is or its new. 
-- -- also, you don't need to have your sorted column display in your sorted search.ALTER

SELECT 
    SUBSTR(title, 1, 10), CONCAT_WS(',', author_fname, author_lname) as author FROM books ORDER BY stock_quantity DESC;


# +----------------------+----------------------+
# | SUBSTR(title, 1, 10) | author               |
# +----------------------+----------------------+
# | Lincoln In           | George,Saunders      |
# | fake_book            | Freida,Harris        |
# | Oblivion:            | David,Foster Wallace |
# | A Hologram           | Dave,Eggers          |
# | A Heartbre           | Dave,Eggers          |
# | Coraline             | Neil,Gaiman          |
# | Interprete           | Jhumpa,Lahiri        |
# | Cannery Ro           | John,Steinbeck       |
# | Consider t           | David,Foster Wallace |
# | The Amazin           | Michael,Chabon       |
# | Just Kids            | Patti,Smith          |
# | White Nois           | Don,DeLillo          |
# | Norse Myth           | Neil,Gaiman          |
# | The Namesa           | Jhumpa,Lahiri        |
# | 10% Happie           | Dan,Harris           |
# | The Circle           | Dave,Eggers          |
# | What We Ta           | Raymond,Carver       |
# | Where I'm            | Raymond,Carver       |
# | American G           | Neil,Gaiman          |
# +----------------------+----------------------+



-- you can ... you shouldn't ... but you can....

-- -- -- sort by multiple?!?!

SELECT author_fname, author_lname FROM books;
-- gives you 

# +--------------+----------------+
# | author_fname | author_lname   |
# +--------------+----------------+
# | Jhumpa       | Lahiri         |
# | Neil         | Gaiman         |
# | Neil         | Gaiman         |
# | Jhumpa       | Lahiri         |
# | Dave         | Eggers         |
# | Dave         | Eggers         |
# | Michael      | Chabon         |
# | Patti        | Smith          |
# | Dave         | Eggers         |
# | Neil         | Gaiman         |
# | Raymond      | Carver         |
# | Raymond      | Carver         |
# | Don          | DeLillo        |
# | John         | Steinbeck      |
# | David        | Foster Wallace |
# | David        | Foster Wallace |
# | Dan          | Harris         |
# | Freida       | Harris         |
# | George       | Saunders       |
# +--------------+----------------+



-- ###########LIMIT############### --

-- typically is used with some sort of ordring, shortens your list so that it only shows you like your first 2 or first 4 

-- doesn't make sense if you just used limit and then were only going by your database index. 


SELECT title FROM books LIMIT 3; 
## see... you can do it...


SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 5;
#LIMIT


# +----------------------------------+---------------+
# | title                            | released_year |
# +----------------------------------+---------------+
# | Lincoln In The Bardo             |          2017 |
# | Norse Mythology                  |          2016 |
# | 10% Happier                      |          2014 |
# | The Circle                       |          2013 |
# | A Hologram for the King: A Novel |          2012 |
# +----------------------------------+---------------+

### LIKE 
-- Very Useful
    -- WHERE is an exact match, 
    
    -- LIKE is for APPROXIMATE matches. 
    SELECT * FROM books WHERE title LIKE "Harry%"


-- % is a wildcard, so you can search for everything before or after the %
    -- If you were looking for all the harry potter books, but don't havethe exact titles, you can search for Harry Potter% because "and the chamber of secrets" or "the prisoner of azkaban" comes AFTER the "harry potter" 
    
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

-- And when you want it just at the beginning of the title
    SELECT title FROM books WHERE title LIKE'the%';
    
# +-------------------------------------------+
# | title                                     |
# +-------------------------------------------+
# | The Namesake                              |
# | The Circle                                |
# | The Amazing Adventures of Kavalier & Clay |
# +-------------------------------------------+
# 3 rows in set (0.00 sec)
    
    
    
    -- _____ is to find _* amount of characters
    
    -- For example, looking for a phone number; 
    
    #example phone number (250)-740-4181
    
    SELECT phone FROM people WHERE digits LIKE "(___)-___-4181";
    
#remember, when you do need to use these characters NOT AS wildcard characters, you can cancel them or exit out by slapping a backslash in there

SELECT title FROM books WHERE title like '%\_%';
# +-----------+
# | title     |
# +-----------+
# | fake_book |
# +-----------+
SELECT title FROM books WHERE title LIKE '%\%%'
# +-------------+
# | title       |
# +-------------+
# | 10% Happier |
# +-------------+