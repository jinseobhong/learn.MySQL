use hr;
-- 날짜 데이터도 대소비교가 가능
-- 날짜는 미래일 수록 크다. 오늘보다 내일이 더 큼. 어제보다 오늘이 더 큼.
-- 고용 날짜(hire_date) 2008년 이후인 사람들 선택
select
	*
from
	employees
where
	hire_date >= '2008/01/01';
-- 연봉(salary * 12)이 100000 이상인 사람들 선택
select
	*
from
	employees
where
	(salary * 12) >= 100000;
-- 월급여가 15000 이상인 사람들 선택
select
	*
from
	employees
where
	salary >= 15000;
-- 문자의 대소비교 
-- 사전 상 알파벳 순서 뒤에 나올 수록 큰 값.
-- 이름이 U랑 같거나 뒤에 나오는 이름을 가진 사원들 선택
select
	*
from
	employees
where
	first_name >= 'U';
-- 성이 G보다 앞에 나오는 이름을 가진 사원들 선택
select
	*
from
	employees
where
	last_name <= 'G';
-- 등가비교 연산자
-- 같다 : =
-- 다르다 : !=, <>
-- 부서번호가 30번이고 급여가 3100달러가 아닌 사원을 선택
select
	*
from
	employees
where
	job_id = 30
	and salary <> 3100;
-- 급여가 5000 ~10000 받고 있는 사원을 선택(5000 <= salary <= 10000)
select
	*
from
	employees
where
	salary >= 5000
	and salary <= 10000;
-- A ~ B 사이
-- between A and B
-- B가 A보다 클 경우 예외 발생
select 
	*
from
	employees
where
	salary between 5000 and 10000;
-- 급여가 3000 ~ 4000 사이인 사원들 선택
select
	*
from
	employees
where
	salary between 3000 and 4000;
-- 직책이 PU_CLERK 또는 SH_CLERK 또는 ST_CLERK 인 사람들을 선택
select
	*
from
	employees
where
	job_id = 'PU_CLERK'
	or job_id = 'SH_CLERK'
	or job_id = 'ST_CLERK';
-- IN(a,b,...) : a or b or ..
select
	*
from
	employees
where
	job_id in ('PU_CLERK', 'SH_CLERK', 'ST_CLERK');

select
	*
from
	employees
where
	employee_id = 123;
-- 100,101,102번 사원번호를 가지는 상사를 둔 사원들
-- 101, 101, 102번의 부하 직원들
select
	*
from
	employees
where
	manager_id in (100, 101, 102);
-- 논리부정연산자(NOT) : 주로 BETWEEN, IN, IS NULL, LIKE
-- 급여가 3000이 아닌 사원들 선택
select
	*
from
	employees
where
	not salary = 3000;
-- 직책이 PU_CLERK, SH_CLERK, ST_CLERK이 아닌 사람들을 선택
-- NOT IN 사용해서 선택
select
	*
from
	employees
where
	job_id not in('PU_CLERK', 'SH_CLERK', 'ST_CLERK');
-- 급여가 5000 ~ 8000 사이인 사원들 선택
select
	*
from
	employees
where
	salary between 5000 and 8000;
-- 급여가 5000 ~ 8000 사이가 아닌 사원들 선택
select
	*
from
	employees
where
	salary not between 5000 and 8000;
-- LIKE 연산자
-- 이름이 S로 시작하는 사원들 추출
-- % : 모든 문자열
select
	*
from
	employees
where
	first_name like 'S%';
-- 성이 T로 시작하는 사원들 선택
select
	*
from
	employees
where
	last_name like 'T%';
-- 이름이 n으로 끝나는 사원들 선택
select
	*
from
	employees
where
	first_name like '%n'
-- 성이 n으로 끝나는 사람들 선택
select
	*
from
	employees
where
	last_name like '%n';
-- 이름의 두번째 글짜가 1인 사원들 추출
-- _ <= 모든 문자 하나를 매칭
select
	*
from
	employees
where
	first_name like '_l%';
-- 이름의 3번째 글짜가 e인 사원들 선택
select
	*
from
	employees
where
	first_name like '__e%';
-- 이름에 le가 포함된 사람들
select
	*
from
	employees
where
	first_name like '%le%';
-- 이름에 le가 포함되지 않은 사람들 선택
select
	*
from
	employees
where
	first_name not like '%le%';
-- IS NULL : 데이터의 값을 참조할 수 없는 row(행) 선택
-- 커미션을 없는 사원들
-- NULL은 equlas(=)로 선택 불가능
select
	*
from
	employees
where
	commission_pct is null;
-- IS NOT NULL : 데이터의 값을 참조할 수 있는 ROW(행) 선택
-- 커미션이 있는 사람들
select
	*
from
	employees
where
	commission_pct is not null;
-- 부서 번호가 없는 사원이 있는 지 확인
select
	*
from
	employees
where
	department_id is null;
-- UNION : 쿼리의 연결 // 합집합
-- 부서번호가 20번인 사원들
select
	*
from
	employees
where
	department_id = 20;
-- 부서번호가 30번인 사원들
select
	*
from
	employees
where
	department_id = 30;
-- 부서번호가 20, 30번인 사람들
select
	*
from
	employees
where
	department_id in(20,30);
--
select
    *
from
    employees
where
    department_id = 20
union
select
    *
from
    employees
where
    department_id = 30
union
select
    *
from
    employees
where
    department_id = 40;
-- upper : 대문자로 변환
-- lower : 소문자로 변환
select
    first_name,
    upper(first_name) as uppercase_firstName,
    lower(first_name) as lowercase_firstName
from
    employees;
-- Mysql은 기본적으롣 데이터의 대소문자를 구분하지 않지만 테이블을 생성할 때 컬럼에 COLLATE 속성을 추가하면 대소문자를 구분함.

-- 이메일을 소문자로 변환해서 선택
select
    email,
    lower(email)
from
    employees;