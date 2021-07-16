#CHALLENGES

#STEP 1: CREATE NEW DATABASE shirts db

CREATE DATABASE shirts_db;

#STEP1.5: use the database;
USE shirts_db;

#STEP 2: CREATE A NEW TABLE shirts

#shirt id, #Article (text) #color (text) # Shirt Size # Last Worn
CREATE TABLE shirts (
    shirt_id INT NOT NULL AUTO_INCREMENT,
    article VARCHAR(50),
    color VARCHAR(50),
    shirt_size VARCHAR(10), 
    last_worn INT(255),
    PRIMARY KEY (shirt_id)
);
SELECT * FROM shirts;
#step 3, Add a list of shirts
INSERT INTO shirts(article, color, shirt_size,last_worn)
VALUES 
    ('t-shirt','white','S',10),
    ('t-shirt','green','S', 200),
    ('polo shirt', 'black', 'M', 10),
    ('tank top', 'blue', 'S', 50),
    ('t-shirt','pink','S',0),
    ('polo shirt', 'red', 'M', 5),
    ('tank top', 'white', 'S', 200),
    ('tank top', 'blue', 'M', 15);

# step 4: Add a singular Shirt

INSERT INTO shirts(article, color, shirt_size, last_worn) VALUES ('polo shirt','purple', 'M', 50);
SELECT * FROM shirts;
# step 5: Select All shirts by category article and color
SELECT article, color FROM shirts;

#step 6: Select all medium shirts, display a table WITHOUT id. 
SELECT article, color, shirt_size, last_worn FROM shirts WHERE  shirt_size ='M';
SELECT * FROM shirts;
#step 7: UPDATE all polo shirts, change their size to L.

UPDATE shirts SET shirt_size ='L' WHERE article ='polo shirt';
SELECT * FROM shirts;
#step 8: update the shirt last worn 15 days ago, change last worn to 0 (you wore this shirt aparrently.);

UPDATE shirts SET last_worn=0 WHERE last_worn=15;
SELECT * FROM shirts;

#update all white shirts, size changed to XS and color to Off White

UPDATE shirts SET color='off white', shirt_size='Xs' WHERE color='WHITE';

SELECT * FROM shirts;
#DELETE - Delete all old shirts ( >200 days since last wear);

DELETE FROM shirts WHERE last_worn>=200;

# delete all tank tops. NO MORE MUSCLE SHIRTS!
DELETE FROM shirts WHERE article = 'tank top';

SELECT * FROM shirts;


DELETE FROM shirts; 