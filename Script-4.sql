-- 데이터 삭제
-- DELETE FROM 테이블명
-- WHERE 조건식;

-- departments_temp에 있는 320번 부서
use hr;
select * from departments_temp;
delete
from
	departments_temp
where department_id = 320;

-- 데이터 타입
/*
 * 1. 정수형 타입
 * - TINYINT : -128 ~127 (Byte)
 * - SMALLINT : -32,768 ~ 32,767(short)
 * - MEDIUMINT : -8,388,608 ~ 8,388,607
 * - INT OR INTEGER : -2^31 ~ 2^31-1
 * - BIGINT : -2^63 ~ 2^63-1 
* 2. 실수(부동소수점)
* - FLOAT
* - DOUBLE
* 3. 문자형
* - CHAR(n) : 고정길이 최대바이트수 n -> 데이터 입력 여부와 상관없이 메모리에 할당
* - VARCHAR(n) : 가변길이 최대바이트수 n -> 데이터 입력 여부에 따라 메모리에 할당된 크기가 다름
* - TEXT : 매우 긴 문자열
* 4. 날짜 및 시간
* - DATE : 날짜(YYYY-MM-DD)
* - TIME : 시간(HH:MM:SS)
* - DATETIME 혹은 TIMESTAMP : 날짜와 시간
* - YEAR : 연도
* 5. 진위형
* - BOOL 혹은 BOOLEAN : 참 과 거짓 (true,false)
* 6. 숫자 타입
* - Decimal(n) : 전체 자릿수를 N EX) DECIMAL(6) : 숫자 6자리
* - Decimal(n,n2) :  전체 자릿수 n, 소숫점은 n2자리 만큼만 허용
                        ex) DECIMAL(6,2) : 1234.56, 123.456(허용 안됨)
  - DECIMAL or NUMERIC
**/
-- 테이블 만든기
desc employees;
-- employee_id decimal(6,0)
-- first_name varchar(20)
-- last_name varchar(25)
-- email varhcar(25)
-- phone_number varchar(20)
-- hire_date date
-- job_id varchar(10)
-- salary decimal(8,2)
-- commission_pct decimal(2,2)
-- manager_id decimal(6,0)
-- department_id decimal(4,0)

-- CREATE TABLE 생성할 테이블명(
-- 컬럼명1 데이터타입, 컬럼명2 데이터타입, ...
-- );

create table employees_temp(
	employee_id decimal(6,0),
	first_name varchar(20),
	last_name varchar(25),
	email varchar(25),
	phone_number varchar(20),
	hire_date date,
	job_id varchar(10),
	salary decimal(8,2),
	commission_pct decimal(2,2),
	manager_id decimal(6,0),
	department_id decimal(4,0)
);
desc employees_temp;
select * from employees_temp;
-- 테이블을 변경하는 명령어 ALTER
-- 테이블에 새로운 칼럼 추가
-- ALTER TABLE 테이블명
-- ADD 추가할컬럼명 데이터타입
alter table departments_temp add hp varchar(20);
desc departments_temp;
-- 데이터 1개 넣기
-- 320, 'db', 100, 1700, '123-456'
insert into departments_temp
values(320,'db',100,1700,'123-456');

-- 컬럼 이름의 변경
-- ALTER는 커밋의 대상이 아님. 바로 적용
-- ALTER TABLE 테이블명
-- RENAME COLUMN 현재컬럼명(바꿀대상) TO 바꿀컬럼명
alter table departments_temp
	rename column hp to tel;
-- 컬럼의 자료형(데이터 타입) 변경
-- ALTER TABLE 테이블명
-- MODIFY 컬럼명 바꿀 데이터 타입
-- 주의) 기존에 들어가 있는 데이터에 반하는 데이터타입은 변경되지 않음
-- EX) 123-456이 들어있는 칼럼을 숫자타입으로 변경 X
alter table departments_temp
	modify tel varchar(30);
desc departments_temp;

-- 칼럼 삭제
-- 해당 칼럼의 데이터는 당연히 삭제되므로 주의
-- ALTER TABLE 테이블명
-- DROP COLUMN 삭제할 컬럼명
alter table departments_temp
	drop column tel;
desc departments_temp;

