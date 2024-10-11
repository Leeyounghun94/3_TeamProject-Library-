package kr.co.librarylyh.mapper;

import java.util.List;

import kr.co.librarylyh.domain.BookVO;

public interface BookMapper {
	
	
	// BOOK Mapper

	
	public void BookInsert(BookVO book);
	
	public BookVO BookRead(String isbn13);
	
	public List<BookVO> BookList();
	
	public int BookUpdate(BookVO book);
	
	public int BookDelete(String isbn13);
}
