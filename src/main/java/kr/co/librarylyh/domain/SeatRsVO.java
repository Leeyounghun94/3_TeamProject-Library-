package kr.co.librarylyh.domain;

import java.util.Date;

import lombok.Data;

@Data
public class SeatRsVO {

	
	// 열람실 예약하기 - 1. 열람실VO 객체 생성
	
	
	  private int sno;	// 좌석 번호
	  
	  private String name;	// 좌석 이름(고정석,자유석)
	  
	  private boolean status; // 좌석 이용 상태
	  
	  
	  private Long userNo;	// 회원 번호
	
	  private String u_id;	// 회원 아이디
	  
	  
	  private Long regNo; // 등록번호

	  private Date seatS_Day; // 시작일

	  private Date seatE_Day; // 종료일


}
