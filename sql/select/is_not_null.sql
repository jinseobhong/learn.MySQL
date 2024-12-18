-- IS NOT NULL
-- Select a row that can refer to the value of the data

-- people with commissions
use hr;
select
	*
from
	employees
where
	commission_pct is not null;

-- Check if there are any employees without department numbers
use hr;
select
	*
from
	employees
where
	department_id is null;
