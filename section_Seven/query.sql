SELECT UPPER(REVERSE('why does my cat look at me with such hatred?'));

# What does this print oout? 


 SELECT
     REPLACE
         (
         CONCAT('I', ' ', 'like', ' ', 'cats'),
             ' ', 
             '_'
        );

-- Answer 'I-like-cats';

#replace all title spaces with '->'

SELECT REPLACE(title, ' ', '->')as 'Title' FROM books;

-- Write an authors last name in reverse and forwards and create columns mirroring 

SELECT author_lname as 'forward', REVERSE(author_lname) as 'reverse' FROM books; 

-- Write authors full names in caps

SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS 'Full Name IN caps' FROM books;

-- This one is a doozy: Write [the title] was released in [year]

SELECT CONCAT_WS(' ', title, 'was released in', released_year) as 'Blurb' FROM books;

-- this last one is just the lenght of each title listed. So [title][Character Count]

SELECT title as title, CHAR_LENGTH(title) as 'Character Length' FROM books;

-- THIS IS THE REAL LAST ONE
#SHORT TITLE (10 Char), Author lname, fname, quantity. 

SELECT CONCAT(SUBSTRING(title, 1, 10), '...') as 'Short Title', CONCAT(author_lname, ',', author_fname) AS 'author', CONCAT(stock_quantity, ' In stock.' ) as 'stock'  FROM books;