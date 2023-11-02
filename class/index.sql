   CREATE INDEX employyes_email_idx ON employees(email);

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
    "employyes_email_idx" btree (email) 
    -- extra oru index add ayi