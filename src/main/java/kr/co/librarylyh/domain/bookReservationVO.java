package kr.co.librarylyh.domain;



import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class bookReservationVO {

	// 책 예약 객체
	
	
	/* 책 이름
	 * 가격
	 * 예약 날짜(Start)
	 * 예약 날짜(End)
	 * 예약자 이름(유저 id)
	 * 핸드폰 번호 
	 * 책 대여 판단 유무
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate reservationDate; 
		
	private String r_bookname ;	// 책 이름
	
	private String u_id ; // 회원 번호
	
	private int r_bookprice ; // 가격
	
	private String r_phone ;	// 휴대폰 번호
	
	private String r_start ; // 예약 시작 날짜
	
	private String r_end ; // 예약 종료 날짜
	
	
	
}
