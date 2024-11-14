use hr;
-- where : Conditional clause, Extract only data with the corresponding conditional expression true, and control the data contained
-- Select an employee whose name is Steven
select
	*
from
	employees
where
	first_name = 'Steven';
-- Select only data with department number (department_id) of 30
select
	*
from
	employees
where
	department_id = '30';
-- Select only data with department number (department_id) of 50
select
	*
from
	employees
where
	department_id = 50;