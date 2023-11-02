    create database billing;
create table employee (
    pk_emp_id serial primary key ,
    type varchar (100) ,
    first_name varchar(200) ,
    last_name varchar (200) ,
    phone varchar (100) ,
    gender varchar (20) ,
    dob date
);

create table category(
    pk_category_id serial primary key ,
    category_name varchar (200),
    description varchar (400)
);

create table products(
    pk_product_id serial primary key,
    product_name varchar (200),
    fk_category_id int,
    description varchar (400),
    price float,
    added_date date
    foreign key(fk_category_id) references category(pk_category_id) on delete cascade on update cascade
);

create table bills(
    pk_bill_id serial primary key,
    customer_name varchar(400) ,
    customer_phone varchar (50) ,
    bill_date date
);

   alter table employee
   add employee_address varchar(200);

   alter table employee
   drop column employee_address;

   alter table products
   alter column price type int;

   alter table products
   rename column product_name to product_nm;

   alter table products
   alter column price type varchar(10);

   alter table products
   alter column price type int using price ::int;

   alter table products
   rename to items;

    \d employees
                                         Table "public.employees"
   Column   |         Type          | Collation | Nullable |                   Default
------------+-----------------------+-----------+----------+----------------------------------------------
 pk_emp_id  | integer               |           | not null | nextval('employees_pk_emp_id_seq'::regclass)
 first_name | character varying(50) |           |          |
 last_name  | character varying(50) |           |          |
 email      | character varying(50) |           |          |
 gender     | character varying(20) |           |          |
 phone      | character varying(20) |           |          |
 dob        | date                  |           |          |
 place      | character varying(50) |           |          |
Indexes:
    "employees_pkey" PRIMARY KEY, btree (pk_emp_id)
