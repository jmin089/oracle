--drop table member;

create table member(
id varchar2(20) primary key,
pw varchar2(20),
name varchar2(20),
phone varchar2(20),
gender varchar2(6),
hobby varchar2(80)
);

insert into member(id,pw,name,phone,gender,hobby) values(
'aaa','1111','홍길동','010-1111-1111','M','game,golf,run'
);
insert into member values(
'bbb','1111','유관순','010-2222-2222','F','golf,book'
);
insert into member values(
'ccc','1111','이순신','010-3333-3333','M','cook,book'
);

insert into member values(
'eee','1111','강감찬','010-4444-4444','M','game,run,book'
);

insert into member values(
'ddd','2222','김구','010-5555-5555','M','golf,book,cook'
);

commit;

select * from member;

delete member where id='ddd';    --id가 ccc인거 삭제해라

select * from member;
update member set phone='010-3333-3333' where id='ddd';  --아이디가 ddd은 폰번호를 010-3333-3333으로 수정하고싶을때
select * from member;
commit;

select * from tab;  --내가 가지고있는 모든테이블 확인할때
desc member;
desc employees;
select create_date from employees;
select * from member;

select id,name from member;

select * from member;

select * from employees;  --select * from 테이블 보여주는 명령어

select emp_name, employee_id, salary*1342*12, commission_pct from employees order by salary desc;   --asc 낮은순 desc 높은순 order by 정렬

desc employees;   --타입이 뭔지를 보고싶을때

select hire_date,sysdate,round(sysdate-hire_date) from employees;  --sysdate 현재날짜  round()반올림

select distinct department_id from employees order by department_id asc;  --distinct 중복되는거 제거

select * from departments;

desc syuscore;

select emp_name from employees;

select emp_name from employees where emp_name='Donald OConnell';  --내용의 대소문자는 구별해야함.  변수,테이블명,컬명은 대소문자 구별안함.
