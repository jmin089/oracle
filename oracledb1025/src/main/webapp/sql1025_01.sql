select * from employees;

select salary+100,salary-100 from employees;

select sysdate,sysdate+365 from dual;    --dual �ӽô������̺� from �ڿ��� ���̺��� �־�� �ϴµ� Ȯ�θ� �ϰ����Ҷ� �ǹ� ������ �ۼ��ؾ��Ҷ� ���.

select 1+4 from dual;

--����(����) '3'�� ���������� �ϸ� ���ڷ� �ڵ���ȯ
select 1+'3' from dual;

--���� 'a'�� �������� �ϸ� ����
select 1+'a' from dual;

--���ڴ� ���������� �Ҽ� ����.
select 'a'+'b' from dual;

--���� ��ȥ�� ||, concat ��ɾ�
select 'a'||'b' from dual;
select concat('a','b') from dual;

select * from employees;

--emp_name(email) �̷��� ����Ͻÿ�
--Donald OConnell(DOCONNEL)
select emp_name||'('||email||')' from employees;
select concat(emp_name,concat('(',concat(email,')'))) from employees;

--�����ȣ, ����̸�, �Ի����� ����� �Ի����� ����
select employee_id,emp_name,hire_date from employees order by hire_date asc;

--00/01/01 ���� �Ի��� ����� ����Ͻÿ�
--00/01/01, 00-01-01, 2000-01-01
select * from employees where hire_date >= '00/01/01' order by hire_date asc;

-- ���̺� ��� ����������ü�� ���ü� ����.
select count(*) from employees;    --����
select max(salary) from employees;  --�ִ밪
select * from employees where salary=(select max(salary) from employees);  --����Ŀ��

--null���� �ƴѰ͸� ���
select * from employees where commission_pct is not null;

--�μ���ȣ�� 80�� �̻��� ����� ����Ͻÿ�
select * from employees where department_id >= 80 order by department_id asc;

--�μ���ȣ�� 80���� �����ϰ� ����� ����Ͻÿ�
--not ���ǿ� �������� ���ϴ� �͸� ���(�ٸ��� !=, <, not)
select * from employees where not department_id = 80 order by department_id asc;
select * from employees where  department_id != 80 order by department_id asc;

--and : ������ ��� �����ؾ߸� ���
--�μ���ȣ�� 50���̸鼭 6000�̻��� ����� ����Ͻÿ�
select *from employees where department_id = 50 and salary>=6000;

--�޿��� 2000�̻� 3000���� ���
select * from employees where salary >= 2000 and salary <= 3000;

--between A and B
--between : �̻�, ���� (= ������ ���ԵǾ����) not between : �̸�, �ʰ�(= ������ �����ԵǾ����)
select * from employees where salary between 2000 and 3000;

--�޿� ��� avg()
--�׷��Լ� avg,count,max,min
select avg(salary) from employees;

--salary 6461����
select * from employees where salary <= 6461 order by salary desc;   --�߰��� �����ؾ���
select * from employees where salary <= (select avg(salary) from employees) order by salary desc;  --�߰��� �������� �ʾƼ� �˾Ƽ� ���

--or : ������ �Ѱ����� �����ص� ���
--salary 3000,4000,6000�� ��� ���
select * from employees where salary = 3000 or salary = 4000 or salary = 6000;
select * from employees where salary in(3000,4000,6000);

--�����ȣ�� 101,151,200�� ����� �����ȣ, �޿� ���
select employee_id,salary from employees where employee_id = 101 or employee_id = 151 or employee_id = 200;
select employee_id,salary from employees where employee_id in(101,151,200);

--�޿��� 2000�̸�, 3000�ʰ��� ����� ����Ͻÿ�.
select * from employees where salary < 2000 or salary > 3000;
select * from employees where salary not between 2000 and 3000;

--�Ի��� 00/01/01 - 00/12/31 ����� ����Ͻÿ�.
select * from employees where hire_date >= '00/01/01' and hire_date <= '00/12/31';
select * from employees where hire_date between '00/01/01' and '00/12/31';

