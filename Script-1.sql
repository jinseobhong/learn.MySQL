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
-- job_id 가 MGR일 경우 급여를 10프로 인상, CLERK일 경우 5프로 인상, PRES는 그대로, 그 외는 3프로 인상
-- 사원번호, 이름, 직책id, 인상전 급여, 인상후 급여
-- case 연산의 결과가 될 대상 when 조건문 then 결과 ... else 나머지
select
	when substr(job_id,'MGR')
	then 
	job_id,
	concat(first_name,' ',last_name),
	salary+(salary*0.03)
	
from
	employees
where case 
