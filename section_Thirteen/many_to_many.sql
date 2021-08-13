## use Database TV Show Reviews

-- 

# The Many to Many Relationship

-- BOOKS <-> Authors
-- BLOG POST <-> TAGS
-- STUDENTS <-> CLASSES

# as a student you have many classes, you also have classmates, so classes have many students


#as an instagram user, you can have on your account many photos, and each photo has 30 tags, but each of those tags has an infinite amount of photos. 



# we will be working with a new type of table in this secitonALTER

# imagine a imdb database 

# # REVIEWERS standalone table
# id
# first_name
# last_name

# REVIEWS - dependant table, needs association with who's reviewing and whats being reviewed
# id - Primary Key
# rating - int
# series_id - Foreign Key 
# reviewer_id - Foreign Key


# # SERIES - standalone table
# id 
# title
# released_year
# genre



-- Lets get startedALTER

CREATE TABLE reviewers(
    id INT AUTO_INCREMENT PRIMARY KEY, 
    first_name VARCHAR(100), 
    last_name VARCHAR(100)
);

CREATE TABLE series(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    released_year YEAR(4), 
    genre VARCHAR(100)

);
 
 
CREATE TABLE reviews(
    id INT AUTO_INCREMENT PRIMARY KEY, 
    rating DECIMAL(2,1),
    series_id INT,
    reviewer_id INT,
    FOREIGN KEY (reviewer_id) REFERENCES reviewers(id)
        ON DELETE CASCADE,
    FOREIGN KEY (series_id) REFERENCES series(id)
        ON DELETE CASCADE
);
 
 
 
 INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
 
 
INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    
    
    INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);
    
    -- Challenge 1 
SELECT title, rating FROM series 
 JOIN reviews 
     ON series.id = reviews.series_id;
     
     -- challenge 2 
     
SELECT title, AVG(rating) FROM reviews
    JOIN series
        ON series.id = reviews.series_id GROUP BY series.id ORDER BY AVG(rating); -- explicitly declare where your ID's are coming from, names can be the same but ID's are always different. 
        


    -- challlenge 3, fname, rating. 
SELECT first_name, rating FROM reviewers
JOIN reviews
    ON reviewers.id = reviews.reviewer_id;

SELECT 
first_name, last_name, title, rating 
FROM reviews 
    JOIN series 
        ON series.id = series_id
    JOIN reviewers
        ON reviewers.id = reviewer_id; 
        
SELECT 
    title as 'unviewed series' 
    # rating 
FROM series 
    LEFT JOIN reviews 
        ON series.id = reviews.series_id
        WHERE rating IS NULL ;
        
SELECT 
    genre
    , AVG(rating) AS avg_rating 
FROM series 
    INNER JOIN reviews 
    ON series.id = reviews.series_id
    GROUP BY genre;
    
SELECT   
    first_name
    ,last_name
    ,COUNT(rating)
    ,MIN(rating)
    ,MAX(rating)
    ,ROUND(IFNULL(AVG(rating),0), 2) AS AVG  
    , CASE 
        WHEN COUNT(rating) IS NULL
            THEN 'inactive'
            ELSE 'active'
        END AS 'STATUS'
FROM 
    reviewers
    LEFT JOIN reviews
        ON reviewers.id = reviewer_id
        GROUP BY reviewers.id; 
        
        
         
SELECT   
    first_name
    ,last_name
    ,COUNT(rating)
    ,MIN(rating)
    ,MAX(rating)
    , ROUND(IFNULL(AVG(rating),0), 2) AS AVG,  
    CASE 
         WHEN COUNT(rating) >= 10 THEN 'POWER USER' 
         WHEN COUNT(rating) >0 THEN 'ACTIVE' 
         ELSE 'INACTIVE' 
    END AS 'STATUS'
FROM 
    reviewers
    LEFT JOIN reviews
        ON reviewers.id = reviewer_id
        GROUP BY reviewers.id; 
        
        
        # NOW GET ALL 3 TABLES
    SELECT title, rating, CONCAT(first_name, ' ', last_name) AS 'reviewer' FROM series
    INNER JOIN reviews 
        ON series.id=series_id
    INNER JOIN reviewers
        ON reviewers.id=reviewer_id 
        ORDER BY title;