select emp_name from employees;
--like : ����� �ȿ� ���ϴ� ���Ǹ� ã�� ���
--S�� ���۵Ǵ� �̸��� ����Ͻÿ�.
--S%�� �����ϴ� %n ������ %e% ���� ����
select emp_name from employees where emp_name like 'S%';
--n�� ������ �̸��� ����Ͻÿ�.
select emp_name from employees where emp_name like '%n';
--ó��, ��,�߰�(����) e�� �ִ� �̸��� ����Ͻÿ�.
select emp_name from employees where emp_name like '%e%';

select * from board;

--bcontent �÷��� 'ven' �ܾ �� �ִ� �Խñ��� ����Ͻÿ�.
select * from board where bcontent like '%faucibus%';
--btitle 'ven' ���� bcontent 'ven' ����
--btitle �Ǵ� bcontent �÷��� ven �� �Խñ��� ����Ͻÿ�.
select * from board where bcontent like '%ven%' or btitle like '%ven%';

--bcontent �÷��� n���� �����ϸ鼭 4���� ���ڴܾ �ִ� �Խñ��� ����Ͻÿ�
--nibh�ش� naabb���ش�
--%n___%
-- _��% ���̴� ���̶��� 
select bcontent from board where bcontent like '%n___ %';  --n���� �����ϸ� 4���� �̻� ���  (nulla nunc luctus ���)
select bcontent from board where bcontent like '%n___';   --n���� �����ϴ� 4���ڱ����� ��� (nunc ���)

select * from employees;
select * from employees where emp_name like 'Do%';   --Do�� �����ϴ°͸� ���
select * from employees where emp_name like 'D_%';   --D���� �ִ°� ��¸���.
select * from employees where emp_name like 'Lo%';

select * from employees where emp_name like 'D%';    --D�� �����ϴ°� ���
select * from employees where emp_name like '%a%';   --���� a�� ���°� ���
select * from employees where emp_name like '_a%';   --2��° ���ڰ� a�� ��� ���

--������ ���� ������ ����Ͻÿ�.
select emp_name,salary from employees order by salary asc;  --��������(��������)
select emp_name,salary from employees order by salary desc;  --��������(��������)

--�ֱ��Ի��� ������ �����ȣ, �����, ����, �Ի��Ϸ� ����Ͻÿ�
select employee_id,emp_name,job_id,hire_date from employees order by hire_date desc;
--����� ��������
select employee_id,emp_name,job_id,hire_date from employees order by emp_name desc;
--�μ���ȣ�� ��������, �̸��� ���������Ͽ� �����ȣ,�����,�μ���ȣ,����,�Ի���,���� ����Ͻÿ�
--ù��° ���� ���ǿ� ã�� ���� ���������� ����
select employee_id,emp_name,department_id,hire_date,salary from employees order by department_id asc ,emp_name desc;
--�������� ��������,�Ի��� ���������Ͽ� �����ȣ,�����,�μ���ȣ,����,�Ի���,���� ����Ͻÿ�
select employee_id,emp_name,department_id,hire_date,salary from employees order by salary asc ,hire_date desc;

--abs : ���밪
select -10,abs(-10) "���밪" from dual;  --dual ��¥���̺�
--floor : ����
select 10.54578,floor(10.54578) from dual;
--trunc(��,������ġ) : Ư���ڸ� ����
select 10.54578,trunc(10.54578,2),trunc(10.54578) from dual;  --�Ҽ��� 2°�ڸ����� ����� ���� / �ڸ����� �ȳ����� �ٹ���
--round(���,�ڸ���) :  Ư���ڸ� �ݿø�    -�� �Ҽ��� ����
select 10.54578,round(10.54578),round(10.54578,3) from dual;  --�ڸ����� �ȳ����� �Ҽ��� 1°�ڸ����� �ݿø� / �Ҽ��� 4°�ڸ����� �ݿø��ؼ� 3°�ڸ����� ���

select * from stuscore;
select stunum,name,math,eng,kor+eng,floor((kor+math)/2) from stuscore;

--������ ��ȭ�� ȯ��, 1342 �Ҽ���2�ڸ� �ݿø��ؼ� ����Ͻÿ�
--���, �����, ����, ����ȯ��, ����ȯ��3�ڸ� �ݿø�
select employee_id,emp_name,salary,salary*1342.32,round(salary*1342.32,2) from employees;

