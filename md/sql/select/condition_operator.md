# Condition operator
- Comparing numbers
## Select people with annual salary (salary * 12) over 100000
<pre>
<code>
use hr;
select
	*
from
	employees
where
	(salary * 12) >= 100000;
</code>
</pre>
## Select people with a monthly salary of 15,000 or more
<pre>
<code>
use hr;
select
	*
from
	employees
where
	salary >= 15000;
</code>
</pre>
# Compare the size of characters
- In the dictionary, the later the value appears in alphabetical order, the larger the value.
## Select employees whose names are the same as or follow U
<pre>
<code>
use hr;
select
	*
from
	employees
where
	first_name >= 'U';
</code>
</pre>
## Select employees whose last name comes before G
<pre>
<code>
use hr;
select
	*
from
	employees
where
	last_name <= 'G';
</code>
</pre>
# Date data can also be compared
- The further in the future the date is, the larger the number. Tomorrow is greater than today, and today is more valuable than yesterday.
## Select people whose hire date (hire_date) is after 2008
<pre>
<code>
use hr;
select
	*
from
	employees
where
	hire_date >= '2008/01/01';
</code>
</pre>
