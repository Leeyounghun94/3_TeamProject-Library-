package kr.co.librarylyh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;



import kr.co.librarylyh.domain.bookReservationVO;

public interface bookReservationMapper {

	// 예약 메퍼
	
	
	
	// 예약 등록하기 
	public void rsInsert(bookReservationVO vo);
	
	// 예약 불러오기(예약 게시글 번호 받아 불러오기)
	public bookReservationVO rsRead(Long rsNum);
	
	// 예약 목록 리스트
	public List<bookReservationVO> rsList();
	
	// 예약 수정하기(반납일 연장) 
	public int rsUpdate(@Param("rsNum") Long rsNum, @Param("isbn13") Long isbn13);
	
	// 예약 삭제하기 - 번호를 받아 삭제
	public int rsDelete(Long rsNum);
	

}
