# Union 
- Connection between queries(forming a union)

## Select employees with department number 20
<pre>
<code>
use hr;
select
	*
from
	employees
where
	department_id = 20;
</code>	
</pre>
## Select employees with department number 30
<pre>
<code>
use hr;
select
	*
from
	employees
where
	department_id = 30;
</code>	
</pre>
## Select people with department numbers 20 and 30 as in
<pre>
<code>
use hr;
select
	*
from
	employees
where
	department_id in(20,30);	
</code>	
</pre>
## Form a union of people with department numbers 20 and 30 through Union.
<pre>
<code>
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
</code>	
</pre>
