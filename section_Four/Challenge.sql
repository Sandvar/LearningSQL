CREATE TABLE employees (employee_id INT NOT NULL AUTO_INCREMENT
                        , last_name VARCHAR(40) NOT NULL
                        , first_name VARCHAR(40) NOT NULL
                        , middle_name VARCHAR(40)
                        , age INT(150) NOT NULL
                        , current_status VARCHAR(12) NOT NULL DEFAULT 'EMPLOYED'
                        , PRIMARY KEY (employee_id)
                       );
                       
                       

INSERT INTO employees (first_name, last_name, age) 
    VALUES 
        ('Leif','sandvar',29),
        ('Jade','Perrin', 30),
        ('Zuko', 'Perrin', 7);
