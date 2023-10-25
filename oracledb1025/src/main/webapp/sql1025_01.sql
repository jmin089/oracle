select * from employees;

select salary+100,salary-100 from employees;

select sysdate,sysdate+365 from dual;    --dual 임시더미테이블 from 뒤에는 테이블이 있어야 하는데 확인만 하고자할때 의미 없지만 작성해야할때 사용.

select 1+4 from dual;

--문자(숫자) '3'을 사직연산을 하면 숫자로 자동변환
select 1+'3' from dual;

--문자 'a'는 사직연산 하면 에러
select 1+'a' from dual;

--문자는 사직연산을 할수 없음.
select 'a'+'b' from dual;

--문자 결혼은 ||, concat 명령어
select 'a'||'b' from dual;
select concat('a','b') from dual;

select * from employees;

--emp_name(email) 이렇게 출력하시오
--Donald OConnell(DOCONNEL)
select emp_name||'('||email||')' from employees;
select concat(emp_name,concat('(',concat(email,')'))) from employees;

--사원번호, 사원이름, 입사일자 출력후 입사일자 정렬
select employee_id,emp_name,hire_date from employees order by hire_date asc;

--00/01/01 이후 입사한 사원을 출력하시오
--00/01/01, 00-01-01, 2000-01-01
select * from employees where hire_date >= '00/01/01' order by hire_date asc;

-- 테이블 대신 데이터집합체가 들어올수 있음.
select count(*) from employees;    --갯수
select max(salary) from employees;  --최대값
select * from employees where salary=(select max(salary) from employees);  --이중커리

--null값이 아닌것만 출력
select * from employees where commission_pct is not null;

--부서번호가 80번 이상인 사원을 출력하시오
select * from employees where department_id >= 80 order by department_id asc;

--부서번호가 80번만 제외하고 사원을 출력하시오
--not 조건에 만족하지 못하는 것만 출력(다르다 !=, <, not)
select * from employees where not department_id = 80 order by department_id asc;
select * from employees where  department_id != 80 order by department_id asc;

--and : 조건을 모두 만족해야만 출력
--부서번호가 50번이면서 6000이상인 사원을 출력하시오
select *from employees where department_id = 50 and salary>=6000;

--급여가 2000이상 3000이하 출력
select * from employees where salary >= 2000 and salary <= 3000;

--between A and B
--between : 이상, 이하 (= 조건이 포함되어야함) not between : 미만, 초과(= 조건이 미포함되어야함)
select * from employees where salary between 2000 and 3000;

--급여 평균 avg()
--그룹함수 avg,count,max,min
select avg(salary) from employees;

--salary 6461이하
select * from employees where salary <= 6461 order by salary desc;   --추가시 수정해야함
select * from employees where salary <= (select avg(salary) from employees) order by salary desc;  --추가시 수정하지 않아서 알아서 출력

--or : 조건중 한가지만 만족해도 출력
--salary 3000,4000,6000인 사원 출력
select * from employees where salary = 3000 or salary = 4000 or salary = 6000;
select * from employees where salary in(3000,4000,6000);

--사원번호가 101,151,200인 사원의 사원번호, 급여 출력
select employee_id,salary from employees where employee_id = 101 or employee_id = 151 or employee_id = 200;
select employee_id,salary from employees where employee_id in(101,151,200);

--급여가 2000미만, 3000초과인 사원을 출력하시오.
select * from employees where salary < 2000 or salary > 3000;
select * from employees where salary not between 2000 and 3000;

--입사일 00/01/01 - 00/12/31 사원을 출력하시오.
select * from employees where hire_date >= '00/01/01' and hire_date <= '00/12/31';
select * from employees where hire_date between '00/01/01' and '00/12/31';

select emp_name from employees;
--like : 결과값 안에 원하는 조건만 찾아 출력
--S로 시작되는 이름을 출력하시오.
--S%는 시작하는 %n 끝나는 %e% 어디든 포함
select emp_name from employees where emp_name like 'S%';
--n로 끝나는 이름을 출력하시오.
select emp_name from employees where emp_name like '%n';
--처음, 끝,중간(어디든) e가 있는 이름을 출력하시오.
select emp_name from employees where emp_name like '%e%';

