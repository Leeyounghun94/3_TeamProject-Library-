package kr.co.librarylyh.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BookPointVO {
	
	private int bookPointNo; // 포인트 번호
	private int bookPoint; // 포인트(증감량)
	private int bookPointTotal; // 포인트 총합
	private Date bookPointDate; // 포인트 날짜
	private String bookPointHistory; // 포인트 내역
	private String bookPointUserId; // 포인트 적립한 유저 아이디
	private String bookPointNickName; // 포인트 적립한 유저 닉네임
	

}
