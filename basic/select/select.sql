-- Queries are free format.

-- use database;
-- database you want to use
use hr;

-- desc table_name;
-- Print a description of the table
desc departments;

-- select * from table_name;
-- Select entire table data
select * from employees;

-- Select entire Jobs table data
select * from jobs;

-- Printing table partial columns(employee_id, first_name, salary)
select
	employee_id, 
	first_name,
	salary
from
	employees;

-- Printing table partial columns(last_name, hire_date, manager_id)
select
	last_name, 
	hire_date,
	manager_id
from
	employees;