#1
## SELECT 10 != 10;
-- answer: 0 

## SELECT 15> 14 && 99-5 <= 94; 
-- answer: 1

## SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10; 
-- True?" 



#2 - select all books written before 1980 (non inclusive )
SELECT * FROM books WHERE released_year < 1980; 

#3 - SELECT all books written by eggers or chabon 
SELECT * FROM books WHERE (author_lname = 'Eggers' || author_lname = 'Chabon'); 
#4 select all books with page counts between 100 and 200 
SELECT * FROM books WHERE (pages >= 100 && pages <= 200);
#5 Select all boos where author_lname starts with a c or an s;
SELECT * FROM books WHERE (author_lname LIKE 'c%' || author_lname LIKE 's%') GROUP BY author_lname, author_fname;

#### CASE STATEMENTS
#6 if the title containes stories -> Short sories, just kids and a heartbreaking work-> memoir, everything else novel
SELECT title, author_lname, 
    CASE 
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN (title = 'Just kids' || title LIKE 'A heartbreaking work%') THEN 'Memoir'
        ELSE 'Novel'
    END AS TYPE
FROM books;

#BONUS: make this happen 

SELECT 
    title, author_lname, 
        CASE
            WHEN COUNT(title) = 1 THEN CONCAT(COUNT(title), ' book')
            ELSE CONCAT(COUNT(title),' books')
        END AS 'COUNT'
    FROM books 
GROUP BY author_lname, author_fname;





-- THIS WAS COLT'S EXAMPLE


    SELECT titlem author_lname FROM books 
        WHERE author_lname IN ('Eggers', 'Chabon'); -- remember that you can use a comma separarted list inside of a hand-typed sub-list such as here. If you have specific variables theoretically it would only pass through the entire list once, referencing eggers + chabon vs index x, rather then through iterating through the entire memory searching Eggers then chabon. not much of an improvement id say but it is another way to do it..
        
        -- This also enables you to add more authors later. 
        
        
        -- other colt examples that work for other answers
        
    SELECT title, author_lname FROM books 
    WHERE substr(author_lname,1,1) IN ('C','s');



    SELECT title, author_lname FROM books 
    WHERE substr(author_lname,1,1) = 'c' OR
          substr(author_lname,1,1) = 's'; 
    
