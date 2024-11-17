-- In
-- Check if in contains one of all the values ​​contained in the parameter
-- iN(a,b,...) : a or b or ..

-- Select people with job_Id : PU_CLERK or SH_CLERK or ST_CLERK

-- When processing with or without using in
use hr;
select
	*
from
	employees
where
	job_id = 'PU_CLERK'
	or job_id = 'SH_CLERK'
	or job_id = 'ST_CLERK';

-- When processing using in
use hr;
select
	*
from
	employees
where
	job_id in ('PU_CLERK', 'SH_CLERK', 'ST_CLERK');

-- Employees with supervisors with employee numbers 100, 101, and 102(Subordinates of numbers 101, 101, and 102)
use hr;
select
	*
from
	employees
where
	manager_id in (100, 101, 102);
