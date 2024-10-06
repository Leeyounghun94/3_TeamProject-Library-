package kr.co.librarylyh.service;

import java.util.List;

import kr.co.librarylyh.domain.CartVO;

public interface CartService {

	// Cart(장바구니) Service
	
	
	public int cartRegister(CartVO vo); // 장바구니 물품 등록하기
	
	public int CartIdPut(CartVO vo);
	
	public List<CartVO> cartList(String cart_id); // 장바구니 목록 리스트
	
	public CartVO cartRead(CartVO vo);	// 장바구니 물품 불러오기
	
	public boolean cartModify(CartVO vo);	// 장바구니 물품 수정
	
	public boolean cartRemove(String cart_id, Long isbn13);	// 장바구니 개별 물품 삭제
	
	public boolean clearBasket(String user_id);	// 장바구니 비우기
	
	public int cartCount(String cart_id);	// 물품 개수 세기
	
	public int cartIdCheck(CartVO vo);	//카트 아이디 생성 유무 판단
	
	public List<String> findCartID(CartVO vo); // 카트 아이디 반납
	
	

	

}
