#Print the number of books in the database

SELECT COUNT(*) FROM books;

#Print out how many books were released in each yearALTER
SELECT COUNT(*), released_year FROM books GROUP BY released_year; 


#Print out the total number of books in stock;  
SELECT SUM(stock_quantity) FROM books; 

#Find the average released_year for each author
SELECT AVG(released_year) as 'Average Year', CONCAT(author_fname, ' ', author_lname) AS Author FROM books GROUP BY author_fname, author_lname;

#Find the Full Name of the author who wrote the longest book 

SELECT Max(pages), CONCAT(author_fname, ' ',author_lname) AS 'Author Full Name' FROM books GROUP BY author_fname, author_lname ORDER BY MAX(pages) DESC  LIMIT 1 ;

#make this happen (Table listed)


#+------+-----------------+-----------+
#| year | number of books | avg pages |
#+------+-----------------+-----------+
#| 1945 |               1 |  181.0000 |
#| 1981 |               1 |  176.0000 |
#| 1985 |               1 |  320.0000 |
#| 1989 |               1 |  526.0000 |
#| 1996 |               1 |  198.0000 |
#| 2000 |               1 |  634.0000 |
#| 2001 |               3 |  443.3333 |
#| 2003 |               2 |  249.5000 |
#| 2004 |               1 |  329.0000 |
#| 2005 |               1 |  343.0000 |
#| 2010 |               1 |  304.0000 |
#| 2012 |               1 |  352.0000 |
#| 2013 |               1 |  504.0000 |
#| 2014 |               1 |  256.0000 |
#| 2016 |               1 |  304.0000 |
#| 2017 |               1 |  367.0000 |
#+------+-----------------+-----------+

SELECT 
    released_year AS 'year'
    , COUNT(*) as 'number of books'
    , AVG(pages) AS 'avg pages' 
FROM books 
    GROUP BY released_year;