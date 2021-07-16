s
Creating Databases Code
Start the CLI:

mysql-ctl cli; 

List available databases:

show databases; 

The general command for creating a database:

CREATE DATABASE database_name; 


DROP DATABASE database_name; 

#	For Example:

		DROP DATABASE hello_world_db; 

#	Remember to be careful with this command! Once you drop a database, it's gone!


CREATE TABLE tablename
  (
    column_name data_type,
    column_name data_type
  );



#The  Insert "formula":

		INSERT INTO table_name(column_name) VALUES (data);
		For example:

		INSERT INTO cats(name, age) VALUES ('Jetson', 7);




#The Select "formula"; 

		SELECT * FROM cats;




#the Insert "formula": 
#	You can input a comma separated list of inputs, 

ie

	INSERT INTO table_name 
				(column_name, column_name) 
	VALUES      (value, value), 
				(value, value), 
				(value, value);		
		
		
				INSERT Challenge Solution Code
CREATE TABLE people
  (
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT
  );
  #Order Does matter as long as you declare the fields and match the field order, everything will be happy
    INSERT INTO people(first_name, last_name, age)
    VALUES ('Tina', 'Belcher', 13);
    
    
    # here's one with everything in reverseALTER
    INSERT INTO people(age, last_name, first_name)
    VALUES (42, 'Belcher', 'Bob');
   #and you can insert as many things as you want at any time!
    INSERT INTO people(first_name, last_name, age)
    VALUES('Linda', 'Belcher', 45)
      ,('Phillip', 'Frond', 38)
      ,('Calvin', 'Fischoeder', 70);
      
      
DROP TABLE people; 

SELECT * FROM people; 

show tables; 


	
	
#cdfx 	CODE: MySQL Warnings
#MySQL Warnings Code
DESC cats; 

#Try Inserting a cat with a super long name:

INSERT INTO cats(name, age)
VALUES('This is some text blah blah blah blah blah text text text something about cats lalalalal meowwwwwwwwwww', 10);
Then view the warning:

SHOW WARNINGS; 

#Try inserting a cat with incorrect data types:

INSERT INTO cats(name, age) VALUES('Lima', 'dsfasdfdas'); 

#Then view the warning:

SHOW WARNINGS; 
	
	
	
	
	NULL AND NOT NULL
	
#When you do not declare a restriction to null in a table definition, Null is a value allowed. 

#TO remove this permission, you need to declare it when you declare the table

# FOR EXAMPLE

CREATE TABLE test_table (
name VARCHAR(100) NOT NULL, 
age INT NOT NULL
);

#Now if you do not specifiy a name, It will show an empty space and not null. If you do not specify an int for the age, it will default to 0 

CRATE TABLE test_table (
name VARCHAR(100) DEFAULT 'To Be Decided', 
age INT DEFAULT 200
);

#To declare a default it's the same. Add a default value after your data-type declaration. 

#If you want to make sure no one inputs a manual NULL into the data, you have to mix NOT NULL And DEFAULT

CREATE TABLE test_table(
name VARCHAR(23) DEFAULT 'tbd' NOT NULL, 
age INT DEFAULT 0 NOT NULL, 
);



PRIMARY Keys

#YOU CAN just enter the same user data over and over and over again if you are just taking in raw data. 

ie: 
+---------+-----+
| name    | age |
+---------+-----+
| Leif    | 999 |
| UNNAMED |  23 |
| BUTT    |  43 |
| BUTT    |  43 |
| BUTT    |  43 |
| BUTT    |  43 |
| BUTT    |  43 |
| BUTT    |  43 |
| BUTT    |  43 |
+---------+-----+
9 rows in set (0.06 sec)


#To ensure you do have a way to identify an entry with the same name (imagine finding john smith in a phonebook.)

CREATE TABLE unique_id_table (
unit_id INT NOT NULL, 
name VARCHAR(100),
age INT, 
PRIMARY KEY (unit_id)
);

#this table creates a field for a unique id, and then declares a rule of not null for an INTEGER declaration. At the end it declares that the PRIMARY KEY is the unit ID value. Using a primary key is like ensuring that this data is uniquely identifyable. No duplicates. 

#annoying as hell though, so let's just make our query a little bit longer: 

CREATE TABLE unique_table2 (
    unique_id INT NOT NULL AUTO_INCREMENT
    ,name VARCHAR(100)
    ,age INT
    ,PRIMARY KEY (unique_id));
)



+-----------+------+------+
| unique_id | name | age  |
+-----------+------+------+
|         1 | leif |   29 |
|         2 | leif |   29 |
|         3 | leif |   29 |
|         4 | leif |   29 |
|         5 | leif |   29 |
|         6 | leif |   29 |
|         7 | leif |   29 |
|         8 | leif |   29 |
+-----------+------+------+
8 rows in set (0.00 sec)


