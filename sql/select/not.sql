-- not(Logical negation operator)
-- It is frequently used with BETWEEN, IN, IS NULL, and LIKE.

-- Select employees whose salary is not 3000$
select
	*
from
	employees
where
	not salary = 3000;

-- Select people whose job_id are not PU_CLERK, SH_CLERK, or ST_CLERK
-- Select using NOT IN
select
	*
from
	employees
where
	job_id not in('PU_CLERK', 'SH_CLERK', 'ST_CLERK');

-- Select employees whose salary is not between 5000 and 8000$
select
	*
from
	employees
where
	salary not between 5000 and 8000;