select * from board;

--bcontent 컬럼에 'ven' 단어가 들어가 있는 게시글을 출력하시오.
select * from board where bcontent like '%faucibus%';
--btitle 'ven' 개수 bcontent 'ven' 개수
--btitle 또는 bcontent 컬럼에 ven 들어간 게시글을 출력하시오.
select * from board where bcontent like '%ven%' or btitle like '%ven%';

--bcontent 컬럼에 n으로 시작하면서 4개의 문자단어가 있는 게시글을 출력하시오
--nibh해당 naabb비해당
--%n___%
-- _랑% 사이는 사이띄어쓰기 
select bcontent from board where bcontent like '%n___ %';  --n으로 시작하면 4글자 이상만 출력  (nulla nunc luctus 등등)
select bcontent from board where bcontent like '%n___';   --n으로 시작하는 4글자까지만 출력 (nunc 등등)

select * from employees;
select * from employees where emp_name like 'Do%';   --Do로 시작하는것만 출력
select * from employees where emp_name like 'D_%';   --D만은 있는건 출력못함.
select * from employees where emp_name like 'Lo%';

select * from employees where emp_name like 'D%';    --D로 시작하는거 출력
select * from employees where emp_name like '%a%';   --어디든 a가 들어가는거 출력
select * from employees where emp_name like '_a%';   --2번째 글자가 a인 사원 출력

--월급이 낮은 순부터 출력하시오.
select emp_name,salary from employees order by salary asc;  --오름차순(순차정렬)
select emp_name,salary from employees order by salary desc;  --내림차순(역순정렬)

--최근입사한 직원을 사원번호, 사원명, 직급, 입사일로 출력하시오
select employee_id,emp_name,job_id,hire_date from employees order by hire_date desc;
--사원명 역순정렬
select employee_id,emp_name,job_id,hire_date from employees order by emp_name desc;
--부서번호는 순차정렬, 이름은 역순정렬하여 사원번호,사원명,부서번호,직급,입사일,월급 출력하시오
--첫번째 정렬 조건에 찾고 다음 정렬조건을 실행
select employee_id,emp_name,department_id,hire_date,salary from employees order by department_id asc ,emp_name desc;
--월급으로 순차정렬,입사일 역순정렬하여 사원번호,사원명,부서번호,직급,입사일,월급 출력하시오
select employee_id,emp_name,department_id,hire_date,salary from employees order by salary asc ,hire_date desc;

--abs : 절대값
select -10,abs(-10) "절대값" from dual;  --dual 가짜테이블
--floor : 버림
select 10.54578,floor(10.54578) from dual;
--trunc(값,버림위치) : 특정자리 버림
select 10.54578,trunc(10.54578,2),trunc(10.54578) from dual;  --소수점 2째자리까지 남기고 버림 / 자리수를 안넣으면 다버림
--round(대상,자릿수) :  특정자리 반올림    -는 소수점 앞쪽
select 10.54578,round(10.54578),round(10.54578,3) from dual;  --자리수를 안넣으면 소수점 1째자리에서 반올림 / 소수점 4째자리에서 반올림해서 3째자리까지 출력

select * from stuscore;
select stunum,name,math,eng,kor+eng,floor((kor+math)/2) from stuscore;

--월급을 원화로 환산, 1342 소수점2자리 반올림해서 출력하시오
--사번, 사원명, 월급, 월급환산, 원급환산3자리 반올림
select employee_id,emp_name,salary,salary*1342.32,round(salary*1342.32,2) from employees;

--입사일이 현재날짜까지 걸린일자를 출력하시오. 소수점 3째 짜리에서 반올림
select round(sysdate-hire_date,2) from employees;

--입사일에서 현재날짜까지 걸린 일자를 출력하시오. 소수점자리는 반올림 하고, 일을 년으로 환산해서 출력하시오.
select emp_name, floor(round(sysdate-hire_date)/365) sdate from employees order by sdate asc;  --반올림을 해서 365로 나누고 소수점 버림

select * from member;

select * from employees;

