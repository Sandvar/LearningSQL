# 1. Find titles that contain the word stories. 

SELECT title FROM books WHERE title LIKE "%stories%";
#2. Find the longest book
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

#3. Print a summary containing the title and year, for the 3 most recent books
 SELECT CONCAT_WS(' - ',title, released_year) AS 'summary'
 FROM books ORDER BY released_year DESC LIMIT 3;
 
 #4. Find all books with an author_lname that contains a spaceALTER
 SELECT title, author_lname FROM books WHERE author_lname LIKE "% %";
 
 #5 Select the 3 books with the lowest stock
 SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity LIMIT 3;
 

 #6 Print title and Author name, sorted first by author lname and then by title;
 
 SELECT author_lname, title FROM books ORDER BY author_lname, title;
 
 #7 yell my favourite author is followed by every author.

SELECT UPPER(CONCAT('my Favourite author is ', author_fname ,' ', author_lname, '!')) as 'yell' FROM books ORDER BY author_lname;
