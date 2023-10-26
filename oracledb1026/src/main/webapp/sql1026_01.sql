--사번이 홀수인 사원을 출력하시오.
select employee_id from employees where mod(employee_id,2) = 1;

--board
select * from board;

desc board;

--현재 날짜 출력
select sysdate from dual;

select * from board order by bno desc;

insert into board values (board_seq.nextval,'이벤트 진행','내용입니다.',sysdate,'aaa',board_seq.currval,0,0,1,'');
insert into board values (board_seq.nextval,'게시글을등록합니다.','게시글내용입니다.',sysdate,'bbb',board_seq.currval,0,0,1,'2.jpg');
insert into board values (board_seq.nextval,'게시글을등록합니다2 ','게시글내용입니다2',sysdate,'ccc',board_seq.currval,0,0,1,'3.jpg');

commit;

select bno, btitle, bdate from board order by bdate desc;
--현재날짜 기분 5일 이전에 게시글을 출력하시오.(번호, 제목, 작성일만 출력)
select sysdate-5 from dual;
select bno, btitle, bdate from board where bdate > sysdate-5 order by bdate desc;

--employees 입사일에서 현재날짜까지 기간을 출력하시오.(소수점은 절사) 사원번호, 사원명, 입사일, 월급, 부서번호,현재까지기간
select employee_id, emp_name, hire_date, salary, department_id, trunc(sysdate-hire_date) from employees;

--다가올 요일을 찾고 싶을때
select next_day(sysdate,'일요일') from dual;
select next_day(sysdate,'수') from dual;
select next_day(sysdate,7) from dual;

--입력한 날의 마지막 날짜
select last_day(sysdate) from dual;
select last_day('20231101') from dual;
select last_day('231201') from dual;

--add_months : -1 한달전 +1 한달후
select add_months(sysdate,-2) from dual;
select add_months(sysdate,+12) from dual;
select add_months('20220101',+6) from dual;

--현재달에서 입사한 달까지의 개월수   months_between : 
select round(months_between(sysdate,hire_date)) || '개월' from employees;

--현재기준으로 6개월동안 작성된 글을 출력하시오. board사용
select bno, btitle, bdate from board where bdate > add_months(sysdate,-6) order by bdate desc;

--extract : 날짜중 년도만, 달만, 일만 출력
select extract(year from bdate) from board;  --년
select extract(month from bdate) from board;  --월
select extract(day from bdate) from board;  --일

--3,5,7월에 입력한 게시글을 출력하시오
select * from board where extract(month from bdate)=3 or extract(month from bdate)=5 or extract(month from bdate)=7 order by bdate desc;
select * from board where extract(month from bdate) in (3,5,7) order by bdate desc;  --위에보다 쉬운 방법인데..  왜?? 위에만 생각남???

--날짜 round : 15일까지는 1일로 세팅 16일부터는 1달 추가 예)15/5/26 -> 15/6/1, 18/2/14 -> 18/2/1 / trunc : 1일 기준으로 변경(버림)
select bno, btitle, bdate from board;
select bdate,round(bdate,'month'),trunc(bdate,'month') from board;

--to_date는 형변환 함수
select round(to_date('2023-10-16'),'month') from dual;

select bdate from board; 
--to_char 날짜형 -> 문자형 변환.
select to_char(bdate,'YYYY-MM-DD day HH:MI:SS') from board order by bdate desc;  --day -> *요일 dy -> *

select bno, btitle, bcontent, to_char(bdate,'YYYY"년"MM"월"DD"일"') bdate, bgroup, bstep, bindent, bhit, bfile from board;

--입사일 (2023-11-01 화요일) 형식으로 출력
select to_char(hire_date,'YYYY-MM-DD day') from employees;

