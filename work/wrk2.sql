CREATE TABLE Studentss (
    student_id serial PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    address TEXT
);

-- Insert sample data into the Students table
INSERT INTO Studentss (first_name, last_name, date_of_birth, email, phone_number, address)
VALUES
    ('John', 'Smith', '1995-03-15', 'john.smith@example.com', '123-456-7890', '123 Main St, Anytown, USA'),
    ('Jane', 'Doe', '1997-09-20', 'jane.doe@example.com', '987-654-3210', '456 Elm St, Othertown, USA'),
    ('Alice', 'Johnson', '1996-12-10', 'alice@example.com', '555-123-4567', '789 Oak St, Anycity, USA');


CREATE TABLE Coursess (
    course_id serial PRIMARY KEY,
    course_name VARCHAR(100),
    course_description TEXT
);

-- Insert sample data into the Courses table
INSERT INTO Coursess (course_name, course_description)
VALUES
    ('Mathematics', 'Introduction to Mathematics'),
    ('History', 'World History and Civilizations'),
    ('Physics', 'Physics for Beginners'),
    ('Computer Sci', 'Introduction to Computer Science'),
    ('English', 'English Language and Literature');
-- alpahabetic order

select * from customer order by first_name;
 first_name | last_name
------------+-----------
 adi        | ev
 adithya    | k
 athira     | mj
 dhaya      | er
 manju      | e
 varsha     | p
(6 rows)


-- to ascnd
 select * from customer order by first_name asc;
 first_name | last_name
------------+-----------
 adi        | ev
 adithya    | k
 athira     | mj
 dhaya      | er
 manju      | e
 varsha     | p
(6 rows)

-- to descnd

postgres=# select * from customer order by first_name desc;
 first_name | last_name
------------+-----------
 varsha     | p
 manju      | e
 dhaya      | er
 athira     | mj
 adithya    | k
 adi        | ev
(6 rows)


-- to updae

postgres=# update customer set salary=2000.0 where last_name='ev';
UPDATE 1
postgres=# update customer set salary=3000.0 where last_name='p';
UPDATE 1
postgres=# update customer set salary=4000.09 where last_name='er';
UPDATE 1
postgres=# update customer set salary=1000.09 where last_name='e';
UPDATE 1
postgres=# update customer set salary=1500.09 where last_name='mj';
UPDATE 1
postgres=# update customer set salary=15000.09 where last_name='k';
UPDATE 1
postgres=# select * from customer;
 first_name | last_name |  salary
------------+-----------+----------
 adi        | ev        |     2000
 varsha     | p         |     3000
 dhaya      | er        |  4000.09
 manju      | e         |  1000.09
 athira     | mj        |  1500.09
 adithya    | k         | 15000.09
(6 rows)



-- same first name llore salary thammil plus akum
 select first_name,sum(salary) as total_salary from customer group by first_name;