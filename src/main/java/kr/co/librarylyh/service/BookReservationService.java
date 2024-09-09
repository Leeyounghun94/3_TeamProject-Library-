package kr.co.librarylyh.service;

import java.util.List;

import kr.co.librarylyh.domain.bookReservationVO;

public interface BookReservationService {

	
	
	public void rsRegister(bookReservationVO vo);
	
	public List<bookReservationVO> rsList();
	
	public bookReservationVO rsRead(String u_id);

	public boolean rsModify(bookReservationVO vo);
	
	public boolean rsRemove(String u_id);
	
	
}