--�Ի����� ���糯¥���� �ɸ����ڸ� ����Ͻÿ�. �Ҽ��� 3° ¥������ �ݿø�
select round(sysdate-hire_date,2) from employees;

--�Ի��Ͽ��� ���糯¥���� �ɸ� ���ڸ� ����Ͻÿ�. �Ҽ����ڸ��� �ݿø� �ϰ�, ���� ������ ȯ���ؼ� ����Ͻÿ�.
select emp_name, floor(round(sysdate-hire_date)/365) sdate from employees order by sdate asc;  --�ݿø��� �ؼ� 365�� ������ �Ҽ��� ����

select * from member;

select * from employees;

--������ �Լ�
select mod(27,2), mod(27,5), mod(27,7) from dual;

--employees ����� Ȧ���� ����� ����Ͻÿ�.
select * from employees where mod(employee_id,2)=1 order by employee_id asc;

--�μ���ȣ�� ¦���� ����� ����Ͻÿ�. ���, �����, �Ի���, ����, �����ڹ�ȣ, �μ���ȣ ���
select employee_id,emp_name,hire_date, salary, manager_id, department_id  from employees where mod(manager_id,2)=1 order by manager_id asc;

select * from board;

select bhit from board;
--��ȸ�� ���
select avg(bhit) from board;
--2�ڸ����� �ݿø�
select round(avg(bhit),1) from board;
--�Ҽ��� ����
select floor(avg(bhit)) from board;
select trunc(avg(bhit)) from board;
--��չ޾� ���� ��ȸ���� ���� �Խñ� ���
select * from board where bhit >= (select avg(bhit) from board) order by bhit asc;

--����ȯ( , )
select to_char(salary,'999,999'),to_char(round(salary*1342.32),'999,999,999') from employees;

--������
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

select board_seq.currval from dual;  --currval �����ȣ �о���°�
select board_seq.nextval from dual;  --nextval �����ȣ�� �ϳ��� �����ؼ� �о���°�

select member_seq.nextval from dual;

insert into board values(
board_seq.nextval,'�����Դϴ�.','�����Դϴ�.',sysdate,'aaa',board_seq.currval,0,0,1,'1.jpg');

--dept_seq ����10, ���� 10
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

--total�� �������� ���������ؼ� ����� ���
select stunum, rank() over (order by total desc) from stuscore;

update stuscore a
set rank = ( -- select stunum,rank from stuscore
select b_rank from
(select stunum b_num, rank() over (order by total desc) as b_rank from stuscore) b
where a.stunum = b.b_num
);

select * from stuscore;

--���̺� ��Ī�� �������ָ� ���ǽĿ� ���̺�Ī���� ��밡��.
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

--1. emp2�� ���̺� �����ȣ�� employees �����ȣ �Ȱ��� ��ġ.
--2. emp2�� �����ڹ�ȣ�� employees �����ڹ�ȣ�� �˻���.
--3 employees�����ڹ�ȣ�� emp2�� �����ڹ�ȣ�� �Է½�Ŵ.
update ( select a.manager_id a_m,b.manager_id b_m from emp2 a,employees b where a.employee_id = b.employee_id )set a_m = b_m;

select a.manager_id a_m,b.manager_id b_m from emp2 a, employees b where a.employee_id = b.employee_id;

--������ ���� emp_seq ����1, ����1, �ִ�100000, �ּ�1
create sequence emp_seq
start with 1
increment by 1
minvalue 1
maxvalue 100000
nocycle
nocache;

create table emp01(
empno number(4) primary key, ename varchar(10), hiredate date);

insert into emp01 values(emp_seq.nextval, 'ȫ�浿', sysdate);
insert into emp01 values(emp_seq.nextval, '������', sysdate);
insert into emp01 values(emp_seq.nextval, '�̼���', sysdate);
insert into emp01 values(emp_seq.nextval, 'ȫ����', sysdate);
insert into emp01 values(emp_seq.nextval, 'ȫ���', sysdate);

select * from emp01;

select employee_id, emp_name, job_id, hire_date from employees order by hire_date desc;