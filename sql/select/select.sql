-- Select
-- Selects and returns result values ​​that meet the conditions
-- select * from table_name;

-- Select entire table data
use hr;
select * from employees;

-- Select entire Jobs table data
use hr;
select * from jobs;

-- Printing table partial columns(employee_id, first_name, salary)
use hr;
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
