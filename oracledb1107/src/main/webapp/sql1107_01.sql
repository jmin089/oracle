select * from stuscore;

select * from stuinfo;

select * from(select rownum rnum,a.* from (select * from board order by bgroup) a) where rnum>=11 and rnum<=20;
--위 아래 방법중 하나사용.
select * from(select ROW_NUMBER() OVER(order by bgroup) rnum,a.* from board a ) where rnum>=11 and rnum<=20;

select * from stuscore;

select * from board;

commit;