CODE: Creating Databases
Creating Databases Code
Start the CLI:

mysql-ctl cli; 

List available databases:

show databases; 

The general command for creating a database:

CREATE DATABASE database_name; 


DROP DATABASE database_name; 

	For Example:

		DROP DATABASE hello_world_db; 

	Remember to be careful with this command! Once you drop a database, it's gone!


CREATE TABLE tablename
  (
    column_name data_type,
    column_name data_type
  );



The  Insert "formula":

		INSERT INTO table_name(column_name) VALUES (data);
		For example:

		INSERT INTO cats(name, age) VALUES ('Jetson', 7);




The Select "formula"; 

		SELECT * FROM cats;




the Insert "formula": 
	You can input a comma separated list of inputs, 

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
INSERT INTO people(first_name, last_name, age)
VALUES ('Tina', 'Belcher', 13);
INSERT INTO people(age, last_name, first_name)
VALUES (42, 'Belcher', 'Bob');
INSERT INTO people(first_name, last_name, age)
VALUES('Linda', 'Belcher', 45)
  ,('Phillip', 'Frond', 38)
  ,('Calvin', 'Fischoeder', 70);
DROP TABLE people; 

SELECT * FROM people; 

show tables; 


	
	
#cdfx 	CODE: MySQL Warnings
MySQL Warnings Code
DESC cats; 

Try Inserting a cat with a super long name:

INSERT INTO cats(name, age)
VALUES('This is some text blah blah blah blah blah text text text something about cats lalalalal meowwwwwwwwwww', 10);
Then view the warning:

SHOW WARNINGS; 

Try inserting a cat with incorrect data types:

INSERT INTO cats(name, age) VALUES('Lima', 'dsfasdfdas'); 

Then view the warning:

SHOW WARNINGS; 
	
	
	
	
	NULL AND NOT NULL
	
When you do not declare 