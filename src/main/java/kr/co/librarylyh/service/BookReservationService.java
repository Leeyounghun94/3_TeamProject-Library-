package kr.co.librarylyh.service;

import java.util.List;

import kr.co.librarylyh.domain.BookVO;
import kr.co.librarylyh.domain.bookReservationVO;

public interface BookReservationService {

	
	
	public void rsRegister(bookReservationVO vo);// 예약 등록하기
	
	public List<bookReservationVO> rsList(); // 예약 목록 수
	
	public bookReservationVO rsRead(Long rsNum);// 예약 가져오기
	
	public bookReservationVO rsModify(Long rsNum, Long isbn13);
	
	public boolean rsRemove(Long rsNum);// 예약 삭제하기
	
	
}
