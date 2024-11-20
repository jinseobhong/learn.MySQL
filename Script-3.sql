-- 조인(join)
-- 사원테이블(employees)과 부서테이블(departments) 함께 보고 싶다.
use hr;

select
	*
from
	employees;

select
	*
from
	departments;
-- 엉망, 데카르트의 곱(ex: 사원(107의 결과), 부서(27의 결과))
select
	*
from
	employees e,
	departments d;
-- 조인 조건식
-- employees 테이블이 가지고 있는 칼럼 department_id는 
-- departments 테이블의 Primary key
-- 조인을 하려면 다른 테이블의 pk를 칼럼으로 가지고 있어야 한다. => Foriegn key(외래 키)
-- employees 테이블의 department_id는 FK
-- departments 테이블의 department_id는 PK
select
	*
from
	employees e,
	departments d
where
	-- 조인 조건식
	e.department_id = d.department_id;
-- 사원번호, 이름, 급여, 부서번호, 부서명
select
	e.employee_id as empid,
	e.first_name,
	e.salary,
	-- e든 d든 상관없음. 둘다 똑같은 값을 가지고 있음.
	d.department_id,
	d.department_name
from
	employees e,
	departments d
where
	e.employee_id = d.department_id
order by
	e.employee_id;

select
	*
from
	locations;

desc employees;
desc locations; -- 같은 이름의 칼럼이 없다면 연관관계 x, 조인의 대상 x.
desc departments; -- location_id를 둘 다 가지고 있으니까 연관관계 o, 조인의 대상이 O

-- 급여가 8000 이상인 사원들의 사원번호, 이름, 급여, 부서번호, 부서명
select 
	e.employee_id,
	concat(e.first_name, ' ', e.last_name) as 'name',
	e.salary,
	e.department_id,
	d.department_name
from
	employees e,
	departments d
where
	e.employee_id = d.department_id
	and e.salary >= 8000
order by
	e.employee_id asc;
	
-- 자체 조인(테이블 하나로 같은 테이블에 있는 칼럼을 조인)
-- 사원번호, 이름, 상사의 사원 번호(manager_id)
select
	e.employee_id,
	concat(e.first_name, ' ', e.last_name) as 'name',
	e.manager_id as 'manager_id',
	concat(e2.first_name, ' ', e2.last_name) as 'manager_name'
from
	employees e,
	employees e2
where
	e.manager_id = e2.employee_id
order by
	e.employee_id;
-- join 키워드 사용
-- join 조인할 테이블명 on 조인 조건식
select
	e.employee_id,
	concat(e.first_name, ' ', e.last_name) as 'name',
	e.manager_id as 'manager_id',
	concat(e2.first_name, ' ', e2.last_name) as 'manager_name'
from
	employees e
join employees e2
on
	e.manager_id = e2.employee_id
order by
	e.employee_id;
-- Steven을 등장 -> 왼쪽 외부 조인
-- 사원번호, 이름, 상사의 사원번호, 상사의 이름
select
	e.employee_id as '사원_번호',
	concat(e.first_name,' ',e.last_name) as '사원_이름',
	coalesce(e.manager_id,'none') as '상사 이름',
	coalesce(concat(e2.first_name, ' ', e2.last_name),'none') as '상사의_이름'
from
	employees e
left join
	employees e2
on
	e.manager_id = e2.employee_id;
-- left join의 경우 동일한 column으로 하나로 합쳐지고 left 쪽(A)의 모든 데이터를 포함하고 B의 데이터는 null로 표시 됩니다.
-- https://kimsyoung.tistory.com/entry/3%EA%B0%9C-%EC%9D%B4%EC%83%81%EC%9D%98-%ED%85%8C%EC%9D%B4%EB%B8%94-LEFT-JOIN-%ED%95%98%EA%B8%B0
-- 킴벌리 등장
-- 사원번호, 이름, 부서번호, 부서명
select
	e.employee_id,
	concat(e.first_name, ' ', e.last_name) as '사원_이름',
	d.department_id,
	d.department_name
