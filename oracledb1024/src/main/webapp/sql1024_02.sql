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
'aaa','1111','ȫ�浿','010-1111-1111','M','game,golf,run'
);
insert into member values(
'bbb','1111','������','010-2222-2222','F','golf,book'
);
insert into member values(
'ccc','1111','�̼���','010-3333-3333','M','cook,book'
);

insert into member values(
'eee','1111','������','010-4444-4444','M','game,run,book'
);

insert into member values(
'ddd','2222','�豸','010-5555-5555','M','golf,book,cook'
);

commit;

select * from member;

delete member where id='ddd';    --id�� ccc�ΰ� �����ض�

select * from member;
update member set phone='010-3333-3333' where id='ddd';  --���̵� ddd�� ����ȣ�� 010-3333-3333���� �����ϰ������
select * from member;
commit;

select * from tab;  --���� �������ִ� ������̺� Ȯ���Ҷ�
desc member;
desc employees;
select create_date from employees;
select * from member;

select id,name from member;

select * from member;

select * from employees;  --select * from ���̺� �����ִ� ��ɾ�

select emp_name, employee_id, salary*1342*12, commission_pct from employees order by salary desc;   --asc ������ desc ������ order by ����

desc employees;   --Ÿ���� ������ ���������

select hire_date,sysdate,round(sysdate-hire_date) from employees;  --sysdate ���糯¥  round()�ݿø�

select distinct department_id from employees order by department_id asc;  --distinct �ߺ��Ǵ°� ����

select * from departments;

desc syuscore;

select emp_name from employees;

select emp_name from employees where emp_name='Donald OConnell';  --������ ��ҹ��ڴ� �����ؾ���.  ����,���̺��,�ø��� ��ҹ��� ��������.