-- 테이블 이름을 변경
-- RENAME TABLE 기존테이블명 TO 바꿀 테이블명
rename table departments_temp to departments_rename;
desc departments_rename;
rename table departments_rename to departments_temp;
-- 테이블의 전체 데이터 삭제
-- 1) DELETE FROM 테이블명;(rollback 가능)
delete from departments_temp;
rollback;
select * from departments_temp;
-- 2) TRUNCATE TABLE : 테이블을 비우겠다.
-- TRUNCATE TABLE 테이블; (rollback 불가능)
truncate table departmnets_temp;

-- 테이블 삭제
-- DROP TABLE 테이블명; => 테이블이 없으면 예외
-- DROP TABLE IF EXISTS 테이블명; => 테이블이 없어도 예외 발생하지 않음.
drop table if exists departments_temp2;
-- 기본키 (PK : primary key) 설정
-- pk: UNIQUE(중복 불가), NOT NULL(null을 허용하지 않음)
create table table_1(
	id int primary key,
	password varchar(20)
);
desc table_1;
insert into table_1
values(1, null);
select * from table_1;

-- auto_increment : 데이터 타입은 int or bigint
-- 중복되면 안되는 primaty key와 같이 사용
drop table if exists table_1;
create table table_1(
	id int auto_increment primary key,
	password varchar(20)
);
desc table_1;
-- auto_increment 사용법 : 생략하면 됨
insert into table_1(password)
values('abcd')
-- 1씩 증가되서 들어가는데 중간에 삭제하거나 하더라도 그 다음 숫자가 들어갑니다.
-- ex 1~16 까지 입력 / 13 삭제 할시 그 이후에 등록되는 번호는 13번이 아니라 17번임.

-- 제약 조건
-- NOT NULL : 해당 칼럼에 null이 들어오지 못하도록
drop table if exists table_nn;
create table table_nn(
	id varchar(20) not null,
	password varchar(40) not null,
	tel varchar(30)
);
desc table_nn;
insert into table_nn
values(1,1,null);

insert into table_nn
values(null,null,null)

update table_nn
set id = null
where id = '1'; -- 제약 조건에 not null 일 경우 수정 쿼리도 마찬가지로 NULL을 입력할 수 없음.

-- 이미 만들어진 테이블에 제약조건 추가
-- ALTER TABLE 테이블명
-- MODIFY 바꿀 컬럼명 바꿀 데이터 타입 추가할 제약 조건
-- NOT NULL 제약조건을 추가할 거라면 기존의 데이터에 NULL이 있으면 안됨.
alter table table_nn
	modify tel int not null;
truncate table table_nn;
desc table_nn;
-- 이미 만들어진 테이블의 제약 조건 삭제
-- ALTER TABLE 테이블명
-- MODIFY 바꿀 컬럼명 바꿀 데이터 타입
alter table table_nn
	modify tel int;
-- 제약조건명 확인하는 방법(모든 데이터베이스에 모든 제약조건들)
select
	*
from
	information_schema.table_constraints
where 
	TABLE_SCHEMA = 'hr' -- 확인할 데이터베이스 이름
	and TABLE_NAME = 'table_1'; -- 확인할 테이블 이름
	
-- UNIQUE : 중복 데이터를 허용하지 않음
-- 제약조건명을 주면서 제약조건을 걸고 싶을 때
-- CONSTRAINT 제약조건명 UNIQUE(제약조건을 줄 컬럼명)
-- 제약조건명 네이밍 방법 : 제약조건이름_테이블명_제약조건받을컬럼명	
create table table_unq(
	id varchar(20),
	password varchar(30) not null,
	tel varchar(40),
	constraint unique_tableuqn_id unique(id)
	);
desc table_unq;

insert into table_unq
values('123','123','123-456');

-- Null은 중복 데이터라고 판단하지 않음. 
-- UNIQUE는 단독으로 주지 않는다.
insert into table_unq
values(null,'123','123-456');
select * from table_unq;

-- 이미 만들어진 테이블에 UNIQUE 제약 조건 추가
-- 제약조건명을 주면서 추가
-- ALTER TABLE 테이블명
-- ADD CONSTRAINT 제약조건명 UNIQUE(제약조건을 걸 컬럼명)
truncate table table_unq;
alter table table_unq
add constraint unique_tableuqn_tel unique(tel);
desc table_unq;
-- 제약조건을 주는 방법
-- 1) 테이블을 만들면서 바로 주는 방법
-- 2) 테이블을 만들고 나서 뒤에 수정으로 주는 방법

-- unique 제약 조건 삭제(제약조건명이 필요한 이유)
-- ALTER TABLE 테이블명
-- DROP INDEX 제약조건명;
alter table table_unq
drop index unique_tableuqn_tel;
-- 제약 조건명 변경(삭제 후 다시 추가)

