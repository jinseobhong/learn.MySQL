# Where
- Conditional clause, Extract only data with the corresponding conditional expression true, and control the data contained

## Select an employee whose name is Steven
<pre>
<code>
use hr;
select
  *
from
	employees
where
	first_name = 'Steven';
</code>
</pre>
## Select only data with department number (department_id) of 30
<pre>
<code>
use hr;
select
	*
from
	employees
where
	department_id = '30';
</code>
</pre>
## Select only data with department number (department_id) of 50
<pre>
<code>
use hr;
select
	*
from
	employees
where
	department_id = 50;
</code>
</pre>
