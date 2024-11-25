-- 11/25
-- 참조키 삭제
-- ALTER TABLE 테이블명
-- DROP FOREIGN KEY 삭제할 제약조건명;
ALTER TABLE employees_temp
	DROP FOREIGN KEY fk_emptemp_dptid;
	
-- 참조키 제약조건명 변경은 삭제 후 다시 만들기
-- 참조키 위배된 데이터가 있는 경우 참조키 설정 불가
-- 제약조건 : NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK
-- CHECK 제약 조건
create table table_chk(
	name varchar(20),
	age int,
	gender char(1),
	CONSTRAINT chk_tblchk_gender check(gender IN('M','F')) -- M이나 F 아니면 여기에 들어오지 못하게 하겠다는 뜻
);
desc table_chk;
select* from table_chk;
-- 이미 만들어진 테이블의 컬럼에 check 제약 조건 추가
alter table table_chk
	add constraint  chk_tblchk_gender check(gender in('M','F'));
	
insert into table_chk
values('홍길동', 30, 'F');
update table_chk
set gender = 'A' -- 제약 조건은 등록 뿐만 아니라 수정할 때도 막아줌
-- CHECK 제약 조건 삭제
-- ALTER TABLE 테이블명
-- DROP CHECK 제약조건명;
alter table table_chk
	drop check chk_tblchk_gender;
	
-- DEFAULT
-- 값이 들어오지 않거나 정해지지 않은 경우(=NULL) DEFAULT로 지정한 기본값으로 등록, 수정
create table table_df(
	id int auto_increment primary key, -- 특별한 옵션을 지정하지 않아도 일반적으로 1, 2, 3, 4, ... 식으로 알아서 들어가는 '자동증가'. 뒤에 primary key가 자주 따라옴
	name varchar(20) default '홍길동',
--	create_date date default (current_date) -- 날짜만 필요하다면
	create_date datetime default current_timestamp -- 날짜와 시간 모두 필요하다면
);
desc table_df;
insert into table_df
values(); -- 괄호 안을 비워둬도 위 조건에 의해 입력됨
select * from table_df;
delete from table_df
where id = 5;
-- 가장 최근에 증가시킨 auto_increment의 값이 얼마인가
-- Table을 보면 알 수 있지만 만약 5번을 삭제했다면 4 다음 데이터는 6이 오기 때문에 판단이 힘듦
-- 방법 : 아래의 쿼리로 만약 5가 추출됐다면 그 다음에 insert는 6으로 들어갈거라고 예상가능
select last_insert_id();
-- 만약 초기값을 1000부터 하고 싶을 경우
-- ALTER TABLE 테이블명
-- AUTO_INCREMENT = 초기값;
alter table table_df
	auto_increment = 1000; -- 한 번 더 입력하면(위의 insert into table_df values();에 가서 실행) 1001로 하나 더 추가됨
-- 증가값을 변경하고 싶다면(기본값은 1씩 증가)
-- 주의 : 서버 기준이 되기 때문에(Dadabase의 hr 내) 모든 auto_increment 속성을 가지는 컬럼들이 동시에 변경되어버림
-- SET을 사용) 업데이트 할 때 썼던 SET과 비슷하지만 다른 게 해당 컬럼명을 건드리겠다는 거지만 여기서의 SET은 시스템을 건드리겠다는 뜻
-- SET @@AUTO_INCREMENT_INCREMENT = 증가값;
set @@auto_increment_increment = 1;
-- 다시 위의 insert에서 실행시키고 select * from table_df로 확인
-- 한 쿼리로 데이터 여러 개 넣기
-- values 뒤에 붙는 값이 들어가는 ()는 ,(콤마)를 구분자로 나열할 수 있음
create table table_2(
	id varchar(20),
	name varchar(30) -- 글자 당 한글 3byte 영문자 1byte
);
-- 일반적인 방법
insert into table_2 values('aaa','aaa');
insert into table_2 values('bbb','bbb');
insert into table_2 values('ccc','ccc');
-- 중복되는 부분을 지운 방법
insert into table_2 values('aaa','aaa'),('bbb','bbb'),('ccc','ccc');
select * from table_2;
-- 테이블의 구조만 복사
-- 테이블의 데이터는 제외하고 컬럼명, 데이터타입, NOT NULL, DEFAULT 속성만 가져와서 테이블을 만들고 싶으면
-- CREATE TABLE 테이블명
-- (SELECT 조회 where 1 <> 1) -- <> : 같지 않음(자바에서의 !=와 동일)
-- 1 <> 1 라는 조건 : 1은 1과 같지 않다고하는 조건은 무조건 false이기 때문에 어떤 데이터도 추출되지 않고
-- 해당 테이블의 구조만 가져올 수 있음 => 실무에서 아주 자주 쓰이는 꼼?수
-- 1 <> 1을 안 쓰면 데이터까지 복사 가능
create table table_df2(
	select * from table_df where 1 <> 1
);
desc table_df2;
select * from table_df2; -- 구조만 복사한 복사본
select * from table_df;  -- 원본
-- INSERT INTO와 SELECT를 이용하여 조회된 데이터를 바로 넣을 수 있음
-- INSERT INTO 데이터를 넣을 테이블명
-- SELECT로 조회
-- 주의 : 데이터를 넣을 테이블과 조회한 테이블의 컬럼의 개수와 데이터 타입이 맞아야 함
insert into table_df2
	select * from table_df;
