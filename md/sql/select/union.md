# Union 
- Connection between queries(forming a union)

## Select employees with department number 20
use hr;
select
	*
from
	employees
where
	department_id = 20;

## Select employees with department number 30
use hr;
select
	*
from
	employees
where
	department_id = 30;

## Select people with department numbers 20 and 30 as in
use hr;
select
	*
from
	employees
where
	department_id in(20,30);

## Form a union of people with department numbers 20 and 30 through Union.
use hr;
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
    department_id = 30;
