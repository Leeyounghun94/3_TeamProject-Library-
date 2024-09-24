create table member_tbl(
	u_id varchar2(20),
	name varchar2(30) not null,
	birth number(10,0) not null,
	phone varchar2(30) not null,
	email varchar2(20) not null,
	id varchar2(20) not null unique,
	pw varchar2(20) not null,
	nickName varchar2(20) not null unique
)

alter table member_tbl add authority number(10);
alter table member_tbl modify authority number(10) default '0';

select dbms_random.String('X',10) u_id from dual; -- 임시테이블에 랜덤 번호 생성 (u_id)

insert into member_tbl(u_id, name, birth, phone, email, id, pw, nickName) values ('ZRBQCC081C','테스트', '990101', '010-1234-1234', 'mbc@naver.com', 'test123', 'test123', 'tester');
insert into member_tbl(u_id, name, birth, phone, email, id, pw, nickName) values ('테스트1', '990102', '010-1234-5678', 'mbctest@naver.com', 'test222', 'test222', 'tester2');
insert into member_tbl(u_id, name, birth, phone, email, id, pw, nickName) values ('00000admin','admin00', '123451', '010-1234-1234', 'admin1@naver.com', 'admin', 'admin00', 'admin');
select dbms_random.String('X',10)u_id from dual; 
insert into member_tbl(u_id, name, birth, phone, email, id, pw, nickName) values ('u_id','테스트3', '990103', '010-1234-9876', 'mbc3@naver.com', 'test333', 'test333', 'tester3');

select * from MEMBER_TBL;

select * from member_tbl where id = 'test555' and pw = 'test55';

select u_id, name, birth, phone, email, id, pw, nickName from member_tbl where id = 'test555' and pw = 'test55';

update MEMBER_TBL set authority = 0 where id ='test222';
select * from member_tbl where authority>0;

update MEMBER_TBL set authority = 1 where id ='t';