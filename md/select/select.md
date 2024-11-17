# Select
- Selects and returns result values ​​that meet the conditions
- select * from table_name;
## Select entire table data
<pre>
<code>
use hr;
select * from employees;
</code>
</pre>
## Select entire Jobs table data
<pre>
<code>
use hr;
select * from jobs;
</code>
</pre>
## Printing table partial columns(employee_id, first_name, salary)
<pre>
<code>
use hr;
select
	employee_id, 
	first_name,
	salary
from
	employees;
</code>
</pre>
## Printing table partial columns(last_name, hire_date, manager_id)
<pre>
<code>	
select
	last_name, 
	hire_date,
	manager_id
from
	employees;
</code>
</pre>
