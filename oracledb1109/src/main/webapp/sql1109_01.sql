select * from member where id='aaa' and pw='1111';

desc member;
--컬럼 추가
alter table member add mdate date;
--컬럼에 내용 추가
update member set mdate=sysdate-1;
commit;
select * from member;
--한줄 삭제
delete from member where id='aaa';

insert into member values('fff','1111','김유신','010-6666-6666','Male','game,golf',sysdate);

rollback;

select * from member where id = 'aaa' and pw = '2222';
select * from member where id = 'aaa' and pw = '1111';

insert into member values('a','1111','홍길동','1','Male','cook',sysdate);
select * from member;
rollback;