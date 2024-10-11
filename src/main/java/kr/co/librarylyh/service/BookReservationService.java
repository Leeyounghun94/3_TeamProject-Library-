package kr.co.librarylyh.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.librarylyh.domain.BookListVO;
import kr.co.librarylyh.domain.CartVO;
import kr.co.librarylyh.domain.bookReservationVO;

public interface BookReservationService {

	
	
	public int rsRegister(bookReservationVO vo);// 예약 등록하기
	
	public List<bookReservationVO> rsList(); // 예약 목록 수
	
	public bookReservationVO rsRead(Long rsNum);// 예약 가져오기
	
	public boolean rsModify(@Param("rsNum") Long rsNum, @Param("isbn13") Long isbn13);	// 예약 수정하기
	
	public boolean rsRemove(Long rsNum);// 예약 삭제하기
	
	public boolean rsDel(Long rsNum, Long isbn13);
	
}