--날짜 출력 방식.
select to_char(bdate,'YYYY-MM-DD HH:MI:SS') from board order by bdate desc;
select to_char(bdate,'YYYY-MM-DD HH12:MI:SS') from board order by bdate desc;
select to_char(bdate,'YYYY-MM-DD HH24:MI:SS') from board order by bdate desc;
select to_char(bdate,'YYYY-MM-DD AM HH:MI:SS') from board order by bdate desc;
select to_char(bdate,'YYYY-MM-DD AM HH24:MI:SS') from board order by bdate desc;

--[문자형 변환함수] 숫자를 문자로
select to_char(1234567890) from dual;
select to_char(1234567890,'9,999,999,999') from dual;  -- , 천단위
select to_char(1234567890,'09,999,999,999') from dual;  --0 빈공간을 0으로 채움
select to_char(1234567890,'99,999,999,999') from dual;  --9 는 빈공간은 빈공간으로 채움
select to_char(1234567890,'L9,999,999,999') from dual;  --L은 나라별 화폐단위
select to_char(1234567890,'$9,999,999,999') from dual;
select to_char(1234567890,'\9,999,999,999') from dual;
select to_char(123,'0000000000') from dual;  -- 결과값 0000000123
select trim(to_char(1234567,'L9,999,999,999')) from dual; --trim 앞뒤 공백제거함수

--salary 달러표시와 천단위표시
--salary*1342 원화표시와 천단위표시, 소수점1자리까지 표시
select salary, to_char(salary,'$9,999,999'),to_char(round(salary*1342.42,1),'L9,999,999,9999.9') from employees;

--12345 총 9자리까지 표시하는데 빈굥백은 0으로 채워 출력
select to_char(12345,'000000000') from dual;
--12,345 총 9자리까지 표시 천단위표시하고 빈공백은 제거해서 출력
select trim(to_char(12345,'L999,999,999')) from dual;
--board테이블에서 bdate와 비교해서 20231023 숫자와 같은날 입력한 게시글을 출력하시오.
select * from board where bdate='20231023' order by bdate desc;
select * from board where bdate=to_date('20231023','YYYYMMDD') order by bdate desc;
--숫자 20200101부터 현재까지 기간이 얼마나 지났는지 출력하시오.
select trunc(sysdate-to_date('20200101','YYYYMMDD')) from dual;
--자기 태어난 날을 기준으로 얼마나 지났는지 출력하시오.
select trunc(sysdate-to_date('19890523','YYYYMMDD')) from dual;   --일수 출력
select trunc(months_between(sysdate,to_date('19890523','YYYYMMDD'))) from dual;  --개월수 출력

--[문자를 숫자로 형변환함수]
--문자20,000 - 문자10,000의 숫자차이를 출력하시오.
select to_number('20,000','99,999') from dual;
select to_number('10,000','99,999') from dual;
select to_number('20,000','99,999')-to_number('10,000','99,999') from dual;
select emp_name, to_char(salary,'$999,999') from employees;

--Q. 년봉+커미션포함 -월급*12+(월급*12*커미션) 년봉으로 해서 출력하시오(사번,사원명,월급,월급*12,년봉)
select employee_id, emp_name, salary, salary*12, salary*12+(salary*12*nvl(commission_pct,0)) from employees;

select manager_id from employees where manager_id is null;

--Q. null을 0으로 표시하여 출력히사오.
select nvl(manager_id,0) from employees;
--Q. ceo라는 글자로 표시해서 출력하시오.   숫자인 manager_id를 문자로 형변환 후 ceo로 변경
select nvl(to_char(manager_id),'ceo') from employees;

--[그룹함수]
--게시글 조회수 총합을 출렵하시오.
select sum(bhit) from board;
select trim(to_char(sum(bhit),'9,999,999')) from board;  --합계(천단위표시)
select trim(to_char(avg(bhit),'9,999,999')) from board;  --평균(천단위표시)

--Q. 월급의 평균을 소수점 2자리까지 반올림 해서 출력.
select round(avg(salary),2) from employees;

--emp_name 단일함수를 그룹함수와 함께 출력이 안됨.
select emp_name,avg(salary) from employees;

--min 최소값, max 최대값, avg 평균, count 개수, sum 합계
select min(salary), max(salary), avg(salary), count(*) from employees;

