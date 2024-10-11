package kr.co.librarylyh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.librarylyh.domain.CartVO;

@Mapper
public interface CartMapper {

	
	// Cart(장바구니) Mapper
	
	
	// 장바구니에 물품 등록하기
	public int cartInsert(CartVO vo);
	
	// CartId를 알아내기 위한 Insert
	public int CartIdPut(CartVO vo);
	
	// 장바구니에 물품 한 개 불러오기
	public CartVO cartRead(CartVO vo);
	
	// 장바구니 물품 목록 리스트 
	public List<CartVO> cartList(String cart_id);
	
	// 장바구니 물품 업데이트
	public int cartUpdate(CartVO vo);
	
	// 장바구니 개별 물품 삭제
	public int cartDelete(@Param(value = "cart_id") String cart_id, @Param(value = "isbn13") Long isbn13);
	
	// 장바구니 비우기
	public int clearBasket(String user_id);
	
	// 물품 개수 세기
	public int cartCount(String cart_id);
	
	//카트 아이디 생성 유무 판단
	public int cartIdCheck(CartVO vo);
	
	// 카트 아이디 반납
	public List<String> findCartID(CartVO vo);
}
