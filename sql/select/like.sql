-- Like
-- % : Any string that contains
-- _ : Checks if any one of the characters matches

-- Select employees whose names start with S
use hr;
select
	*
from
	employees
where
	first_name like 'S%';

-- Select employees whose last name starts with T
use hr;
select
	*
from
	employees
where
	last_name like 'T%';

-- Select employees whose names end with n
use hr;
select
	*
from
	employees
where
	first_name like '%n'
	
-- Select people whose last names end in n
use hr;
select
	*
from
	employees
where
	last_name like '%n';

-- Select employees whose name's second letter is 
use hr;
select
	*
from
	employees
where
	first_name like '_l%';

-- Select employees whose name's third letter is 'e'
use hr;
select
	*
from
	employees
where
	first_name like '__e%';

-- People with le in their names
use hr;
select
	*
from
	employees
where
	first_name like '%le%';

-- Select people whose names do not contain le
use hr;
select
	*
from
	employees
where
	first_name not like '%le%';
