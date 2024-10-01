package kr.co.librarylyh.mapper;

import java.util.List;

import kr.co.librarylyh.domain.CartVO;

public interface CartMapper {

	
	// Cart(장바구니) Mapper
	
	
	// 장바구니에 물품 등록하기
	public void cartInsert(CartVO vo) throws Exception;
	
	// 장바구니에 물품 한 개 불러오기
	public CartVO CartRead(String cart_id);
	
	// 장바구니 물품 목록 리스트 
	public List<CartVO> cartList();
	
	// 장바구니 물품 업데이트
	public int cartUpdate(CartVO vo);
	
	// 장바구니 개별 물품 삭제
	public int cartDelete(String cart_id);
	
	// 장바구니 비우기
	public int clearBasket(String user_id);
}
