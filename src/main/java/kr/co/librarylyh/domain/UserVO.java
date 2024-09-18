package kr.co.librarylyh.domain;

import lombok.Data;

@Data
public class UserVO {
	
	private String u_id;	// 유저 아이디
	
	private String name;	// 성함
	
	private String birth;	// 생년월일
	
	private String phone;	// 핸드폰 번호
	
	private String email;	// 이메일
	
	private String id;	// 아이디
	
	private String pw;	// 비밀번호
	
	private String nickName;	// 닉네임
}