-- PRIMARY KEY(UNIQUE, NOT NULL을 가짐)
-- PRIMARY KEY는 테이블 당 하나만 존재하므로 따로 제약조건명을 붙여서 관리할 필요는 없음.
create table table_pk(
	id varchar(20) primary key,
	password varchar(30) not null,
	tel varchar(40) UNIQUE
);
desc table_pk;

-- Primary key
-- 중복값 허용 안함(UNIQUE 속성을 가지기 떄문에)
insert into table_pk 
values('123','123','123-456');
-- null을 허용하지 않음.
insert into table_pk 
values(null,'123','123-456');

-- PK 삭제
-- ALTER TABLE 테이블명
-- DROP PRIMARY KEY
alter table table_pk
drop primary key; -- not null 속성은 살아 있음.
 
-- PK 다시 지정
-- 테이블을 일단 만든 후에 나중에 PK 지정
-- ALTER TABLE 테이블명
-- ADD PRIMARY KEY(컬럼명)
alter table table_pk
	add primary key(id);

-- 참조키(외래키,forien key, fk)

-- 사원 테이블
-- department_id : FK, 주로 다른 테이블의 pk를 가지고 있는 형태
desc employees; -- MUL : 참조키
-- 부서 테이블
-- department_id : pk

-- join 
-- 사원번호, 이름, 급여, 부서번호, 부서명
select
	department_name
from
	employees e
join departments d
on
	e.department_id = d.department_id;
	
-- employees와 departments 테이블 사본
-- 사본을 만들면 컬럼명과 컬럼의 데이터 타입, not null까지는 가져옴.
-- 그 외 제약조건은 가져오지 않음.(ex : pk, fk, unique)
drop table if exists employees_temp;
create table employees_temp
	(select * from employees);
desc employees_temp;

drop table if exists departments_temp;
create table departments_temp
	(select * from departments);
	
desc departments_temp;

-- 참조키로 연결하기
-- 먼저 연결하고자 하는 테이블의 PK를 지정
alter table departments_temp 
	add primary key(department_id);
alter table employees_temp 
	add primary key(employee_id);

-- 참조키 연결
-- ALTER TABLE 테이블
-- ADD CONSTRAINT 제약조건명 
-- FOREIGN KEY(참조키 설정할 컬럼명) REFERENCES 참조할 테이블명(참조할 컬럼명: 일반적으로는 그 테이블의 pk)
alter table employees_temp
	add constraint fk_emptemp_dptid
	foreign key(department_id) references departments_temp(department_id);
desc employees_temp;

-- 참조키 제약조건
-- departments_temp 테이블에 있는 부서번호(10~270)가 아닌 사원은 employees_temp에 등록, 변경 불가
-- 존재하지 않는 부서번호를 입력하는 것을 방지
-- 테이블끼리의 연관관계 (사원 테이블과 부서테이블의 관계는 다대일의 관계)
-- 다: fk 일 :Pk
-- 등록할 때도 있는 부서 번호로
insert into employees_temp
	values(501,'길동','홍','gildong@gmail.com','010-1234-5678',sysdate(),'CLERK',5000,null,100,270);
-- 수정할 때도 있는 부서 번호로
update employees_temp
set department_id = 260
where employee_id = 501;

select * from employees_temp
order by employee_id desc;

-- 부서에 소속된 사원이 있다면 부서 삭제 불가.
delete from departments_temp
where department_id = 250; -- 소속된 사원이 없는 경우
select * from departments_temp;

-- 소속된 사원이 있는 경우(department_id를 가지고 있는 데이터가 employees_temp에 있는 경우)
delete from departments_temp
where department_id = 270; 

-- 참조된 데이터(글, 부서(pk))가 삭제되면 참조할 데이터(댓글,사원(fk))도 삭제되도록 하고 싶을 때
-- on delete cascade
drop table if exists board;
create table board(
	id int auto_increment,
	title varchar(100) not null,
	content varchar(500) not null,
	constraint pk_board_id primary key(id)
);

insert into board(title, content)
values('제목', '내용');
select * from board;

-- 댓글 테이블
create table reply(
	id int auto_increment,
	content varchar(300) not null,
	board_id int,
	constraint pk_reply_id primary key(id),
	constraint fk_reply_bid foreign key(board_id) references board(id) on delete cascade
);
