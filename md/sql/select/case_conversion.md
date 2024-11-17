# Case conversion
- Change the case of letters
## upper
- Convert all alphabets to uppercase
<pre>
<code>
use hr;
select
    first_name,
    upper(first_name) as uppercase_firstName
from
    employees;
</code>
</pre>
## lower
- Convert all alphabets to lowercase
<pre>
<code>
use hr;
select
    first_name,
    lower(first_name) as lowercase_firstName
from
    employees;
</code>
</pre>
## Convert email to lowercase and select
<pre>
<code>
use hr;
select
    email,
    lower(email)
from
    employees;
</code>
</pre>
