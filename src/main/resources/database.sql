--------------------------------------------- 좋아요 테이블
create table tbl_like (
	bno number(10,0) default 0,
	userId varchar2(200)
)

--------------------------------------------- 첨부파일 테이블
create table tbl_attach (
	uuid varchar2(100) not null,
	uploadPath varchar2(200) not null,
	fileName varchar2(100) not null,
	filetype char(1) default 'I',
	bno number(10,0)
);
-----------------------------tbl_attatch 제약 조건 추가해주세요.---------------------------------
alter table tbl_attach add constraint pk_attach primary key (uuid);

alter table tbl_attach add constraint fk_board_attach foreign key (bno) references tbl_board(bno);
--------------------------------------------------------------------------------------------------

--------------------------------------------- 게시판 테이블

create table tbl_board (
  bno number(10,0),
  title varchar2(200) not null,
  content varchar2(1000) not null,
  category varchar2(20) not null,
  regdate date default sysdate, 
  updatedate date default sysdate,
  nickName varchar2(50),
  replycnt number default 0,
  uuid varchar2(100) default 'X',
  uploadPath varchar2(200) default 'X',
  fileName varchar2(100) default '.no',
  filetype char(1) default 'I',
  boardUserId varchar2(100) default 'A',
  likeNum number default 0,
  viewNum number default 0
);

ALTER TABLE tbl_board DROP COLUMN filetype;

---------------tbl_board 제약 조건 추가해 주세요----------------
alter table tbl_board add constraint pk_board primary key (bno);
----------------------------------------------------------------
---------------tbl_board 시퀀스 추가해주세요--------------------
create sequence seq_board;
----------------------------------------------------------------

------------------ 따로 추가 안하셔도 됩니다. -------------------
alter table tbl_board add (uuid varchar2(100) default 'X');
alter table tbl_board add (uploadPath varchar2(200) default 'X' );
alter table tbl_board add (fileName varchar2(100) default '.no' );
alter table tbl_board add (filetype char(1) default 'I');
alter table tbl_board add (boardUserId varchar2(100) default 'A');
alter table tbl_board add (likeNum number default 0); -- 게시물 좋아요 수
alter table tbl_board add (replycnt number default 0); -- 게시물 댓글 수
alter table tbl_board add (viewNum number default 0); -- 게시글 조회수
------------------------------------------------------------------

select * from TBL_BOARD order by bno desc; -- tbl_board 테이블 조회

---------------------------------------------- 댓글
create table tbl_reply (
	rno number(10,0),  -- 댓글 번호
	bno number(10,0),  -- fk(게시판번호)
 	reply varchar2(1000) not null, -- 댓글
 	replyer varchar2(50), -- 댓글 작성자
	replyDate date default sysdate,
	updateDate date default sysdate,
	authority number(10,0) default 0,
	replyerUserId varchar2(100)
	
	)
	
---------------tbl_reply 시퀀스 추가해주세요--------------------
create sequence seq_reply ; -- 댓글용 자동번호객체 추가
----------------------------------------------------------------
-------------------------------- tbl_reply 제약 조건 추가해 주세요---------------------------------
alter table tbl_reply add constraint pk_reply primary key (rno); 
alter table tbl_reply add constraint fk_reply_board foreign key (bno) references tbl_board (bno); -- tbl_reply의 bno(자)와 tbl_board의 bno(부)를 연결 (부모가 있어야 자식이 있다) 
---------------------------------------------------------------------------------------------------


--------------------------------- 희망 도서 요청 전용 쿼리 모음 2024 09 30 ---------------------------------

---------------------------------------------------------- 희망 도서 테이블

select * from tbl_requestBook; -- tbl_requestBook 테이블 조회

create table tbl_requestBook (

	r_bookTitle varchar2(200) not null, -- 요청 도서 제목
	r_bookAuthor varchar2(200) not null, -- 요청 도서 저자
	r_bookCategory varchar2(200) not null, -- 요청 도서 카테고리
	r_bookCompany varchar2(200) not null, -- 요청 도서 출판사
	
	r_bookUserId varchar2(200) not null, -- 도서 요청 유저 아이디
	r_bookUserNickName varchar2(200) not null, -- 도서 요청 유저 닉네임
	r_bookBno number(10,0) not null, -- 도서 요청 글 번호
	
	r_bookRegdate date default sysdate, -- 
  	r_bookUpdatedate date default sysdate
	
)
---------------------- tbl_requestBook 시퀀스 -------------------------------------
create sequence seq_requestBook; -- 도서요청 글 번호 시퀀스 
-----------------------------------------------------------------------------------
---------------------- tbl_requestBook 제약 조건 ----------------------------------
alter table tbl_requestBook add constraint pk_requestBook primary key (r_bookBno);
-----------------------------------------------------------------------------------

----------------------------------------------------------- 희망 도서 첨부 파일
create table tbl_requestBookAttach(
	r_uuid varchar2(100) not null,
	r_uploadPath varchar2(200) not null,
	r_fileName varchar2(100) not null,
	r_filetype char(1) default 'I',
	r_bno number(10,0)
)

select * from tbl_requestBookAttach;

---------------------- tbl_requestBookAttach 제약 조건 ---------------------------------
alter table tbl_requestBook add constraint pk_requestBook primary key (r_bookBno)
alter table tbl_requestBookAttach add constraint fk_requestBook_Attach foreign key (r_bno) references tbl_requestBook(r_bookBno)
----------------------------------------------------------------------------------------------------






-------------------------------------이 아래에는 추가할 내용이 따로 없습니다.-----------------------------------------------------


insert into TBL_BOARD (bno, title, content, category, nickName, boardUserId) (select seq_board.nextval, title, content, category, nickName, boardUserId from tbl_board); -- 재귀 복사



-- tbl_board 초기화 -> 더미데이터 - > 댓글 더미데이터 입력

select * from TBL_attach order by bno desc;





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


------------------------------------------------------- 잡다한 기능
SELECT * FROM USER_SEQUENCES; -- 전체 시퀀스 조회
ALTER TABLE tbl_board DROP COLUMN fileName; -- 칼럼 삭제

drop table tbl_board -- 보드 테이블 삭제
drop table tbl_reply -- 댓글 테이블 삭제
drop sequence tbl_like_seq; -- 보드_시퀀스 삭제


drop table tbl_like -- 테이블 삭제
select * from tbl_like -- tbl_like 테이블 전체 조회

select * from tbl_reply order by bno desc;

delete from TBL_BOARD; -- 더미데이터 삭제

update TBL_BOARD set category='자유' where category='선택'; -- category 칼럼의 '선택' 데이터 값을 '자유'로 변경
