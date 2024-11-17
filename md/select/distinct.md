# Distinct
- Remove duplicates with distinct
## Please select only the department number
<pre>
<code>
use hr;
select distinct 
	department_id 
from employees
</code>
</pre>
## When there are two or more columns, duplicates are removed when selected
<pre>
<code>
select distinct
	job_id,
	department_id
from
	employees;
</code>
</pre>
