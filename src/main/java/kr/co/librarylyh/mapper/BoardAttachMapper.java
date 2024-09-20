package kr.co.librarylyh.mapper;

import java.util.List;

import kr.co.librarylyh.domain.BoardAttachVO;

public interface BoardAttachMapper {
	
	public void insert(BoardAttachVO vo);
	
	public void delete(String uuid);
	
	public List<BoardAttachVO> findByBno(Long bno); // 파일 첨부
	
	public void deleteAll(Long bno); // 첨부파일 삭제
	
	public List<BoardAttachVO> getOldFiles(); // 잘못된 파일 찾기
	
	public void insertBoard(BoardAttachVO vo);
	

}
