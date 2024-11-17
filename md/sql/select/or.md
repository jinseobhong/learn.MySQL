# Or
- Returns at least one value that is true

## Select employees with department numbers of 30 or AC_ACCOUNT positions
<pre>
<code>
use hr;
select
	*
from
	employees
where
	department_id = 30
	or job_id = 'AC_ACCOUNT';
</pre>
</code>
## Select employees whose department number is 80 or whose position is ST_MAN
<pre>
<code>
use hr;
select
	*
from
	employees
where
	department_id = 80
	or job_id = 'ST_MAN';
</pre>
</code>
