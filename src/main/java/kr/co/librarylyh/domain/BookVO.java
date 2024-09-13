package kr.co.librarylyh.domain;

import lombok.Data;

@Data
public class BookVO {

	
	
	// BOOK 객체 - 현우씨
	
	private String isbn13 ;// 책 ID
	
	private String book ;// 책 제목
	
	private String author;// 작가
	
	private String publisher;// 출판사/브랜드
	
	private int price;	// 가격
	
	private String photo; // 이미지 파일 이름

}