--부서번호가 50인 사원들의 salary 합계, 평균을 출력하시오.
select sum(salary), avg(salary) from employees where department_id = 50;

--모든부서의 합계,평균을 출력
select department_id, sum(salary),avg(salary) from employees group by department_id order by department_id asc;

--Q.날짜 게시글 개수를 출력하시오.
select bdate, count(*) from board group by bdate order by bdate asc;

--Q.년도의 월별 개수를 출력하시오.
select to_char(bdate,'YYYYMM') 년월 ,count(to_char(bdate,'YYYYMM')) 년월개수 from board
group by to_char(bdate,'YYYYMM') order by to_char(bdate,'YYYYMM');

select add_months(bdate,1) from board;
--년도만 출력
select extract(year from bdate) from board;
--월만 출력
select extract(month from bdate) from board;
--일만 출력
select extract(day from bdate) from board;
--년도와 상관없이 월별 게시글수 출력
select extract(month from bdate), count(extract(month from bdate)) from board
group by extract(month from bdate) order by extract(month from bdate);

select count(*) from board;
select count(bno) from board;

--단일함수 사용은 group by 절에 추가해서 사용해야함.
select department_id, count(*) from employees group by department_id order by department_id;

select count(employee_id) from employees;  --결과값 107
select count(manager_id) from employees;   --결과값 106 null값은 인식 못함.

--조회수가 가장 낮은 제목, 내용을 출력하시오.
select min(bhit) from board;
select bno,btitle,min(bhit) from board group by bno,btitle;
select * from board where bhit = (select min(bhit) from board);
--조회수가 가장 높은 제목, 내용을 출력하시오.
select * from board where bhit = (select max(bhit) from board);

--[문자함수]
select emp_name from employees;

--대소문자 구분없이 si 가 포함된 이름을 모두 출력하시오.  SI, Si, sI, si / DA,Da,dA,da
select emp_name from employees where emp_name like('%SI%') or emp_name like('%Si%') or emp_name like('%sI%') or emp_name like('%si%');
select emp_name from employees where lower(emp_name) like('%si%');  --소문자
select emp_name from employees where upper(emp_name) like('%SI%');  --대문자
select emp_name from employees where emp_name like('%DA%') or emp_name like('%Da%') or emp_name like('%dA%') or emp_name like('%da%');

--employees에서 이름을 대문자로 출력하시오.
select  upper(emp_name) from employees;
--employees에서 이름을 소문자로 출력하시오.
select  lower(emp_name) from employees;

--자리수를 만들어서 지정한 문자를 채워 출력.
select lpad(12345,10,'0') from dual;  --결과값 1234500000
select rpad(12345,10,'0') from dual;  --결과값 0000012345

--12345 10자리로 천단위표시와 원화표시를 추가해서 출력하시오.(공백은 0으로 표시)
select to_char(12345,'L0,000,000,000')from dual;

--ltrim : 왼쪽공백제거 rtrim : 오른쪽공백제거 trim : 공백제거
--'   abc def c   ' :  이번 불가능함.
select trim('  abd def c  ') from dual;
select '  abd def c  ', replace('  abd def c  ',' ','') from dual;  --문장안에 있는 공백 제거

select * from employees;

--job_id asst -> ss -> / asst -> ait
select job_id, replace(job_id,'ss','i') from employees;

--emp_name 안에 있는 공백 제거
select emp_name,replace(emp_name,' ','') from employees;

select job_id from emp2;
--sh_clerk - > clerk 변경해서 저장하시오.
update emp2 set job_id = 'CLERK' where job_id = 'SH_CLERK';
select replace(job_id,'SH_CLERK','CLERK') from emp2;
update emp2 a set job_id = (select replace(job_id,'SH_CLERK','CLERK') from emp2 b where a.employee_id = b.employee_id);
rollback;

--substr(해당컬럼,3,2) 해당컬럼에서 3번째 글자부터 2개를 짤라와 출력
--4번째부터 이름 3개를 가져옴
select emp_name, substr(emp_name,4,3) from employees;

