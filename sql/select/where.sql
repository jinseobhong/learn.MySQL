-- Where
-- Conditional clause, Extract only data with the corresponding conditional expression true, and control the data contained

-- Select an employee whose name is Steven
use hr;
select
	*
from
	employees
where
	first_name = 'Steven';

-- Select only data with department number (department_id) of 30
use hr;
select
	*
from
	employees
where
	department_id = '30';

-- Select only data with department number (department_id) of 50
use hr;
select
	*
from
	employees
where
	department_id = 50;
