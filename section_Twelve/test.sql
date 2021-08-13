# write this schema

CREATE TABLE students ( 
    id INT AUTO_INCREMENT not null PRIMARY KEY,
    first_name varchar(100)
);

CREATE TABLE papers(
    title VARCHAR(100), 
    grade INT, 
    student_id INT,
    FOREIGN KEY(student_id) REFERENCES students(id)
      ON DELETE CASCADE
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'),('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art Of The Essay', 98), 
(4, 'Borges and Magical Realism', 89); 


### This was all just setup

#1 -- PRINT THIS 
-- first_name, title, grade

SELECT first_name, title, grade 
FROM students
INNER JOIN papers 
    ON students.id = papers.student_id 
ORDER BY first_name DESC;

SELECT first_name, title, grade 
FROM students
LEFT JOIN papers 
    ON students.id = papers.student_id; 


SELECT first_name, IFNULL(title, 'MISSING') AS 'title', IFNULL(grade, 0) AS 'grade' FROM students
LEFT JOIN papers ON students.id = papers.student_id; 

-- PRINT THIS
-- first_name, average

SELECT first_name, IFNULL(avg(grade), '0') FROM students 
LEFT JOIN papers ON students.id = papers.student_id GROUP BY students.first_name ORDER BY papers.grade DESC ;




SELECT first_name, IFNULL(avg(grade), '0') as 'average',
    CASE
        WHEN AVG(grade)>=75 THEN 'passing'
        ELSE 'Failing'
END AS 'passing_status'
FROM students 
    LEFT JOIN papers 
        ON students.id = papers.student_id 
GROUP BY students.first_name
ORDER BY papers.grade DESC ;


