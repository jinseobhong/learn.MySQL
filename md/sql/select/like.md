# Like
- % : Any string that contains
- _ : Checks if any one of the characters matches
## Select employees whose names start with S
<pre>
<code>
select
	*
from
	employees
where
	first_name like 'S%';
</code>
</pre>
## Select employees whose last name starts with T
<pre>
<code>
select
  *
from
  employees
where
	last_name like 'T%';
</code>
</pre>
## Select employees whose names end with n
<pre>
<code>
select
	*
from
	employees
where
	first_name like '%n'
</code>
</pre>
## Select people whose last names end in n
<pre>
<code>
select
	*
from
	employees
where
	last_name like '%n';
</code>
</pre>
## Select employees whose name's second letter is
<pre>
<code>
select
	*
from
	employees
where
	first_name like '_l%';
</code>
</pre>
## Select employees whose name's third letter is 'e'
<pre>
<code>
select
	*
from
	employees
where
	first_name like '__e%';
</code>
</pre>
## People with le in their names
<pre>
<code>
select
	*
from
	employees
where
	first_name like '%le%';
</code>
</pre>
## Select people whose names do not contain le
<pre>
<code>
select
	*
from
	employees
where
	first_name not like '%le%';
</code>
</pre>
