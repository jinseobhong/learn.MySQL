-- Case convension
-- upper : Convert all alphabets to uppercase
use hr;
select
    first_name,
    upper(first_name) as uppercase_firstName
from
    employees;
-- lower : Convert all alphabets to lowercase
use hr;
select
    first_name,
    lower(first_name) as lowercase_firstName
from
    employees;
-- Convert email to lowercase and select
use hr;
select
    email,
    lower(email)
from
    employees;
