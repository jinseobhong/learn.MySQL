-- Between
-- Values ​​between A and B
-- between A and B
-- Exception occurs if B is greater than A

-- Select employees with salary between 5000 and 10000$
use hr;
select 
	*
from
	employees
where
	salary between 5000 and 10000;

-- Select employees with salary between 3000 and 4000$
use hr;
select
	*
from
	employees
where
	salary between 3000 and 4000;
