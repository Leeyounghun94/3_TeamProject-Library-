package kr.co.librarylyh.service;

import java.util.List;

import kr.co.librarylyh.domain.CartVO;

public interface CartService {

	// Cart(장바구니) Service
	
	
	public void CartRegister(CartVO vo) throws Exception; // 장바구니 물품 등록하기
	
	public List<CartVO> cartList(); // 장바구니 목록 리스트
	
	public CartVO cartRead(String cart_id);	// 장바구니 물품 불러오기
	
	public boolean cartModify(CartVO vo);	// 장바구니 물품 수정
	
	public boolean cartRemove(String cart_id);	// 장바구니 개별 물품 삭제
	
	public boolean clearBasket(String user_id);	// 장바구니 비우기
	

}
