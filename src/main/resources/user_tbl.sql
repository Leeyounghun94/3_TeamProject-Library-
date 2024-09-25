create table member_tbl(
	u_id varchar2(20),
	name varchar2(30) not null,
	birth number(10,0) not null,
	phone varchar2(30) not null,
	email varchar2(20) not null,
	id varchar2(20) not null unique,
	pw varchar2(20) not null,
	nickName varchar2(20) not null unique
);

alter table member_tbl add authority number(10);
alter table member_tbl modify authority number(10) default '0';

select dbms_random.String('X',10) u_id from dual; -- 임시테이블에 랜덤 번호 생성 (u_id)

insert into member_tbl(u_id, name, birth, phone, email, id, pw, nickName) values ('ZRBQCC081C','테스트', '990101', '010-1234-1234', 'mbc@naver.com', 'test123', 'test123', 'tester');
insert into member_tbl(u_id, name, birth, phone, email, id, pw, nickName) values ('123412243c','테스트1', '990102', '010-1234-5678', 'mbctest@naver.com', 'test222', 'test222', 'tester2');
insert into member_tbl(u_id, name, birth, phone, email, id, pw, nickName) values ('00000admin','admin00', '123451', '010-1234-1234', 'admin1@naver.com', 'admin', 'admin00', 'admin');
select dbms_random.String('X',10)u_id from dual; 
insert into member_tbl(u_id, name, birth, phone, email, id, pw, nickName) values ('u_id','테스트3', '990103', '010-1234-9876', 'mbc3@naver.com', 'test333', 'test333', 'tester3');

select * from MEMBER_TBL;

select * from member_tbl where id = 'test555' and pw = 'test55';

select u_id, name, birth, phone, email, id, pw, nickName from member_tbl where id = 'test555' and pw = 'test55';

update MEMBER_TBL set authority = 0 where id ='test222';
select * from member_tbl where authority>0;


select * from member_tbl where name='test'and email='library5@naver.com';
--------------------------------------------- 좋아요 구현 10차 시기
create table tbl_like (
	bno number(10,0) default 0,
	userId varchar2(200)
)

drop table tbl_like

select * from tbl_like



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

alter table tbl_board add (uuid varchar2(100) default 'X');
alter table tbl_board add (uploadPath varchar2(200) default 'X' );
alter table tbl_board add (fileName varchar2(100) default '.no' );
alter table tbl_board add (filetype char(1) default 'I');


ALTER TABLE tbl_board DROP COLUMN fileName; -- 칼럼 삭제


alter table tbl_board add (likeNum number default 0); -- 게시물 좋아요 수

alter table tbl_board add (replycnt number default 0);

alter table tbl_board add (viewNum number default 0); -- 게시글 조회수

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
drop sequence tbl_like_seq; -- 보드_시퀀스 삭제
alter table tbl_board add (viewNum number default 0);
insert into tbl_board(title, category, content, bno, regdate, nickName, viewNum)
values ('테스트제목1', '테스트카테', '테스트내용', '1', '2020-01-01', 'kkk', '0');
drop table tbl_board;

-- BOOK 테이블 생성
drop table book_tbl;
drop table book_detail_tbl;
drop table category_tbl;
drop table book_category_tbl;

create table book_tbl
(
    isbn13           number(13) PRIMARY KEY,
    book             varchar2(250) NOT NULL,
    author           varchar2(250) NOT NULL,
    publisher        varchar2(150) NOT NULL,
    price            number(10),
    rentalAvailable char(1)       NOT NULL,
    photo            varchar2(250) NOT NULL,
    publicationDate date,
    reviewCount     number(6),
    averageRating   number(2, 1),
    bookCount          number(10)
);

create table book_detail_tbl
(
    isbn13           number(13) PRIMARY KEY ,
    bookDescription CLOB,
    pageCount       number(5),
    weight           varchar2(10),
    bookSize        varchar2(50),
    star5Count           char(4),
    star4Count           char(4),
    star3Count           char(4),
    star2Count           char(4),
    star1Count           char(4),
    FOREIGN KEY (isbn13) REFERENCES book_tbl (isbn13) -- 외래 키
);

create table category_tbl
(
    categoryId    number(19) PRIMARY KEY,
    categoryName  varchar2(60) NOT NULL,
    categoryLevel number(1)    NOT NULL,
    parentId      number(19)
);

CREATE TABLE book_category_tbl
(
    isbn13      number(13),                                         -- 책 ID
    categoryId number(19),                                         -- 카테고리 ID
    PRIMARY KEY (isbn13, categoryId),                              -- 복합 키
    FOREIGN KEY (isbn13) REFERENCES book_tbl (isbn13),              -- 외래 키 (책 테이블과 연결)
    FOREIGN KEY (categoryId) REFERENCES category_tbl (categoryId) -- 외래 키 (카테고리 테이블과 연결)
);

-- 책 제목(book) 에 대한 인덱스
CREATE INDEX idx_book_title ON book_tbl (book);
-- 출판일(publicationDate) 에 대한 인덱스
CREATE INDEX idx_publication_date ON book_tbl (publicationDate);
-- book_category_tbl의 isbn13 에 대한 인덱스
CREATE INDEX idx_book_category_isbn ON book_category_tbl (isbn13);
-- book_category_tbl의 categoryId 에 대한 인덱스
CREATE INDEX idx_book_categoryId ON book_category_tbl (categoryId);


SELECT b.*, bd.* FROM book_tbl b LEFT JOIN book_detail_tbl bd ON b.isbn13 = bd.isbn13
WHERE b.isbn13 = 9791186906071;


-- reservation 테이블 생성

create table reservation_tbl(
	u_id varchar2(20),
	isbn13 number(13),
	rsNum number(10,0)  primary key,
	rsStartDay date default sysdate, 
	rsEndDay date default sysdate
);

insert into reservation_tbl (rsNum, u_id, isbn13, rsStartDay, rsEndDay)
values(seq_reservation.nextval, 'ZR2411C', '4567894567894', '2024/09/01', '2024/09/03'); --더미데이터 삽입

insert into reservation_tbl (rsNum, u_id, isbn13, rsStartDay, rsEndDay)
values(seq_reservation.nextval, 'QQQ123', '123123123', '2024/09/01', '2024/09/03');
insert into reservation_tbl (rsNum, u_id, isbn13, rsStartDay, rsEndDay)
values(seq_reservation.nextval, 'qwer789', '789789789', '2024/09/01', '2024/09/03');
insert into reservation_tbl (rsNum, u_id, isbn13, rsStartDay, rsEndDay)
values(seq_reservation.nextval, 'q1w2e3r', '9517534682', '2024/09/01', '2024/09/03');
insert into reservation_tbl (rsNum, u_id, isbn13, rsStartDay, rsEndDay)
values(seq_reservation.nextval, 'k4k5k6k7', '9876543210', '2024/09/01', '2024/09/03');
insert into reservation_tbl (rsNum, u_id, isbn13, rsStartDay, rsEndDay)
values(seq_reservation.nextval, 'w8w8w8w', '010203040', '2024/09/01', '2024/09/03');

create sequence seq_reservation; -- 예약 테이블 자동 번호 객체 생성

select * from reservation_tbl;

drop table reservation_tbl;