from
	employees e
left join
	departments d 
on
	e.department_id = d.department_id
order by
	e.employee_id;
-- join 키워드 사용
-- 사원번호, 이름, 급여, 부서번호, 부서명, 부서의 주소, 부서의 우편번호, 부서의 소속도시
select
	e.employee_id,
	concat(e.first_name, ' ', e.last_name) as '사원_이름',
	e.salary,
	d.department_id,
	d.department_name,
	l.street_address,
	l.postal_code,
	l.city
from
	-- 연관관계는 하나의 테이블과 관계가 있어도 조인 가능, e와 l은 연관관계가 없지만 d와 l은 연관관계가 있으므로 조인이 성립
	employees e ,
	departments d,
	locations l
where 
	e.department_id = d.department_id -- FK와 PK연결(다 대 일 관계)
	and d.location_id = l.location_id -- FK와 PK연결(다 대 일 관계)
	-- Fk와 Pk 연결, 다 대 일 관계
order by
	e.department_id asc;
-- 서로 연관되지 않은 테이블끼리 조인하려고 하면 예외 발생
-- 사원번호, 이름, 급여, 부서번호, 부서명, 부서의 주소, 부서의 우편번호, 부서의 소속도시
select
	e.employee_id,
	concat(e.first_name, ' ', e.last_name) as '사원_이름',
	e.salary,
	d.department_id,
	d.department_name,
	l.street_address,
	l.postal_code,
	l.city
from
	employees e
join departments d 
on
	e.department_id = d.department_id
join locations l 
on
	d.location_id = l.location_id
order by
	e.department_id asc;
-- 서브쿼리(쿼리 안의 쿼리) : 소괄호 생략하면 안됨,
-- Nancy보다 더 많이 급여를 더 많이 받고 있는 사원들을 조회
-- 사원번호, 사원 이름, 급여
select
	employee_id,
	concat(first_name, ' ', last_name),
	salary
from
	employees
where
	salary > (
	select
		salary
	from
		employees
	where
		first_name = 'Nancy');
-- 부서번호가 50번인 사람들의 최대긥여 보다 더 많은 급여를 받는 사원들
-- 사원번호, 이름, 급여
select 
	employee_id,
	concat(first_name, ' ', last_name),
	salary
from
	employees
where 
	salary > (
	select
		max(salary)
	from
		employees
	where
		department_id = 50)
order by
	salary desc,
	employee_id asc;
-- 서브쿼리에서 결과가 두개 이상일 때
-- Nancy와 Daniel의 급여 중 한쪽보다 클 때
select
	concat(first_name, ' ', last_name),
	salary
from
	employees
-- any 서브 쿼리의 결과가 둘 이상일 때 (or)
-- 서브 쿼리의 앞에 붙임
-- 기본적으로 서브 쿼리는 하나의 결과만을 출력해서 값을 비교 해야함.
where
	salary > any (
	select
		salary
	from
		employees
	where
		first_name in('Nancy', 'Daniel'));
-- 서브 쿼리에서 결과가 2개 이상 일때
-- Nancy와 Daniel의 급여들 보다 모두 클 때
-- all : 서브 쿼리의 결과가 둘 이상 일 때(AND)
select
	concat(first_name, ' ', last_name),
	salary
from
	employees
where
	salary > all (
	select
		salary
	from
		employees
	where
		first_name in('Nancy', 'Daniel'));
-- 급여를 많이 받는 순으로 정렬
-- order by 컬럼명
-- asc 오름차순(생략 가능) desc 내림차순
select
	*
from
	employees
order by
	salary desc;
-- 중복 제거
-- distinct
select
	distinct salary
from
	employees;
-- 급여를 많이 받고 있는 사원들의 top 5
-- MYSQL은 order by 뒤에 키워드 입력 가능한것이 몇가지 있음
-- limit : n개 한정으로 추출해달라.
-- limit 시작, 개수(시작은 생략 가능, 생략 시 0번째 인덱스부터 셈.)
select
	*
