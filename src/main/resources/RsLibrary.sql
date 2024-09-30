
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



-- Cart 테이블 생성
CREATE TABLE cart_tbl(
    cart_id varchar2(20) primary key,      -- 장바구니 ID (Primary Key)
    user_id varchar2(20) NOT NULL,         -- 사용자 ID (users 테이블의 u_id 참조)
    isbn13 number(13) NOT NULL,            -- 도서 ISBN (books 테이블의 isbn13 참조)
    c_count number(10,0) DEFAULT 1,        -- 장바구니에 담은 도서의 개수 (기본값 1)
    photo varchar2(100),                   -- 도서 사진 URL (책의 사진 정보)
    c_title varchar2(100) NOT NULL,        -- 도서 제목
    c_price number(10,0),                  -- 도서 개별 가격
    c_totalPrice number(10,0),             -- 총 가격 (수량 * 개별 가격)
    
    FOREIGN KEY (user_id) REFERENCES member_tbl(u_id), -- 사용자 ID 참조
    FOREIGN KEY (isbn13) REFERENCES book_tbl(isbn13), -- 도서 ISBN 참조
    UNIQUE (user_id, isbn13)               -- 동일 사용자가 동일 도서를 중복으로 담지 않도록 제약 조건 추가
);

-- cart_id를 PK로 설정하여 각 행의 고유성을 보장.
-- user_id와 isbn13의 조합을 UNIQUE로 설정하여 동일 사용자가 같은 도서를 여러 번 장바구니에 담지 못하게 관리.
-- c_totalPrice 필드를 유지하되, c_count와 c_price로 계산하여 저장할지 혹은 동적으로 계산할지 결정.


insert into cart_tbl (cart_id, user_id, isbn13, c_count, photo, c_title, c_price, c_totalPrice) 
values ('카트아디1','ZRBQCC081C', '9788954415705', '2', '사진1', '책 제목1', '19900', '19900');

insert into cart_tbl (cart_id, user_id, isbn13, c_count, photo, c_title, c_price, c_totalPrice) 
values ('카트아디2','ZRBzzzzzzC', '9791156345541', '2', '사진2', '책 제목2', '19900', '19900');
insert into cart_tbl (cart_id, user_id, isbn13, c_count, photo, c_title, c_price, c_totalPrice) 
values ('카트아디3','Zeqqqwe1C', '9791164065509', '2', '사진3', '책 제목3', '19900', '19900');
insert into cart_tbl (cart_id, user_id, isbn13, c_count, photo, c_title, c_price, c_totalPrice) 
values ('카트아디4','ZR2411C', '9791166626296', '2', '사진4', '책 제목4', '19900', '19900');
insert into cart_tbl (cart_id, user_id, isbn13, c_count, photo, c_title, c_price, c_totalPrice) 
values ('카트아디5','ZRhrdfasw081C', '9788971969007', '2', '사진5', '책 제목5', '19900', '19900');


select * from  cart_tbl;



-- reservation 테이블 생성
CREATE TABLE reservation_tbl (
    rsNum NUMBER(10,0) PRIMARY KEY,        -- 예약 번호 (Primary Key)
    user_id VARCHAR2(20) NOT NULL,         -- 사용자 ID (users 테이블의 u_id 참조)
    isbn13 NUMBER(13) NOT NULL,            -- 도서 ISBN (books 테이블의 isbn13 참조)
    rsStartDay DATE DEFAULT SYSDATE,       -- 예약 시작일
    rsEndDay DATE DEFAULT SYSDATE,         -- 예약 종료일
    FOREIGN KEY (user_id) REFERENCES member_tbl(u_id), -- 사용자 ID 참조
    FOREIGN KEY (isbn13) REFERENCES book_tbl(isbn13), -- 도서 ISBN 참조
    UNIQUE (user_id, isbn13)               -- 동일 사용자가 같은 ISBN을 중복 예약하지 못하도록 제약 조건 추가
);


-- rsNum을 단일 PK로 유지하여, 예약 번호를 기준으로 데이터 관리.
-- user_id와 isbn13의 조합을 UNIQUE로 설정하여 동일 사용자가 같은 도서를 중복 예약하지 않도록 제약 조건 추가.
-- rsStartDay와 rsEndDay를 기본값으로 SYSDATE를 지정하여 예약 생성 시 자동으로 날짜가 설정되도록 설정.

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