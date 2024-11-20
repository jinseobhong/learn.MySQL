	-- length() : 문자열 길이(byte 크기)를 구하는 함수
select
	first_name,
	length(first_name)
from
	employees;
-- 이름이 9글자 이상인 사원들을 선택
select
	*
from
	employees
where
	length(first_name) >= 9;
-- 한글 확인
-- 가상 테이블 : from  절 생략, 주로 함수 테스트용.
-- 한글은 1byte, 한글은 3byte
select
	length('안녕하세요');
-- 문자열 일부를 추출(substr, substring)
-- substr(str, start, length)
-- substr(추출할 문자열, 시작할 위치(인덱스:1부터 시작), 몇글자 추출할 것인지(생략가능, 생략하면 시작위치부터 끝까지)
-- substring도 동일하게 사용 가능
-- job_id의 언더스코어(_) 이후의 문자열 선택
select
	job_id,
	substr(job_id, 4)
from
	employees;
-- job_id에 언더스코어(_) 이전의 두글자 선택
select
	job_id,
	substring(job_id, 1, 2)
from
	employees;
-- 고용 날짜(hire_date)에서 연도만 선택
select
	hire_date,
	substr(hire_date, 1, 4) as 'hire year'
from
	employees;
-- 문자열 안에서 특정 문자 위치를 찾는 instr
-- instr(str1,str2)
-- instr(검색할 문자열, 찾을 문자열);
-- 인덱스 위치를 1부터 세서 반환.
-- 찾고자 하는 문자열이 없을 경우 0을 반환
-- 찾고자 하는 문자열이 여러개 있을 경우 찾은 첫번째 위치를 반환
select
	'Hello, MySQL!',
	instr('Hello, My SQL!', ' ');
-- 이름에 q가 들어 있는 지 사원들 선택
select
	*
from
	employees
where
	instr(first_name, 'q');
-- 문자열 대체하기
-- replace(original, search, replacement)
-- replace(문자열을 대체할 대상, 찾을 문자, 대체할 문자열);
select
	'010/1234/5678',
	replace('010/1234/5678', '/', '-');
-- 전화번호(phone_number) 칼럼의 '.'을 '-'로 대체
select
	phone_number,
	replace(phone_number, '.', '-') as 'phone number'
from
	employees;
-- concat: 문자열 연결
-- concat(연결할 문자열1, 연결할 문자열2, 연결할 문자열3, ...)
-- 사원 번호 : 사원 이름 으로 선택
select
	employee_id as 'employee id',
	first_name as 'first name',
	concat(employee_id, ' : ', first_name) as 'employee info'
from
	employees;
-- 풀네임 출력하기
select
	concat(first_name, ' ', last_name) as 'full name',
from
	employees;
-- trim() : 양 끝의 공백을 제거
select
	' my sql ',
	trim(' my sql ');
-- 반올림 : round()
select
	1234.5678,
	-- 소수 첫번째 자리에서 반올림
	round(1234.5678),
	-- 소수 두번째 자리에서 반올림
	round(1234.5678, 1),
	-- 소수 세번째 자리에서 반올림
	round(1234.5678, 2),
	-- 정수 첫번째 자리에서 반올림
	round(1234.5678,-1),
	-- 정수 두번째 자리에서 반올림
	round(1234.5678,-2)
	-- ceil : 가장 가까운 큰 정수 반환
select
	ceil(3.14);

select
	ceil(-3.14);
-- floor : 가장 가까운 작은 정수 반환
select
	floor(3.14);

select
	floor(-3.14);
-- 나머지 구하기 mod(n, n2) n % n2
select
	mod(15,
	6),
	-- 15 % 6
		15 % 6;
-- 급여를 3으로 나눈 나머지
select
	salary,
	mod(salary,
	3)
from
	employees;
-- 현재 날짜 시간 구하기
-- 시스템에서 날짜, 시간
select
	sysdate();
-- 날짜
select
	current_date();

select
	curdate();
-- 어제 날짜 구하기
select
	current_date() -1;
-- 실패
-- interval 1 day : 일
-- interval 1 week : 주
-- interval 1 month : 월
-- interval 1 year : 연도

select
	curdate() - interval 1 day as '어제 날짜';
-- 내일 날짜 구하기
select
	curdate() + interval 1 day as '내일 날짜';
-- 사원들의 입사 일주일 뒤의 날짜를 선택
select
	hire_date + interval 7 day as '입사 일주일뒤'
from
	employees;
-- 미래의 날짜(후의 날짜) - date_add(), adddate()
-- date_add(기준, interval)
-- 오늘부터 3개월 후의 날짜
select
	date_add(current_date(), interval 3 month);

select
	adddate(current_date(), interval 3 month);
-- 입사가 20주년이 되는 날(이름, 입사일, 입사 20주년) : 날짜는 미래일수록 크다
select
	concat(first_name, ' ', last_name),
	hire_date,
	adddate(hire_date, interval 20 year)
from
	employees;
-- 입사한 지 20년이 지난 사원들(이름, 입사일, 입사 20주년)
select
	concat(first_name, ' ', last_name),
	hire_date,
	adddate(hire_date, interval 20 year)
from
	employees
where
	current_date() >= addDate(hire_date, interval 20 year);
-- 두 날짜 또는 시간의 차이를 시:분:초 형태로 반환
select
	timediff(sysdate(), '2024/11/18 12:50:00');
-- 오늘 집에 가기까지 몇 시간 남았나
select
	timediff('2024/11/18 16:50', sysdate());
-- 둘 날짜 간의 일 수차이
-- datediff(비교할 날짜1, 비교할 날짜2)
-- 입사하고 몇일 지났나?
-- 이름, 입사일, 입사하고 몇일 지났나
select
	concat(first_name, ' ', last_name),
	hire_date,
	datediff(current_date(), hire_date)
from
	employees;
-- 자동형변환
-- 문자형형의 숫자형으로의 자동 형변환
-- 문자형이지만 숫자로 이루어져 있으므로 허용
select
	employee_id,
	employee_id + '500'
from
	employees;
-- 문자형이 숫자로 이루어져 있지 않더라도 해당 문자 앞에 숫자까지는 숫자로 인정
select
	employee_id,
	employee_id + '5a00'
from
	employees;
-- 문자형이 숫자로 변환 불가한 상황에서는 자동형변환하지 않고 데이터 처리의 예외(무시함.)
select
	employee_id,
	employee_id + '오백'
from
	employees;
-- 숫자를 문자로 변환
select cast(500 as char);
select convert(500, char);
-- 날짜 데이터를 문자로 변환
-- 오늘 날짜를 문자로 변환
select cast(sysdate() as char);
select convert(sysdate(), char);
-- 날짜를 문자로 변환할 때 형식 지정 가능
-- 소문자와 대문자의 출력 방식이 다름.
select date_format(sysdate(),'%Y %m %d');
-- 문자를 숫자로 변환
-- 숫자로 변환이 가능한 문자 이외의 문자가 섞이면 그 문자 이전까지 숫자로 변환
select
	cast('500' as signed);
select convert('500', signed);
-- 문자를 날짜로 변환
select '20241118', cast('20241118' as date);
select cast('2024-11-18' as date);
select cast('2024/11/18' as date);
select convert('241118', date);
select convert('2024-11-18', date);
select convert('2024/11/18', date);
-- 문자를 날짜로 변환할 때 형식을 지정
-- 날짜롭 변환하고자 하는 문자와 형식을 동일하게 지정해야함. 안맞추면 Null
select str_to_date('2024-11-18','%Y-%m-%d');
-- 요일
-- ko_KR(한국어_대한민국), en_US(영어_미국), ja_JP(일본어_일본)
set lc_time_names = 'ko_KR'; -- 시스템 설정 변경
select dayname(now()); 
select now();
select sysdate();

-- 2007년 이후 입사한 사원 (hire_date(date))
select
	*
from
	employees
where
	hire_date >= cast('2007-01-01' as date);
-- 날짜의 문자로의 자동 형변환
select
	*
from
	employees
where
	hire_date >= '070101';

-- 커미션을 포함한 연봉 구하기
-- 출력 컬럼 : 사원번호, 풀네임, 급여, 커미션퍼센트, 연봉((salary*12)+(salary*12*commition))
select
	employee_id,
	concat(first_name, ' ', last_name) as 'full name',
	commission_pct,
	IF(commission_pct is not null, (salary * 12)+(salary * 12 * commission_pct),(salary * 12)) as '연봉'
from
	employees;
-- Null은 연산에 들어가게 되면 전체 결과가 무조건 null로 반환됨
-- 참고 값 없음.

-- coalesce(대상 컬럼,null일 경우 줄 값);
-- 데이터가 있는 경우는 그 값
select
	employee_id,
	concat(first_name, ' ', last_name) as 'full name',
	commission_pct,
	(salary * 12)+(salary * 12 * coalesce(commission_pct,0)) as '연봉'
from
	employees;
select
	employee_id,
	concat(first_name, ' ', last_name) as 'full name',
	commission_pct,
	(salary * 12)+(salary * 12 * coalesce(commission_pct,0)) as '연봉'
from
	employees;


-- case 연산의 결과가 될 대상 when 조건문 then 결과 ... else 나머지 end
-- 부서번호가 10이면 '열', 20이면 '스물', 30이면 '서른' 나머지는 '숫자'

select
	department_id,
	case
		department_id
		when 10 then '열'
		when 20 then '스물'
		when 30 then '서른'
		else '숫자'
	end as 케이슨연습
from
	employees;

-- job_id 가 MGR일 경우 급여를 10프로 인상, CLERK일 경우 5프로 인상, PRES는 그대로, 그 외는 3프로 인상
-- 사원번호, 이름, 직책id, 인상전 급여, 인상후 급여
select
	employee_id as 사원번호,
	first_name as 이름,
	job_id as 직책id,
	salary as '인상전 급여',
	case
		substr(job_id, 4)
	when 'MGR' then salary * 1.1
		when 'CLERK' then salary * 1.05
		when 'PRES' then salary
		else salary * 1.03
	end as '인상 후 급여'
from
	employees;

-- 정렬과 역정렬
-- order by : 숫자, 문자, 날짜
-- order by 절은 항상 쿼리 마지막에
-- 오름차순(작은 순에서 큰 순) : order by 정혈할 컬럼명1, 컬럼명2 asc 혹은 생략
-- 내림차순(큰 -> 작은) : order by 컬럼명 desc

-- 부서번호가 30번 or 50번인 사원들을 부서번호 내림차순으로 정렬
select
	*
from 
	employees
where
	department_id in (30, 50)
order by
	department_id desc
	
	-- 부서번호가 30번 or 50번인 사원들을 부서번호 내림차순으로 정렬하고 사원번호는 오르마순으로
select
	*
from 
	employees
where
	department_id in (30, 50)
order by
	department_id desc,
	employees.employee_id asc;
-- 먼저 컬럼명1 기준으로 정렬한 후에 컬러명2 기준으로 정렬
-- 부서번호가 30번 or 50번인 사원들을 부서번호 내림차순으로 정렬하고 사원번호는 오름차 순으로 샐러리는 오른차순
select
	*
from 
	employees
where
	department_id in (30, 50)
order by
	department_id desc,
	employees.employee_id asc,
	employees.salary asc;
-- 입사가 최근 순으로 정렬
select
	*
from
	employees
order by
	hire_date desc;
-- case를 조건식만으로 사용하기(자바의 if 문처럼)
-- 사원번호, 이름, 급여, 커미션 여부(없다면 : 커미션 없음 출력, 있다면: 해당 값)
select
	employee_id,
	first_name,
	salary,
	case 
		when commission_pct is null
		or commission_pct = 0 then 'none'
		else commission_pct
	end as "커미션 여부"
from
	employees;
-- 급여가 15000달러 이상이면 '많음' 10000달러 이상이면 보통 
select
	salary as '급여',
	case
		when salary >= 15000 then '많음'
		when salary >= 10000 then '보통'
		else '적음'
	end as '급여 수준'
from 
	employees;
--  함수
-- 단일행 함수: length(), upper(), lower(), substr() 등등
-- 단일행 함수 : 함수 실행 겨로가가 데이터 하나하나로 추출됨.
-- exmaple : length()
select 
	first_name,
	length(first_name)
from employees;
-- 다중행 함수 : 함수 실행 결과가 하나의 결과로 추출 됨.
-- 모든 사람의 급여 합계
-- 합계를 구하는 sum()
select 
	sum(salary)
from
	employees;
-- 다중행 함수로 일발 컬럼을 같이 조회하려고 하면 예외 발생
-- 급여 합계 구하기
select
	sum(distinct salary),
	-- 중복 제거
	sum(all salary)
	-- 중복 제거 없음
	sum(salary)
	-- all을 쓴것과 같은 결과
from
	employees;
-- 모든 사원수 구하기(해당 테이블의 전체 데이터가 몇개인지?)
-- count()
select 
	count(*)
from 
	departments;
-- 부서번호가 30번인 사원수 구하기 
 select
	count(*);
 from employees where department_id =30;
 -- 커미션이 있는 사원의 수
select
	count(*)
from
	employees
where
	commission_pct is not null;
-- count(컬럼명) : 데이터가 null인 것을 제외한 컬럼의 수를 센다.
select 
	count(commission_pct)
from
	employees;
select 
	count(department_id)
from
	employees;
-- 부서 배정을 받은 사원의 수(department_id is not null)
select 
	count(department_id)
from
	employees;
select
	count(*)
from
	employees
where
	department_id is not null;
-- order by alias(축약어)로 가능
-- 별칭으로 정렬 가능 단, 공백이 포함된 별칭으로는 정렬 불가능.
-- where 절: 별칭으로 사용 불가능.
select 
	first_name as 이름,
	salary as 급여
from employees order by 급여 desc;
-- max(컬럼명) : 해당 컬럼에서 가장 큰 데이터를 반환. 최대값
-- 사원들 중에서 가장 급여를 많이 받고 있는 사원의 급여
select
	max(salary)
from employees;
-- 50번 부서에서 가장 많이 받는 사원의 급여
select
	max(salary)
from employees
where department_id = 50;
-- min(컬럼명) : 해당 컬럼에서 가장 작은 데이터를 반환, 최소값
-- 모든 사원들 중에서 가장 적게 받고 있는 사원의 급여
select min(salary)
from employees;
-- 30번 부서에서 가장 적게 받고 있는 사원의 급여
select min(salary)
from employees
where department_id = 30;
-- 가장 최근에 입사(= 가장 늦게 입사)한 사원의 입사일
-- 날짜 데이터는 현재에 가까울수록 즉 미래의 날짜가 더 크다
select max(hire_date)
from employees;
-- 가장 빨리 입사한 사람(= 최초 입사)한 사원의 입사일
select min(hire_date)
from employees;
-- 모든 사원들의 급여 평균
-- avg(컬럼명) : 해당 컬럼에 들어 있는 데이터의 평균값을 반환
select avg(salary)
from employees;
-- 모든 사원들의 급여 평균(정수) - 소수 첫 번째 자리에서 반올림
select
	round(avg(salary)) as 급여평균 -- avg(salary) 뒤에 , 1 = 소수 첫 번째 자리까지 추출해 줌(두 번째 자리에서 반올림), 2 = 세 번째 자리에서 반올림, 3 = 네 번째 ...
from employees;
-- 50번 부서의 평균 급여(정수)
select
	round(avg(salary)) as 평균_급여
from employees
where department_id = 50;
-- 부서 별 평균 급여
select
	department_id as 부서번호,
	round(avg(salary)) as 평균_급여
from
	employees
group by
	department_id;
-- 책 211p
-- group by 컬럼명 : 컬럼명 별로 그룹화가 됨. 다중행함수를 그룹별로 각각 실행해서 추출해라
-- 위 select절의 department_id~는 없어도 되나 직관적+보기 편하자고 남긴 것
-- group by 컬럼명1, 컬럼명2 : 컬럼명1로 그룹화, 컬럼명2로 그룹화
-- 부서별, 직책별 평균 급여
select
	department_id,
	job_id,
	round(avg(salary))
from employees
group by
	department_id, job_id
order by
	department_id;
	
select * from employees where department_id = 90;
-- 1. 부서별 평균급여 정렬(부서별). 2. 단, 평균 급여가 5000이 넘는 부서만 추출
select
	department_id,
--  first_name,           -- group by절에 없는 일반컬럼은 select절에 쓸 수 없음
	round(avg(salary)) as 평균급여
from employees
-- where round(avg(salary)) >= 5000 -- 어느 평균을 의미하는지 알 수 없음
group by
	department_id
	having 평균급여 >= 5000;
	
-- where : 조건절. 그룹화 '전'의 조건. false로 제외되면 그룹화 자격 상실. 단독으로 사용가능
-- having : 조건절. 그룹화 '후'의 조건. 단독으로 사용불가. group by와 함께 사용, Alias 사용 가능

-- 그룹화의 예
-- 여자그릅 2개
-- 연습생 남자 20 명, 여자 20명
-- where로 남자 연습생 아님. 조건으로 필터링
-- havaing 한국국적 (끄룹화 후에)

-- 각 부서별 직책별 평균급여를 정렬(부서별, 직책별)
-- 정렬(부서별, 직책별)
-- 조건1. 평균 급여가 5000 미만인 사람은 그룹화 대상에서 제외(급여가 5천 이상인 사원들이 대상)
-- 부서에 배정되지 않은 사원 제외
-- 조건2. 그룹화된 부서별 직책 중 평균 급여가 10000 이상인 경우만 선택

select
	department_id,
	job_id,
	round(avg(salary)) as 평균급여
from
	employees
where
	department_id is not null and
	salary > 5000
group by
	department_id,
	job_id
having
	평균급여 >= 10000
order by
	department_id asc;
-- 다중행 함수끼리는 select절에 함께 쓸 수 있다.
select
	max(salary),
	min(salary)
from
	employees;
-- 각 부서의 직책별 사원수, 가장 높은 급여(액수), 가장 낮은 급여(액수), 급여의 합, 급여의 평균(정수)
select
	department_id,
	job_id,
	count(*) as '각 부서별의 사원수',
	max(salary),
	min(salary),
	round(avg(salary))
from
	employees
group by
	department_id,
	job_id
order by
	department_id asc;
-- 소계와 총계 : rollup => 각 그룹별 결과 그리고 전체에 대한 결과 출력
select
	department_id,
	job_id,
	count(*) as '각 부서별의 사원수',
	max(salary),
	min(salary),
	round(avg(salary))
from
	employees
group by
	department_id,
	job_id
	with rollup