-- INSERT 오류발생 시 대응 방법
create table table_in(
	id varchar(20) primary key,
	name varchar(30)
);
-- id가 aaa 이름은 홍길동
insert into table_in values('aaa', '홍길동'); -- id, name 순서에 맞게 주기
commit; -- auto_commit이 아니기 때문에
-- 한꺼번에 세 개를 실행한다면(블록씌운 후 Alt + X키)
insert into table_in values('aaa', '홍길동');
insert into table_in values('bbb', '손오공');
insert into table_in values('ccc', '사오정');
select * from table_in;
-- 첫 번째 방법
-- 만약 오류가 난다면 그냥 건너뛰고 나머지를 실행
-- INSERT INTO 사이에 IGNORE를 추가
-- INSERT IGNORE INTO 테이블명 VALUES (...);
insert ignore into table_in values('aaa', '홍길동'); -- 이미 위에서 추가함
insert ignore into table_in values('bbb', '손오공');
insert ignore into table_in values('ccc', '사오정');
rollback;
-- 두 번째 방법
-- 오류가 발생한다면 정해준 다른 값으로 수정
-- PK가 존재하면 : UPDATE, PK가 존재하지 않으면 : INSERT
-- INSERT 구문 후에 이어서
-- ON DUPLICATE KEY UPDATE 컬럼명 = 값, 컬럼명2 = 값2, ...;
insert into table_in values('aaa', '홍길동')
	on duplicate key update name = '저팔계'; -- PK가 존재하므로 update 실행됨
select * from table_in;
	
insert into table_in values('bbb', '손오공')
	on duplicate key update name = '홍길동'; -- PK가 존재하지 않으므로 insert 실행
	
-- WITH
-- 부서별 최고 급여 액수의 평균을 추출
select
	department_id as 부서, -- 일반 컬럼
	max(salary) as 최고급여액 -- 다중 컬럼이므로 실행불가능, 그룹화 필요
from employees
where department_id is not null -- 그룹화 전 where : 시?험
group by department_id;
-- 위의 쿼리 결과값이 그냥 aa라는 테이블이었다면?
-- select
--	round(avg(salary)) -- 소수점 제거 round(같이 따라오는 avg())
-- from employees; -- 모든 사원들을 대상으로 한 급여 평균값
select
	round(avg())
from aa;
-- 이럴 경우 WITH을 사용
-- 쿼리를 날려서 나온 결과가 존재하고 있는 테이블로 생각하고 쿼리를 만들 숭 ㅣㅆ다.
-- with CTE_테이블명(임의로) (컬럼명)
-- AS (SELECCT 조회 결과)
-- SELECT ... FROM CTE_테이블명;
with aa(부서, 최고급여액) as(
select
	department_id as 부서,
	-- 일반 컬럼
	max(salary) as 최고급여액
	-- 다중 컬럼이므로 실행불가능, 그룹화 필요
from
	employees
where
	department_id is not null
	-- 그룹화 전 where : 시?험
group by
	department_id) 
select round(avg(최고급여액)) from aa;
-- 부서별 최저급여를 다 다한값 추출
with bb(부서,몇명,가장적은급여) as (select
	department_id,
	count(*),
	min(salary)
from
	employees
group by
	department_id
)
select sum(가장적은급여) from bb;
-- IF(조건식, 참일 때 값, 거짓말일 때 값)
select if(2<1,'맞다','아니다');
-- 급여가 8000 이상이면 많다 아니면 적다
-- 이름, 급여, 결과(result)
select
	first_name,
	salary,
	if(salary >= 8000, '많다','적다') as result
from
	employees;
-- IFNULL : COALESCE 사용방법 동일
-- 커미션이 없으면 NULL 대신 0으로 (NULL은 어떤 연산을 하더라도 다 nULL로 반환하는 것을 주의)
-- IFNULL(NULL에 들어있는 칼럼명, NULL이면 줄 값)
select
	first_name,
	ifnull(commission_pct,0) as 결과 
from
	employees;

-- VIEW : 일반적인 사용자 입장 TABLE과 동일한 개체
-- 왜 만드냐?: 테이블에 특정 컬럼들을 추출하거나 조건을 붙여서 결과를 확인할 때
-- 			해당 결과를 자주 추출해야 하는 경우, 매번 쿼리를 치지 않고 VIEW를 활용해서 마치 하나의 테이블처럼 사용하고자 할때
-- CREATE VIEW 뷰이름(임의로)
-- AS (자주 추출해야 하는 SELECT 절);
-- 사원번호 ,이름, 급여, 번호, 부서명, 부서의주소, 부서의 우편번호
-- 정렬은 사원번호 순으로(오름 차순)
select
	e.employee_id as 사원번호, 
	e.first_name as 이름,
	e.salary as 급여,
	d.department_id as 부서번호,
	d.department_name as 부서명,
	l.street_address as '부서 번호',
	l.postal_code as '부서의 우편번호'
from
	employees e
	left join departments d 
	on e.department_id = d.department_id
	left join locations l
	on d.location_id = l.location_id ;
create view employees_imformation as (select
	e.employee_id as 사원번호, 
	e.first_name as 이름,
	e.salary as 급여,
	d.department_id as 부서번호,
	d.department_name as 부서명,
	l.street_address as '부서 번호',
	l.postal_code as '부서의 우편번호'
from
	employees e
	left join departments d 
	on e.department_id = d.department_id
	left join locations l
	on d.location_id = l.location_id );
select * from employees_imformation;
-- 뷰 삭제
drop view if exists employees_imformation;

-- 연습 문제
-- 매니저가 같은 사원들 별로 최저연봉을 추출
-- 1. 매니저가 없을 경우 제외 -- 그룹화 전에 조건 where
-- 2. 최저연봉이 6000 미만일 경우 제외 -- 그룹화 후에 조건 having
-- 3. 연봉이 높은 순으로 정렬
select
	manager_id,
	min(salary) as '최저급여'
from
	employees
where manager_id is not null -- 1번 조건
group by
	manager_id
	having 최저급여 >= 6000
order by 최저급여 desc;