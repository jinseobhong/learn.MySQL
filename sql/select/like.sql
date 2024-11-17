-- Like
-- % : Any string that contains
-- _ : Checks if any one of the characters matches

-- Select employees whose names start with S
select
	*
from
	employees
where
	first_name like 'S%';

-- Select employees whose last name starts with T
select
	*
from
	employees
where
	last_name like 'T%';

-- Select employees whose names end with n
select
	*
from
	employees
where
	first_name like '%n'
	
-- Select people whose last names end in n
select
	*
from
	employees
where
	last_name like '%n';

-- Select employees whose name's second letter is 
select
	*
from
	employees
where
	first_name like '_l%';

-- Select employees whose name's third letter is 'e'
select
	*
from
	employees
where
	first_name like '__e%';

-- People with le in their names
select
	*
from
	employees
where
	first_name like '%le%';

-- Select people whose names do not contain le
select
	*
from
	employees
where
	first_name not like '%le%';
