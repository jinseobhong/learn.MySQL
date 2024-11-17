# IS NOT NULL
- Select a row that can refer to the value of the data
## people with commissions
<pre>
<code>
select
	*
from
	employees
where
	commission_pct is not null;
</code>
</pre>
## Check if there are any employees without department numbers
<pre>
<code>
select
	*
from
	employees
where
	department_id is null;
</code>
</pre>
