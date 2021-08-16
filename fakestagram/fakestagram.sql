CREATE DATABASE ig_clone; 

# DROP TABLE users; 

USE ig_clone; 

CREATE TABLE users( 
     id INT PRIMARY KEY AUTO_INCREMENT
    ,username VARCHAR(255) UNIQUE  NOT NULL 
    ,created_at TIMESTAMP DEFAULT NOW()
);
# DROP TABLE photos; 


CREATE TABLE photos(
     id INT PRIMARY KEY AUTO_INCREMENT
    ,img_url VARCHAR(255) NOT NULL
    ,user_id INT NOT NULL
    ,created_at TIMESTAMP DEFAULT NOW()
    ,FOREIGN KEY(user_id) REFERENCES users(id)
    );


# INSERT INTO users (username) VALUES
# ('N3rdvana'),
# ('buttCity'),
# ('lsandvar'); 

CREATE TABLE comments(
     id INT AUTO_INCREMENT PRIMARY KEY
    ,comment_text VARCHAR(255) NOT NULL,
    ,user_id INT NOT NULL
    ,photo_id INT NOT NULL 
    ,created_at TIMESTAMP DEFAULT NOW()
    ,FOREIGN KEY(user_id) REFERENCES users(id)
    ,FOREIGN KEY(photo_id) REFERENCES photos(id)
);


## im going to attempt the likes table ahead of Colt in his display. 

CREATE TABLE likes(
     photo_id
    ,user_id INT NOT NULL UNIQUE
    , created_at TIMESTAMP DEFAULT NOW()
    ,FOREIGN KEY photo_id REFERENCES photos(id)
    ,FOREIGN KEY user_id REFERENCES users(id)
    ## the way to make 1 user to 1 like; 
    ,PRIMARY KEY (user_id, photo_id)
);

CREATE TABLE follows(
     follower_id INT NOT NULL
    ,followee_id INT NOT NULL 
    ,created_at TIMESTAMP DEFAULT NOW()
    , FOREIGN KEY (follower_id) REFERENCES users(id)
    , FOREIGN KEY (followee_id) REFERENCES users(id)
    PRIMARY KEY(follower_id, followee_id)
);
