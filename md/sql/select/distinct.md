# Distinct
-- Remove duplicates with distinct
## Please select only the department number.
use hr;
select distinct 
	department_id 
from employees
## When there are two or more columns, duplicates are removed when selected.
select distinct
	job_id,
	department_id
from
	employees;
