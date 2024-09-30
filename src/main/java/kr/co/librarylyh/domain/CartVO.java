package kr.co.librarylyh.domain;


import lombok.Data;

@Data
public class CartVO {

	// 장바구니 VO
	
	
	
	private String cart_id; // 장바구니 ID (PK)
	
	private String user_id; // 사용자  ID
	
	private Long isbn13;	// 도서 ISBN
	
	private Long c_count;	// 장바구니에 담은 도서 개수
	
	private String photo;	// 도서 사진 URL (책의 사진 정보)
	
	private String c_title;	// 도서 제목
	
	private Long c_price;	//도서 개별 가격
	
	private Long c_totalPrice; // 총 가격 (수량 * 개별 가격)
	
	
}
