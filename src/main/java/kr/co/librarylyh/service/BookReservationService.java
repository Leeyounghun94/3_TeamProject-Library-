package kr.co.librarylyh.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.librarylyh.domain.BookListVO;
import kr.co.librarylyh.domain.CartVO;
import kr.co.librarylyh.domain.bookReservationVO;

public interface BookReservationService {

	
	
	public void rsRegister(bookReservationVO vo);// 예약 등록하기
	
	public List<bookReservationVO> rsList(); // 예약 목록 수
	
	public bookReservationVO rsRead(Long rsNum);// 예약 가져오기
	
	public boolean rsModify(@Param("rsNum") Long rsNum, @Param("isbn13") Long isbn13);	// 예약 수정하기
	
	public boolean rsRemove(Long rsNum);// 예약 삭제하기
	
	public boolean rsDel(Long rsNum, Long isbn13);
	
	
	// 장바구니 연계
	
	
	//장바구니에 도서를 추가할 수 있는 메서드
	public void addToBasket(String isbn13);
	
	//현재 장바구니에 담긴 도서를 조회할 수 있는 메서드
	public List<CartVO> listBasketItems();
	
	//장바구니에서 도서를 제거할 수 있는 메서드
	public boolean removeFromBasket(String isbn13);
	
	//장바구니에 담긴 모든 도서를 예약으로 전환하고, cart_tbl에서 삭제하여 reservation_tbl로 등록.
	public boolean confirmReservation(String user_id);

	//장바구니의 모든 도서를 예약으로 전환하고, cart_tbl에서 해당 도서들을 삭제하는 작업을 수행.
	public String cartBookRs(String user_id);
	
}
