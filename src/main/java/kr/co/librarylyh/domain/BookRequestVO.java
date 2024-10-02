package kr.co.librarylyh.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BookRequestVO {
	
	private Long r_bookBno; //  도서 요청 글 번호
	private String r_bookTitle; // 요청 도서 제목
	private String r_bookAuthor; // 요청 도서 저자
	private String r_bookCategory; // 요청 도서 카테고리
	private String r_bookCompany; // 요청 도서 출판사
	private String r_bookUserId; //  도서 요청 유저아이디
	private String r_bookUserNickName; // 도서 요청 유저 닉네임
	
	private String r_bookProcedure; // 도서 요청 상태
	private String r_bookResultMsg; // 도서 요청 결과에 대한 메시지
	
	private Date r_bookRegdate; // 도서 요청 날짜
	private Date r_bookUpdateDate; // 도서 요청 처리 확인용날짜
	
  
  private List<BookRequestAttachVO> attachListRequest;
  
}