--이름 5개와 입사년도 출력 예시)Donal(1995)
select emp_name, substr(emp_name,1,5) from employees;
select hire_date from employees;  
select substr(emp_name,1,5) || to_char(hire_date,'(YYYY)') from employees;  --결과값 아래랑 동일
select substr(emp_name,1,5) ||'('||extract(year from hire_date)||')' from employees;

--입사일이 06월 사람중에 이름이 d가 들어가 있는 사원을 출력하시오.
select * from employees where  extract(month from hire_date) = 6 and emp_name like('%d%');


--게시글의 날짜를 1씩 증가해서 update 하시오.
select * from board;
update board a 
set a.bdate = (select bdate+1 from board b where a.bno = b.bno);

update stuscore
set rank =0;

commit;

select * from stuscore;
select b_num, b_rank from(select stunum b_num, rank() over (order by total desc) b_rank from stuscore);
update stuscore a set rank = (select b_rank from
(select stunum b_num, rank() over (order by total desc) b_rank from stuscore b) where a.stunum = b_num);

--문자길이
select length(emp_name), emp_name from employees;
--length 평균 출력
select avg(length(emp_name)) from employees;
--이름을 평균절사 길이만큼만 출력하시오.
--select substr(emp_name, 1) from employees group by emp_name;

select * from employees;
--employees 폰번호 5번째 3개와 이름 1,5번째 까지 2개를 함께출력하시오.
select substr(phone_number,5,3) || substr(emp_name,1,5) from employees;

--instr 찾고자 하는 위치 숫자 출력
select instr(emp_name,'o') from employees where employee_id = 198;

select instr(emp_name,' ') from employees;
select instr(emp_name,' ')+1 from employees;
select emp_name, instr(emp_name,' '), instr(emp_name,' ')+1 from employees;
select emp_name, substr(emp_name,instr(emp_name,' ')+1) from employees;  --1번째 공백이후부터 이름가져오기
select emp_name, substr(emp_name,1,instr(emp_name,' ')-1) from employees;  --*번째 자리부터 공백전까지 이름가져오기

--주민번호 앞에 자리 가져오기
select substr('880101-1101111',1,instr('880101-1101111','-')-1) from dual;
--주민번호 뒤에 자리 가져오기
select substr('880101-1101111',instr('880101-1101111','-')+1) from dual;

--employees의 phone_number 첫번째 점 기분으로 앞부분과 뒤부분 출력하시오.
select phone_number, substr(phone_number,1,instr(phone_number,'.')-1) from employees;
select phone_number, substr(phone_number,instr(phone_number,'.')+1) from employees;

--점 기준으로 앞부분, 중간부분, 뒤부분을 출력하시오.
select instr('123.456.789','.') from dual;  --점이 있는 위치값
select instr('123.456.789.000','.',1,3) from dual;   --('123.456.789','.',시작위치,점의위치값)
select instr('123.456.789.000','.',-1,1) from dual;   -- -1은 뒤에서부터 찾아옴(결과값 : 12)

select * from member;
--전화번호 - 첫번째 값 출력, 두번째, 세번째 값을 출력하시오  010-1111-1111
select substr(phone, 1, instr(phone,'-')-1) from member;  --010출력
select substr(phone, instr(phone,'-')+1, 4) from member; --1111출력(중간)
select substr(phone, instr(phone,'-',1,2)+1, 4) from member; --1111출력(끝)

select phone_number from employees;
--폰번호에서 123포함되어 있는 폰번호를 출력하시오.
select phone_number from employees where phone_number like ('%123%');

--부서별 최대월급을 출력하시오.
select department_id, count(*), max(salary), min(salary) from employees
group by department_id order by department_id;

--입사일 0000년 00월 00일 0요일표시 이름,입사일 출력
select emp_name, hire_date, to_char(hire_date,'YYYY"년"MM"월"DD"일" day') from employees;

commit;