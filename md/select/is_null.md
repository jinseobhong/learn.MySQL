# IS NULL
- Select rows that cannot refer to data values
- NULL cannot be selected with equlas(=).

## Employees without commission
<pre>
<code>
use hr;
select
	*
from
	employees
where
	commission_pct is null;
</code>
</pre>