--나머지 함수
select mod(27,2), mod(27,5), mod(27,7) from dual;

--employees 사번이 홀수인 사원을 출력하시오.
select * from employees where mod(employee_id,2)=1 order by employee_id asc;

--부서번호가 짝수인 사원을 출력하시오. 사번, 사원명, 입사일, 월급, 관리자번호, 부서번호 출력
select employee_id,emp_name,hire_date, salary, manager_id, department_id  from employees where mod(manager_id,2)=1 order by manager_id asc;

select * from board;

select bhit from board;
--조회수 평균
select avg(bhit) from board;
--2자리에서 반올림
select round(avg(bhit),1) from board;
--소수점 버림
select floor(avg(bhit)) from board;
select trunc(avg(bhit)) from board;
--평균받아 높은 조회수를 가진 게시글 출력
select * from board where bhit >= (select avg(bhit) from board) order by bhit asc;

--형변환( , )
select to_char(salary,'999,999'),to_char(round(salary*1342.32),'999,999,999') from employees;

--시퀀스
create sequence member_seq
start with 1
increment by 1
minvalue 1
maxvalue 9999
nocycle
nocache;

create sequence board_seq
start with 1001
increment by 1
minvalue 1
maxvalue 9999
nocycle
nocache;

select * from board order by bno desc;

select board_seq.currval from dual;  --currval 현재번호 읽어오는거
select board_seq.nextval from dual;  --nextval 현재번호를 하나씩 증가해서 읽어오는거

select member_seq.nextval from dual;

insert into board values(
board_seq.nextval,'제목입니다.','내용입니다.',sysdate,'aaa',board_seq.currval,0,0,1,'1.jpg');

--dept_seq 시작10, 증분 10
create sequence dept_seq2
start with 10
increment by 10
minvalue 1
maxvalue 9999
nocycle
nocache;

select dept_seq.nextval from dual;

select *from stuscore;
--delete stuscore;
commit;

select * from stuscore order by total desc;

select stunum, rank, rank() over (order by total desc) m_rank from stuscore;

--total을 기준으로 역순정렬해서 등수를 출력
select stunum, rank() over (order by total desc) from stuscore;

update stuscore a
set rank = ( -- select stunum,rank from stuscore
select b_rank from
(select stunum b_num, rank() over (order by total desc) as b_rank from stuscore) b
where a.stunum = b.b_num
);

select * from stuscore;

--테이블에 별칭을 지정해주면 조건식에 테이블별칭으로 사용가능.
select employee_id,emp_name,employees.department_id,department_name,parent_id from employees a,departments b
where a.department_id = b.department_id;

select department_id,department_name from departments;
select * from departments;

-----------------------------------------------------emp2
--drop table emp2;

create table emp2 as select * from employees;

select * from emp2;

update emp2 set manager_id='';

commit;

select * from emp2;

--1. emp2의 테이블 사원번호와 employees 사원번호 똑같은 일치.
--2. emp2의 관리자번호와 employees 관리자번호를 검색함.
--3 employees관리자번호를 emp2의 관리자번호에 입력시킴.
update ( select a.manager_id a_m,b.manager_id b_m from emp2 a,employees b where a.employee_id = b.employee_id )set a_m = b_m;

select a.manager_id a_m,b.manager_id b_m from emp2 a, employees b where a.employee_id = b.employee_id;

--스퀀스 생성 emp_seq 시작1, 증분1, 최대100000, 최소1
create sequence emp_seq
start with 1
increment by 1
minvalue 1
maxvalue 100000
nocycle
nocache;

create table emp01(
empno number(4) primary key, ename varchar(10), hiredate date);

insert into emp01 values(emp_seq.nextval, '홍길동', sysdate);
insert into emp01 values(emp_seq.nextval, '유관순', sysdate);
insert into emp01 values(emp_seq.nextval, '이순신', sysdate);
insert into emp01 values(emp_seq.nextval, '홍길자', sysdate);
insert into emp01 values(emp_seq.nextval, '홍길순', sysdate);

select * from emp01;

select employee_id, emp_name, job_id, hire_date from employees order by hire_date desc;