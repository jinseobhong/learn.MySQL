-- UNION 
-- Connection between queries(forming a union)

-- Select employees with department number 20
select
	*
from
	employees
where
	department_id = 20;

-- Select employees with department number 30
select
	*
from
	employees
where
	department_id = 30;

-- Select people with department numbers 20 and 30 as in
select
	*
from
	employees
where
	department_id in(20,30);

-- Form a union of people with department numbers 20 and 30 through Union.
select
    *
from
    employees
where
    department_id = 20
union
select
    *
from
    employees
where
    department_id = 30
