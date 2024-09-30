package kr.co.librarylyh.domain;

import java.util.Date;

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
	private String newPw;
	private String nickName;
	private int authority;
	private Date regDate;
	private int point;
}
