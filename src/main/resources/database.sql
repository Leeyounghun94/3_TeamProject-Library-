--------------------------------------------- 첨부파일
create table tbl_attach (
	uuid varchar2(100) not null,
	uploadPath varchar2(200) not null,
	fileName varchar2(100) not null,
	filetype char(1) default 'I',
	bno number(10,0)
);

alter table tbl_attach add constraint pk_attach primary key (uuid);

alter table tbl_attach add constraint fk_board_attach foreign key (bno) references tbl_board(bno);



--------------------------------------------- 게시판용
create sequence seq_board;

create table tbl_board (
  bno number(10,0),
  title varchar2(200) not null,
  content varchar2(1000) not null,
  category varchar2(20) not null,
  regdate date default sysdate, 
  updatedate date default sysdate,
  nickName varchar2(50),
  replycnt number default 0
);
alter table tbl_board add (replycnt number default 0);


alter table tbl_board add constraint pk_board 
primary key (bno);

select * from TBL_BOARD order by bno desc;

insert into TBL_BOARD (bno,title,content,writer)
		values (seq_board.nextval, '댓글용 제목', '댓글용 내용', 'kkw');

---------------------------------------------- 댓글용
create table tbl_reply (
	rno number(10,0),  -- 댓글 번호
	bno number(10,0),  -- fk(게시판번호)
 	reply varchar2(1000) not null, -- 댓글
 	replyer varchar2(50) not null, -- 댓글 작성자
	replyDate date default sysdate,
	updateDate date default sysdate );
	


create sequence seq_reply ; -- 댓글용 자동번호객체 추가

drop sequence seq_reply;

alter table tbl_reply add constraint pk_reply primary key (rno); 
-- pk를 rno로 지정(롤이름 : pk_reply)

insert into TBL_BOARD (bno, title, content, writer) (select seq_board.nextval, title, content, writer from tbl_board); -- 재귀 복사

alter table tbl_reply add constraint fk_reply_board foreign key (bno) references tbl_board (bno); 
-- tbl_reply의 bno(자)와 tbl_board의 bno(부)를 연결 (부모가 있어야 자식이 있다) 

-- tbl_board 초기화 -> 더미데이터 - > 댓글 더미데이터 입력

select * from TBL_BOARD order by bno desc;

delete from TBL_BOARD; -- 더미데이터 삭제



create sequence seq_board; -- 자동번호 객체 생성 1번 부터 만들어 짐

insert into TBL_BOARD (bno, title, content, category, nickName)
		values (seq_board.nextval, '첫번째글_시험', '첫번째내용_시험', '시험', 'test');

		

insert into TBL_REPLY (rno, bno, reply, replyer)
		values (seq_reply.nextval, 11, '댓글11', 'kkw');
insert into TBL_REPLY (rno, bno, reply, replyer)
		values (seq_reply.nextval, 10, '댓글10', 'kkw');

select * from TBL_REPLY;

select rno, bno, reply, replyer, replyDate, updateDate from tbl_reply
	where bno = 10 order by rno asc; -- bno 10번인 댓글을 rno를 내림차 순으로 정렬


---- 기능
SELECT * FROM USER_SEQUENCES; -- 전체 시퀀스 조회
-- 삭제
drop table tbl_board -- 보드 테이블 삭제
drop table tbl_reply -- 댓글 테이블 삭제
drop sequence seq_board; -- 보드_시퀀스 삭제


