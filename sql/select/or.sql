-- or
-- Returns at least one value that is true

-- Select employees with department numbers of 30 or AC_ACCOUNT positions
use hr;
select
	*
from
	employees
where
	department_id = 30
	or job_id = 'AC_ACCOUNT';
-- Select employees whose department number is 80 or whose position is ST_MAN
use hr;
select
	*
from
	employees
where
	department_id = 80
	or job_id = 'ST_MAN';
