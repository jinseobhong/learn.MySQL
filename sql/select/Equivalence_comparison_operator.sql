-- Equivalence comparison operator
-- Same as(true) : =
-- Different(false) : !=, <>
-- Select an employee whose department number is 30 and whose salary is not $3100.
select
	*
from
	employees
where
	job_id = 30
	and salary <> 3100;
-- Select employees whose salary is between 5000 and 10000 (5000 <= salary <= 10000)
select
	*
from
	employees
where
	salary >= 5000
	and salary <= 10000;