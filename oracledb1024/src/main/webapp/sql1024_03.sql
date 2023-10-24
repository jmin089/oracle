select * from departments;

select * from departments order by manager_id asc;

--employees 테이블에서 employee_id로 순차정렬

select * from employees order by employee_id asc;

select * from employees where employee_id>=200;

select * from employees
where employee_id>=190 and employee_id<=250;

--salsty 5000이상이면서 사원을 salary순차정렬검색하시오.
select * from employees
where salary>=5000 order by salary asc;

--사번, 이름, 직급, 부서, 월급를 출력하시오.

select employee_id, emp_name, job_id, department_id, salary from employees;

--테이블의 데이터 복사
create table emp2 as select * from employees;

select * from emp2;

--emp2에서 이름 연봉 입사일자 출력해서 이름 순차정렬
select emp_name, salary, hire_date from emp2  order by emp_name asc;

--컬럼 타입
desc emp2;

--컬럼 이름 변경
alter table emp2 rename column emp_name to e_name;

--컬럼 데이터 타입,길이 변경
--email 안에 데이터가 숫자가 아니면 변경이 안됨.
--alter table emp2 modify email number(50);  number는 숫자여서 에러남.
alter table emp2 modify email varchar2(50);

--컬럼 삭제
alter table emp2 drop column create_date;

--컬럼 추가
alter table emp2 add create_date date;   --추가하면 항상 맨뒤에 붙는다.

--컬럼 순서 변경
alter table emp2 modify update_date invisible;
alter table emp2 modify update_date visible;
select * from emp2;

--컬럼의 데이터만 복사
insert into emp2 select * from employees;
select * from emp2;
commit;
drop table emp2;

alter table emp2 modify salary invisible;
alter table emp2 modify manager_id invisible;
alter table emp2 modify commission_pct invisible;
alter table emp2 modify retire_date invisible;
alter table emp2 modify department_id invisible;
alter table emp2 modify job_id invisible;

alter table emp2 modify salary visible;
alter table emp2 modify manager_id visible;
alter table emp2 modify commission_pct visible;
alter table emp2 modify retire_date visible;
alter table emp2 modify department_id visible;
alter table emp2 modify job_id visible;

desc emp2;

insert into emp2(employee_id,emp_name) select employee_id,emp_name from employees;

--별칭선언 as는 생략이 가능함
select salary,salary*12 as y_salsry,salary*12*1342 k_salary from employees;  --as 별칭

select * from employees;

--년봉 nvl(변수,0) null인경우 0으로 표시
select salary, salary*12,commission_pct from employees;
select 
salary, 
salary*12 as "년봉", 
(salary*12)*nvl(commission_pct,0) as "인센티브",    --null무한대값으로 nvl(  ,0)->nvl(null)을 0으로 표기
(salary*12)+(salary*12)*nvl(commission_pct,0) as"실제년봉" from employees;

select nvl(manager_id,0) from employees;

--사번, 월급, 직급, 커미션,년봉,년봉+커미션을 출력하시오.
select employee_id, salary, job_id, nvl(commission_pct,0) as "b_salary", salary*12 as y_salary, salary+nvl(commission_pct,0) as c_salary from employees;

--월급이 6000인 사원 검색
select * from employees where salary=6000;  --딱맞는조건을 찾을때

--커미션이 없는 사람만 출력하시오(null값은 등가비교 불가)
--select * from employees where commission_pct=null;
select * from employees where commission_pct is not null;  --null이 아닌상태만 출력
select * from employees where commission_pct is null;        --null인 상태만 출력
select commission_pct from employees;

--부서번호, 부서명을 출력하시오.(부서번호가 10이상 40이하)
select * from departments;
select department_id as "부서번호",department_name as "부서명" from departments where department_id>=10 and department_id<=40;
--select -> 컬럼 --> from --> 테이블 --> where 순으로 작성

--문자타입을 붙여서 출력 (두가지 방법있음)
--select emp_name+"is a" from employees;  문자는 +가 안됨.
select emp_name||'is a'||job_id from employees;

select concat(concat(emp_name,'is a '),job_id) con_name from employees;

select * from stuscore;

select kor,eng,math,kor+eng+math,(kor+eng+math)/3 from stuscore;

--부서번호 중복제거 출력(순차정렬)
select distinct department_id from employees order by department_id asc;

--job_id 중복제거 출력(순차정렬)
select distinct job_id from employees order by job_id asc; 

--월급 3000,5000,6000 출력하시오
select * from employees
where salary=3000 or salary=6000 or salary=7000;
select * from employees
where salary>=3000 and salary<=10000 order by job_id desc;

--월급이 5000이하 인 사람에게 +1000월급을 인상해서 출력하시오.
select salary,salary+1000 "인상월급",(salary+1000)*1342 "원화" from employees where salary<=5000;

--부서번호가 10,30,50인 사원번호, 사원이름, 부서번호, 직급, 월급, 입사일을 출력하시오.(부서번호 순차정렬하고 사원번호 순차정렬)
select employee_id,emp_name,department_id,job_id,salary,hire_date from employees where department_id=10 or department_id=30 or department_id=50
order by department_id asc, employee_id asc;   --department_id먼저 정렬하고 employee_id정렬
select * from employees;

--입사일이 2003/09/01 이후이면서 급여가 4000이상 8000이하인 사원번호,사원이름, 급여, 입사일, 부서번호를 출력하시오
select employee_id,emp_name,salary,hire_date,department_id from employees
where salary>=4000 and salary<=8000 and hire_date > '2003/09/01'; --문자 ' ' 숫자 " "

commit;
