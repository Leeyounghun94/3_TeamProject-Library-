

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

	isbn13 varchar2(13) primary key,
	book varchar2(100),
	author varchar2(100),
	publisher varchar2(50),
	price number(10,2),
	photo varchar2(100)

);


insert into book_tbl(isbn13, book, author, publisher, price, photo) values
('4567894567894', '마도서', '작가님', '넥슨', '5000', '사진1');
insert into book_tbl(isbn13, book, author, publisher, price, photo) values
('4561231234564', '책이라는것은', '머저리1', '넥슨', '6000', '사진2');
insert into book_tbl(isbn13, book, author, publisher, price, photo) values
('7894561231113', '남괴', '작가님', '힝힝', '5000', '사진4');
insert into book_tbl(isbn13, book, author, publisher, price, photo) values
('7777789456114', '이걸책이라고만듦?', '작가아님', '넥슨', '7000', '사진5');

select * from book_tbl;

drop table book_tbl;

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