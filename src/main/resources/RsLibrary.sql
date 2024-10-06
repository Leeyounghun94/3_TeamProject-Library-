
drop table member_tbl;
drop table board_tbl;
drop table cart_tbl;


-- member 테이블 생성
create table member_tbl(
	u_id varchar2(20) not null primary key,
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
select * from book_tbl;



-- Cart 테이블 생성
CREATE TABLE cart_tbl(
    cart_id varchar2(100),      				-- 장바구니 ID
    user_id varchar2(20) NOT NULL,         -- 사용자 ID (users 테이블의 u_id 참조)
    isbn13 number(13) NOT NULL,            -- 도서 ISBN (books 테이블의 isbn13 참조)
    photo varchar2(100),                   -- 도서 사진 URL (책의 사진 정보)
    c_title varchar2(100) NOT NULL,        -- 도서 제목
    cartDate date default sysdate,
   
    
    FOREIGN KEY (user_id) REFERENCES member_tbl(u_id), -- 사용자 ID 참조
    FOREIGN KEY (isbn13) REFERENCES book_tbl(isbn13) -- 도서 ISBN 참조
);

alter table cart_tbl MODIFY cart_id varchar2(100);

alter table cart_tbl add cartDate date default sysdate;

-- Cart테이블의 시퀀스 생성 -> 시작 번호 : 10,000 / 최대값 : 99999 / Cycle : 20
 create sequence seq_cart
START WITH 10000
INCREMENT BY 1
MINVALUE 10000
MAXVALUE 99999
CYCLE
CACHE 20;

-- Cart테이블의 인덱스 설정
create index idx_cart on cart_tbl (cart_id);


-- Cart테이블 더미데이터(10.3 기준 값 유효 X)
insert into cart_tbl (cart_id, user_id, isbn13, photo, c_title) 
values ('카트아디1','ZRBQCC081C', '9788954415705', '사진1', '책 제목1');

insert into cart_tbl (cart_id, user_id, isbn13, c_count, photo, c_title, c_price, c_totalPrice) 
values ('카트아디2','ZRBzzzzzzC', '9791156345541', '2', '사진2', '책 제목2', '19900', '19900');
insert into cart_tbl (cart_id, user_id, isbn13, c_count, photo, c_title, c_price, c_totalPrice) 
values ('카트아디3','Zeqqqwe1C', '9791164065509', '2', '사진3', '책 제목3', '19900', '19900');
insert into cart_tbl (cart_id, user_id, isbn13, c_count, photo, c_title, c_price, c_totalPrice) 
values ('카트아디4','ZR2411C', '9791166626296', '2', '사진4', '책 제목4', '19900', '19900');
insert into cart_tbl (cart_id, user_id, isbn13, c_count, photo, c_title, c_price, c_totalPrice) 
values ('카트아디5','ZRhrdfasw081C', '9788971969007', '2', '사진5', '책 제목5', '19900', '19900');

-- 테이블 유지시키되, 데이터 초기화하는 truncate
truncate table cart_tbl;

select * from  cart_tbl;


select count(*) FROM cart_tbl WHERE user_id = 'UZMRG4SNME' and  to_char(cartDate) = to_char(to_date('2024-10-06','YYYY-MM-DD')) ;

-- reservation 테이블 생성
CREATE TABLE reservation_tbl (
    rsNum NUMBER(10,0),         -- 예약 번호 (Primary Key)
    user_id VARCHAR2(20) NOT NULL,         -- 사용자 ID (users 테이블의 u_id 참조)
    isbn13 NUMBER(13) NOT NULL,            -- 도서 ISBN (books 테이블의 isbn13 참조)
    rsStartDay DATE DEFAULT SYSDATE,       -- 예약 시작일
    rsEndDay DATE DEFAULT SYSDATE+14,         -- 반납일
    FOREIGN KEY (user_id) REFERENCES member_tbl(u_id), -- 사용자 ID 참조
    FOREIGN KEY (isbn13) REFERENCES book_tbl(isbn13) -- 도서 ISBN 참조
);

-- rsNum을 단일 PK로 유지하여, 예약 번호를 기준으로 데이터 관리.
-- user_id와 isbn13의 조합을 UNIQUE로 설정하여 동일 사용자가 같은 도서를 중복 예약하지 않도록 제약 조건 추가.
-- rsStartDay와 rsEndDay를 기본값으로 SYSDATE를 지정하여 예약 생성 시 자동으로 날짜가 설정되도록 설정.


 create sequence seq_rs
START WITH 10000
INCREMENT BY 1
MINVALUE 10000
MAXVALUE 99999
CYCLE
CACHE 20;


create index idx_rs on reservation_tbl (rsNum); -- pk가 없는 대신 값을 빨리 불러오기 위한 인덱싱 설정 

insert into reservation_tbl (rsNum, user_id, isbn13, rsStartDay, rsEndDay) 
values ('1','ZRBQCC081C', '9788954415705', '2024-09-09', '2024-09-17');

insert into reservation_tbl (rsNum, user_id, isbn13, rsStartDay, rsEndDay) 
values ('2','ZRBzzzzzzC', '9791156345541', '2024-09-09', '2024-09-17');
insert into reservation_tbl (rsNum, user_id, isbn13, rsStartDay, rsEndDay) 
values ('3','Zeqqqwe1C', '9791164065509', '2024-09-09', '2024-09-17');
insert into reservation_tbl (rsNum, user_id, isbn13, rsStartDay, rsEndDay) 
values ('4','ZR2411C', '9791166626296', '2024-09-09', '2024-09-17');
insert into reservation_tbl (rsNum, user_id, isbn13, rsStartDay, rsEndDay) 
values ('5','ZRhrdfasw081C', '9788971969007', '2024-09-09', '2024-09-17');


select * from reservation_tbl;

drop table reservation_tbl;

ALTER TABLE reservation_tbl DROP CONSTRAINT rsNum ;


-- Seat 테이블 생성( 나중에 미룸)
create table seat_tbl (
		
		sno number(10),
		seat_name varchar2(20),
		status number(1),
		userNo number(10),
		u_id varchar2(20) primary key,
		regNo number(10),
		seatS_Day date default sysdate,
		seatE_Day date default sysdate

);