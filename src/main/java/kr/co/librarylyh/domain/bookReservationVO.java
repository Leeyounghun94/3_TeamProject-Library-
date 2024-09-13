package kr.co.librarylyh.domain;

import java.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;
import lombok.Data;

@Data
public class bookReservationVO {

	// 오직 예약으로만 이루어진 객체
	
	
	/* 
	 * 책 ID 
	 * 유저 ID
	 * 예약 번호(=) 
	 * 예약 시작일(Start)
	 * 예약 종료일(End)	  
	 */
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate Date; 

	private String u_id ;	// 유저 아이디
	
	private Long isbn13 ;	// 책 아이디
	
	private String rsStartDay; // 예약 시작일

	private String rsEndDay;// 예약 종료일
	
	private Long rsNum ; // 예약 번호
}
