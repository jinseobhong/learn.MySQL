-- Alias
use hr;
/*	Shortcut(alias) : as 'alias'
	Can implicitly enter spaces after a name and then type aliases
 	Spaces can be given when declaring aliases explicitly with the as keyword (when using ")
*/
--	Choose the name, last name, monthly salary, and annual salary of all employees, example :
select
	first_name firstN,
	last_name lastN,
	salary,
	(salary * 12) as 'annual income'
from
	employees e;
