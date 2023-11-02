    \c demo

create  table student (id serial primary key,student_name varchar(50) not null,class varchar(10) not null,section varchar(10) not null);
CREATE TABLE
demo=# insert into student(student_name,class,section)values('jim','10','a'),('reen','9','b'),('arjun','11','c'),('suriya','10','b'),('diya','9','a'),('priya','11','b'),('sneha','10','c'),('sarah','9','a'),('sam','11','a'),('april','10','b');
INSERT 0 10
demo=# create  table student_grade (id serial primary key,student_id integer references student(id),subject varchar(50) not null, grade varchar(2) not null,mark float);


    insert into student_grade(student_id,subject,grade,mark) values(1,'chemistry','A',55.5),(1,'physics','B',65),(1,'biology','F',78.9),(2,'chemistry','B',24.5),(2,'biology','C',44);
INSERT 0 5
demo=# select * from student;
 id | student_name | class | section
----+--------------+-------+---------
  1 | jim          | 10    | a
  2 | reen         | 9     | b
  3 | arjun        | 11    | c
  4 | suriya       | 10    | b
  5 | diya         | 9     | a
  6 | priya        | 11    | b
  7 | sneha        | 10    | c
  8 | sarah        | 9     | a
  9 | sam          | 11    | a
 10 | april        | 10    | b
(10 rows)


demo=# select * from student_grade;
 id | student_id |  subject  | grade | mark
----+------------+-----------+-------+------
  1 |          1 | chemistry | A     | 55.5
  2 |          1 | physics   | B     |   65
  3 |          1 | biology   | F     | 78.9
  4 |          2 | chemistry | B     | 24.5
  5 |          2 | biology   | C     |   44
(5 rows)


select s.student_name, s.class, sg.grade 
from student s inner join student_grade sg 
on s.id = sg.student_id;
     student_name | class | grade
--------------+-------+-------
 jim          | 10    | A
 jim          | 10    | B
 jim          | 10    | F
 reen         | 9     | B
 reen         | 9     | C
(5 rows)

select s.student_name, s.class, sg.grade 
from student s inner join student_grade sg 
on s.id = sg.student_id
where sg.subject ='biology' and sg.grade ='F';

 student_name | class | grade
--------------+-------+-------
 jim          | 10    | F
(1 row)


 CREATE VIEW physics_A_grade AS
select s.student_name, s.class, sg.grade 
from student s inner join student_grade sg 
on s.id = sg.student_id
where sg.subject ='physics' and sg.grade ='A';



CREATE VIEW F_grade AS
select s.student_name, s.class, sg.grade 
from student s inner join student_grade sg 
on s.id = sg.student_id
where sg.grade ='F';

demo=# select * from F_grade;
 student_name | class | grade
--------------+-------+-------
 jim          | 10    | F
 jim          | 10    | F
(2 rows)


CREATE VIEW physics_failed AS
select s.student_name, s.class, sg.grade 
from student s inner join student_grade sg 
on s.id = sg.student_id
where sg.subject ='physics' and sg.grade ='F';

select * from PHYSICS_FAILED;
 student_name | class | grade
--------------+-------+-------
(0 rows)


  insert into student_grade(student_id,subject,grade,mark) values
(7,'chemistry','A',96),(8,'physics','B',88),(6,'biology','F',78.9),(8,'chemistry','C',71),(6,'physcis','F',22);


-- average
  create view top_student as
  SELECT s.student_name,sg.subject,avg(sg.mark) as average_marks
from student s
inner join student_grade sg
on s.id = sg.student_id
group by s.student_name,sg.subject
order by s.student_name,average_marks desc; 

 student_name |  subject  | average_marks
--------------+-----------+---------------
 jim          | chemistry |            94
 jim          | physics   |            88
 jim          | biology   |            35
 priya        | biology   |          78.9
 priya        | physcis   |            22
 reen         | chemistry |            88
 reen         | biology   |            75
 sarah        | physics   |            88
 sarah        | chemistry |            71
 sneha        | chemistry |            96
(10 rows)


 SELECT s.student_name,sg.subject,avg(sg.mark)
demo-# from student s
demo-# inner join student_grade sg
demo-# on s.id = sg.student_id
demo-# group by s.student_name,sg.subject;
 student_name |  subject  | avg
--------------+-----------+------
 jim          | biology   |   35
 reen         | chemistry |   88
 sarah        | chemistry |   71
 sneha        | chemistry |   96
 priya        | physcis   |   22
 priya        | biology   | 78.9
 sarah        | physics   |   88
 jim          | physics   |   88
 reen         | biology   |   75
 jim          | chemistry |   94
(10 rows)


  CREATE TABLE employees(
  pk_emp_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  gender VARCHAR(20),
  phone VARCHAR(20),
  dob DATE,
  place VARCHAR(50)
);

  insert into employees values
  (1,'adithya','ev','adi@gamil.com','female','9645517517','2003-10-4','calicut'),
  (2,'dhaya','er','dhaya@gamil.com','female','8645517517','2003-9-4','wayanad'),
  (3,'adithya','k','adithya@gamil.com','female','9645517519','2022-10-9','calicut'),
  (4,'samad','ek','samad@gamil.com','male','9685517517','2025-12-9','malapuram'),
  (5,'athira','m','athira@gamil.com','female','7645517517','2009-1-12','calicut'),
  (6,'baansha','o','baansha@gamil.com','female','9640017517','2012-10-21','gujarat'),
  (7,'ajnas','ali','ajnas@gamil.com','male','9685507519','2015-2-9','kannur'),
  (8,'akarsh','manoj','akarsh@gamil.com','male','8885517517','2003-10-4','kochi'),
  (9,'appz','l','appz@gamil.com','male','7045917517','2013-12-4','kollam'),
  (10,'sulaiman','op','sulu@gamil.com','male','3640017517','2003-10-4','gujarat');
  