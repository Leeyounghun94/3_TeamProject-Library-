package kr.co.librarylyh.domain;

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
}
