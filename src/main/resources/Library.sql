

-- member 테이블 생성
create table member_tbl(
	u_id varchar2(20) not null unique,
	name varchar2(30) not null, 
	birth number(10,0) not null,
	phone varchar2(30) not null,
	email varchar2(50) not null,
	id varchar2(20) not null unique,
	pw varchar2(20) not null,
	nickName varchar2(10) not null unique
);

-- alter table member_tbl add constraint pk_member primary key (u_id);

-- create sequence seq_member; 

-- member 테이블 더미데이터 추가
insert into member_tbl(u_id, name, birth, phone, email, id, pw, nickName) 
values ('ZRBQCC081C','테스트1', '990101', '010-1234-5678', 'mbc@naver.com', 'test123', 'test123', 'tester');
insert into member_tbl(u_id, name, birth, phone, email, id, pw, nickName) 
values ('ZRBzzzzzzC','테스트2', '990102', '010-1234-9874', 'mbc@naver.com', '456789', 'test123', 'qqq');
insert into member_tbl(u_id, name, birth, phone, email, id, pw, nickName) 
values ('Zeqqqwe1C','테스트3', '990103', '010-1234-0000', 'mbc@naver.com', '777777', 'test123', 'www');
insert into member_tbl(u_id, name, birth, phone, email, id, pw, nickName) 
values ('ZR2411C','테스트4', '990104', '010-1234-4567', 'mbc@naver.com', '66666', 'test123', 'eee');
insert into member_tbl(u_id, name, birth, phone, email, id, pw, nickName) 
values ('ZRhrdfasw081C','테스트5', '990107', '010-1234-4444', 'mbc@naver.com', '33333', 'test123', 'rrr');


select * from  member_tbl;


-- board 테이블 생성
create table board_tbl(
	title varchar2(20) not null,
	category varchar2(20) not null,
	content varchar2(1000) not null,
	bno number(10,0),
	regdate date default sysdate,
	nickName varchar2(20) not null

);

insert into board_tbl(title, category, content, bno, regdate, nickName)
values ('테스트제목1', '테스트카테', '테스트내용', '1', '2020-01-01', 'kkk');

-- BOOK 테이블 생성
create table book_tbl(
	photo varchar2(50) not null,
	book varchar2(20) not null,
	author varchar2(20) not null,
	publisher varchar2(20) not null,
	price number(10,0),
	category varchar2(20) not null,
	summary varchar2(1000) not null,
	b_count number(10,0),
	ISBN_13 number(30,0)

);

insert into book_tbl(photo, book, author, publisher, price, category, summary, b_count, ISBN_13)
values ('고생', '고생2', '고생작가', 'mbc출판', '1000', '문학', '프로젝트기간', '1000', '1111');

INSERT INTO book_tbl (photo, book, author, publisher, price, genre, summary, b_count, isbn_13, isbn_10, publicationDate)
VALUES ('사진링크', '책제목', '저자', '브랜드(출판사)', 10000, '장르', '대충 개쩌는 줄거리', 3, 1234567890123, 1000000000, TO_DATE('2024-09-03', 'YYYY-MM-DD'));

select * from book_tbl;

-- Cart 테이블 생성

create table cart_tbl(
	photo varchar2(20),
	c_title varchar2(20) not null,
	c_count number(10,0),
	c_price number(10,0),
	c_totalPrice number(10,0),
	book_id varchar2(20) not null,
	u_id varchar2(20)

);



-- reservation 테이블 생성

create table reservation_tbl(

	r_bookName varchar2(100) not null, --테이블 수정하기
	u_id varchar2(20) not null unique,
	r_bookPrice number(10),
	r_Phone varchar2(30) not null,
	r_Start date default sysdate, 
	r_End date default sysdate
);

insert into reservation_tbl (r_bookName, u_id, r_bookPrice, r_Phone, r_Start, r_End)
values('yyy', 'hhh', '1000', '010-111-111', '2024/09/01', '2024/09/03'); --더미데이터 삽입

insert into reservation_tbl (r_bookName, u_id, r_bookPrice, r_Phone, r_Start, r_End)
values('yyy', 'QQQ', '1000', '010-111-111', '2024/09/01', '2024/09/03'); 
insert into reservation_tbl (r_bookName, u_id, r_bookPrice, r_Phone, r_Start, r_End)
values('yyy', 'www', '1000', '010-111-111', '2024/09/01', '2024/09/03'); 
insert into reservation_tbl (r_bookName, u_id, r_bookPrice, r_Phone, r_Start, r_End)
values('yyy', 'eee', '1000', '010-111-111', '2024/09/01', '2024/09/03'); 

select * from reservation_tbl;

drop table reservation_tbl;