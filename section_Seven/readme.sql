#NEW SECTION- WE ARE A book store trying to fight back against kobo, amazon books, locally! 

# need to be more organized and smarter. 

# <!--- Insert Long winded explainer on writing a SQL File, --->



# you can Look up all the information you need directly from the MySQL Websites. There is a long list of all the string functions that we will go over here!

# IF you WANTED TO build a list of all the authors in a list, you would 

SELECT author_fname, author_lname FROM books;

#+--------------+----------------+
#| author_fname | author_lname   |
#+--------------+----------------+
#| Jhumpa       | Lahiri         |
#| Neil         | Gaiman         |
#| Neil         | Gaiman         |
#| Jhumpa       | Lahiri         |
#| Dave         | Eggers         |
#| Dave         | Eggers         |
#| Michael      | Chabon         |
#| Patti        | Smith          |
#| Dave         | Eggers         |
#| Neil         | Gaiman         |
#| Raymond      | Carver         |
#| Raymond      | Carver         |
#| Don          | DeLillo        |
#| John         | Steinbeck      |
#| David        | Foster Wallace |
#| David        | Foster Wallace |
#+--------------+----------------+

# Okay, so how about we get those names together in a single column? 

SELECT CONCAT( author_fname,  author_lname) FROM books;

#+-------------------------------------+
#| CONCAT( author_fname, author_lname) |
#+-------------------------------------+
#| JhumpaLahiri                        |
#| NeilGaiman                          |
#| NeilGaiman                          |
#| JhumpaLahiri                        |
#| DaveEggers                          |
#| DaveEggers                          |
#| MichaelChabon                       |
#| PattiSmith                          |
#| DaveEggers                          |
#| NeilGaiman                          |
#| RaymondCarver                       |
#| RaymondCarver                       |
#| DonDeLillo                          |
#| JohnSteinbeck                       |
#| DavidFoster Wallace                 |
#| DavidFoster Wallace                 |
#+-------------------------------------+

#okay almost there... now we need to add some separation to the names

SELECT CONCAT( author_fname,' ',  author_lname) FROM books;

#similar to how you would concatinate in any other language, you need to explicitly declare a space in line if you are working with data-sets such as these. 


#+------------------------------------------+
#| CONCAT( author_fname,' ',  author_lname) |
#+------------------------------------------+
#| Jhumpa Lahiri                            |
#| Neil Gaiman                              |
#| Neil Gaiman                              |
#| Jhumpa Lahiri                            |
#| Dave Eggers                              |
#| Dave Eggers                              |
#| Michael Chabon                           |
#| Patti Smith                              |
#| Dave Eggers                              |
#| Neil Gaiman                              |
#| Raymond Carver                           |
#| Raymond Carver                           |
#| Don DeLillo                              |
#| John Steinbeck                           |
#| David Foster Wallace                     |
#| David Foster Wallace                     |
#+------------------------------------------+

# you can even adjust the title column bar with the AS command. 

 select CONCAT( author_fname,' ',  author_lname) as 'Full Name' FROM books;
 
# +----------------------+
#| Full Name            |
#+----------------------+
#| Jhumpa Lahiri        |
#| Neil Gaiman          |
#| Neil Gaiman          |
#| Jhumpa Lahiri        |
#| Dave Eggers          |
#| Dave Eggers          |
#| Michael Chabon       |
#| Patti Smith          |
#| Dave Eggers          |
#| Neil Gaiman          |
#| Raymond Carver       |
#| Raymond Carver       |
#| Don DeLillo          |
#| John Steinbeck       |
#| David Foster Wallace |
#| David Foster Wallace |
#+----------------------+
#16 rows in set (0.01 sec)



#you can even auto add an auto spacing with CONCAT-WS
#w. with S. Space

#instead of this

SELECT CONCAT(title,'-',author_fname,'-',author_lname) as 'Book With Author' FROM books;

#write this 
SELECT CONCAT_WS('-',title,author_fname,author_lname) as 'Book With Author' FROM books;


# Leif, let's talk about sometihng you already hate: Substrings. 
SELECT SUBSTRING ('HELLO WORLD', 1, 4);
#thats right... this is 
#+--------------------------------+
#| SUBSTRING('HELLO WORLD', 1, 4) |
#+--------------------------------+
#| HELL                           |
#+--------------------------------+

# SUBSTRING('string', int, int){
#     int1 = start string, 
#     int2 = endstring,
#}


# YOU COULD ALSO TRY 
SELECT SUBSTRING('Hello World', 7);
# if you were writing this as a Java function it would be 
# SELECT SUBSTRING(string, int){
#    int= where to start substring 
#}

#### HELLO WORLD
#### 1234567 
#### 7+ 
SELECT SUBSTRING('Hello World', 7);
#+-----------------------------+
#| SUBSTRING('Hello World', 7) |
#+-----------------------------+
#| World                       |
#+-----------------------------+

# HOW ABOUT

SELECT SUBSTRING('HELLO WORLD', -3);
# IT WILL COUNT backwards from the endstring
## CAVEATS, 

### THE COUNTS IN MySQL start at 1, not 0. 

### I know that sounds fucked, but it's true. 

# SHORTCUT
# SUB STRING -- SUB STR --- SUBSTR();

#now let's put it all together!



SELECT CONCAT_WS(' ', author_fname, author_lname) as 'Author Name', CONCAT (SUBSTR(title, 1, 10), '...' ) as 'Short Title' FROM books ;







######## REPLACE ###### 

# you can also replace parts mid string. 

SELECT REPLACE('Hello World', 'o', '0');
# we will replace o with0

# replace is case sensitive,  

#LETS PUT IT ALL TOGETHER AGAINNNNALTER

SELECT
SUBSTR(
    REPLACE(title,'e', '3'),1,10
) AS 'weird String'
FROM books; 


### REVERSE ### 

SELECT REVERSE('Hello World');
-- tHIS WORKS VERY EXPLICITLY... Like flipping it into a mirror.ALTER


#char lenght;
SELECT CHAR_LENGTH('HELLO WORLD');

SELECT title, CONCAT_WS(',',author_lname, author_fname ) FROM books WHERE CHAR_LENGTH(title)>=14;

-- THIS JUST is... to count your character length. It also can be used as a function such as WHERE CHAR_LENGTH () >= num


-- UPPPER is toUpperCase. 
-- LOWER is toLowerCase

SELECT CONCAT('I LOVE THE  BOOK' , UPPER(title)) FROM books;    