from
	employees
order by
	salary desc
limit 2,5;
-- limit 출력할 개수 OFFSET 시작 인덱스
select * from employees order by salary desc 
limit 5 OFFSET 2;
-- group by
-- 부서별로 급여의 합계
-- 부서번호, 합계
select
	department_id as '부서 번호',
	sum(salary) as '부서별 급여의 총합계'
from
	employees
group by
	department_id,
	salary;
-- 부서별로 급여의 합계, 급여합계가 100,000$ 이상인 부서만 추출
-- having
select
	department_id as '부서 번호',
	sum(salary) as '부서별 급여의 총합계'
from
	employees
group by
	department_id
having
	sum(salary) >= 100000;
-- 테이블 복사
-- departments 테이블 복사해서 연습용 테이블 생성
drop table if exists departments_temp;
-- 모든 컬럼을 가져와서 테이블을 복사해라
create table departments_temp (select * from departments);
-- 데이터 베이스 검색
select * from departments_temp;
-- DML(데이터 조작어)
-- SELECT(조회), INSERT(삽입), UPDATE(수정), DELETE(삭제)

-- 테이블에 데이터 입력
-- insert into 테이블명(컬럼명1, 컬럼명2, ...)
-- values(컬럼명1에 입력할 값, 컬럼명2의 입력할 값, ...)
-- 1번 키 값부터 순서대로 입력해야 함.
insert into departments_temp(department_id,department_name,manager_id,location_id)
values(280,'databaase',100,1700);
-- null : 참조할 데이터가 존재하지 않음
insert into departments_temp(department_id,department_name,manager_id,location_id)
values(290,'databaase2',100,null);
-- 컬럼 생략해서 location_id에 null 입력
insert into departments_temp(department_id,department_name,manager_id)
values(300,'databaase3',100); 
-- 테이블에 부서번호 310, 부서명 database4, manage_id =null, location_id =null
insert into departments_temp (department_id,department_name,manager_id,location_id)
values(310,'database4',null,null);
insert into departments_temp (department_id,department_name)
values(310,'database4');
-- Not null 제약 조건(속성)은 복사됨, null 속성이 no일경우 null 값을 입력할 수 없음.
insert into departments_temp (department_id,department_name)
values(null,null); -- 유효하지 않은 값을 매개변수에 입력했으므로, 예외 발생
-- 모든 컬럼 값을 넣을거라면 테이블명 뒤에 컬럼 나열을 생략 가능하다.
insert into departments_temp()
values(320,'databaase5',100,1700);
-- 데이터 수정(UPDATE)
-- UPDATE 테이블명 SET 컬럼명1 = 수정할 값1, 칼럼명2 = 수정할 값2
-- WHERE 조건식으로로 데이터를 특정해야 함. 특정하지 않을 경우 해당 칼럼의 모든 값을 수정.

-- DBeaver 의 수정 사항 반영 설정의 변경 = 윈도우-> 설정 -> 연결 -> 연결유형 -> auto commit 체크해제
-- DBeaver 의 데이터베이스의 트랙잭션 모드 변경 = 데이터베이스 -> 트랜젝션모드 -> 메뉴얼커밋(수동)

-- rollback 수정사항을 되돌리기, commit : 수정사항의 확정
-- 마지막 커밋한 시점으로 돌아감 
rollback;
-- 데이터 수정 사항의 확정
commit;
-- 310번 부서의 상사 ID(manager_id)는 101, location_id 는 1800
update
	departments_temp
set
	manager_id = 101,
	location_id = 1800
where
	department_id = 310;
select * from departments_temp dt;
-- 트랜잭션을 발생(데이터 변경의 발생) : INSERT, UPDATE, DELETE
-- ROLLBACK과 COMMIT의 대상
-- SELECT는 조회의 기능만 할뿐 데이터의 변경 기능이 없으므로 트랝개션을 발생시키지 않음.
