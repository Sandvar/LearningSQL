    CREATE TABLE cats 
      ( 
         cat_id INT NOT NULL AUTO_INCREMENT, 
         name   VARCHAR(100), 
         breed  VARCHAR(100), 
         age    INT, 
         PRIMARY KEY (cat_id) 
      ); 
      
      #CRUD - create read update destory
      
      #READ - LIKE "SELECT * FROM X"
      

#Various Simple SELECT statements:

SELECT * FROM cats; 

SELECT name FROM cats; 

SELECT age FROM cats; 

SELECT cat_id FROM cats; 

SELECT name, age FROM cats; 

SELECT cat_id, name, age FROM cats; 

SELECT age, breed, name, cat_id FROM cats; 

SELECT cat_id, name, age, breed FROM cats; 

CODE: Introduction to WHERE

Select by age:

SELECT * FROM cats WHERE age=4; 

Select by name:

SELECT * FROM cats WHERE name='Egg'; 

Notice how it deals with case:

SELECT * FROM cats WHERE name='egG'; 




# cr UPDATEA e

# to update the content inside of a table, you can use the pair of set and UPDATE. 

UPDATE cats SET age=14 WHERE name='name';

# breaking this down into human speech. 

# I want hte database to update the cats table to SET the age to 14 for the cat who'se name is name. 

#for a real example in our list above; 

UPDATE cats SET age=14 WHERE name='misty';

# the line above wil change the cat who we named misty to a new age. Such as on her birthday!. 




#A GOOD PERSONAL RULE WOULD BE To always run a select command before running an update. It's easy to fix something before it's a problem. For example: 

SELECT * FROM cats WHERE name='misty';
#+--------+-------+-----------+------+
#| cat_id | name  | breed     | age  |
#+--------+-------+-----------+------+
#|      5 | Misty | Shorthair |   13 |
#+--------+-------+-----------+------+





########################### CHALLENEGE ############

#change jackson's name to jack
# as above im going to search first for cats with the name jackson to ensure im not going to accidentally change a bunch fo cat names.

SELECT * FROM cats WHERE name='Jackson';
# then I will update the name from Jackson to Jack. 
UPDATE cats SET name='jack' WHERE name='Jackson';

#Change ringo's breed to "BRITISH SHORTHAIR (lol, like the beatles)

UPDATE cats SET breed='British Shorthair' WHERE name='Ringo';




#CRU. - DESTROY/DELETE
#Similar to selecting things!


#IF YOU BREAK IT DOWN, to select all cats with the name EGG,


SELECT * FROM cats WHERE name='egg';

#now replace the select all... 

DELETE FROM cats WHERE name='egg';

#note: In the future you will be running commands that store data across multiple tables. ID's are static, they are constant. they do not change. 

##Note2: if you do not put a where clause in the delete command.. you are essentially writing delete all. 

### If you think about it, DELETE works the same as SELECT * 
### SO IF you put select * from cats without a WHERE clause, 
### IT GIVES YOU EVERYTHING



###########   DELETE PRACTICE   ########

# 1.) DELETE ALL 4 Year old cats (ringo)
SELECT * FROM cats WHERE AGE = 4;

DELETE FROM cats WHERE age =4;

## DELETE CATS whose age is the same as their cat_id.
SELECT * FROM cats WHERE age=cat_id;
