select * from member;

select *from member where id='ccc' and pw='1111';

select * from board;
--sum
select rownum ,a.* 
from(select * from board where bcontent like'%sum%' order by bno) a   --이중커리(from뒤 모두가 테이블이 된다.)
where rownum>=11 and rownum<=20;

select * from (
select row_number() over(order by bno) rnum, a. * from board a where bcontent like '%sum%') b where b.rnum>=11 and b.rnum<=20;

commit;
