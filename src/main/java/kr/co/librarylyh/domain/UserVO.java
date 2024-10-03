package kr.co.librarylyh.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class UserVO {
	
	private String u_id;
	private String name;
	private String birth;
	private String phone;
	private String email;
	private String id;
	private String pw;
	private String nickName;
	private int authority;
	
	private int point; // 유저 포인트 2024 10 02
	private LocalDate lastVisitDate; // 마지막 방문일자 2024 10 02 *매일 포인트 증정용
}
