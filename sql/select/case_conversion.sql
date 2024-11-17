-- upper : Convert all alphabets to uppercase
select
    first_name,
    upper(first_name) as uppercase_firstName
from
    employees;
-- lower : Convert all alphabets to lowercase
select
    first_name,
    lower(first_name) as lowercase_firstName
from
    employees;
-- Convert email to lowercase and select
select
    email,
    lower(email)
from
    employees;