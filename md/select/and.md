# And
- if all conditions are met
## Select an employee whose department number (department_id) is 30 and the position (Job_id) is PU_MAN
<pre>
<code>
use hr;
select
	*
from
	employees
where
	department_id = 30
	and job_id = 'PU_MAN';
</code>
</pre>
## Select employees with department number 50 and position ST_MAN
<pre>
<code>
use hr;
select
	*
from
	employees
where
	department_id = 50
	and job_id = 'ST_MAN';	
</code>
</pre>
