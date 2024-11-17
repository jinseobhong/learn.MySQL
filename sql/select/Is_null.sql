-- IS NULL : Select rows that cannot refer to data values
-- Employees without commission
-- NULL cannot be selected with equlas(=).
select
	*
from
	employees
where
	commission_pct is null;
