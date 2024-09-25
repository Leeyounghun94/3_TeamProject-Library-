package kr.co.librarylyh.service;

import java.util.List;

import kr.co.librarylyh.domain.BookVO;

public interface BookService {

	
	public void BookRegister(BookVO book);
	
	public List<BookVO> BookList();
	
	public BookVO BookRead(String isbn13);

	public boolean BookModify(BookVO book);
	
	public boolean BookRemove(String isbn13);
	
	
	
}
