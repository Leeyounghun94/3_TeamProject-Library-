package kr.co.librarylyh.mapper;

import java.util.List;

import kr.co.librarylyh.domain.bookReservationVO;

public interface bookReservationMapper {

	// 책 예약 메퍼
	
	
	
	// 예약 등록하기 
	public void rsInsert(bookReservationVO vo);
	
	// 예약 불러오기
	public bookReservationVO rsRead(String u_id);
	
	// 예약 목록 리스트
	public List<bookReservationVO> rsList();
	
	// 예약 수정하기
	public int rsUpdate(bookReservationVO vo);
	
	// 예약 삭제하기
	public int rsDelete(String u_id);
	
	// 
	public void RsInsertSelectKey(bookReservationVO vo);
	
}
