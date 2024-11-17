-- When processing with or without using in
-- Select people with job_Id : PU_CLERK or SH_CLERK or ST_CLERK
select
	*
from
	employees
where
	job_id = 'PU_CLERK'
	or job_id = 'SH_CLERK'
	or job_id = 'ST_CLERK';
-- in을 사용해서 처리할 경우
-- Check if in contains one of all the values ​​contained in the parameter
-- iN(a,b,...) : a or b or ..
select
	*
from
	employees
where
	job_id in ('PU_CLERK', 'SH_CLERK', 'ST_CLERK');

select
	*
from
	employees
where
	employee_id = 123;
-- Employees with supervisors with employee numbers 100, 101, and 102
-- Subordinates of numbers 101, 101, and 102
select
	*
from
	employees
where
	manager_id in (100, 101, 102);