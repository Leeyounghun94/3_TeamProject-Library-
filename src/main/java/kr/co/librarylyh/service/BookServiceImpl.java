package kr.co.librarylyh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.librarylyh.domain.BookVO;
import kr.co.librarylyh.mapper.BookMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Service		// 스프링에 서비스를 담당한다 라는 코드(비즈니스 로직 영역을 담당함)
//root-context.xml에 context 항목 추가
@Log4j2			// 로그 출력용
@AllArgsConstructor // 모든 매개값을 이용하여 자동으로 생성자 생성


public class BookServiceImpl implements BookService {

	
	@Setter(onMethod_ = @Autowired)
	private BookMapper mapper ;
	
	@Override
	public void BookRegister(BookVO book) {
		log.info("BookServiceImpl.BookRegister 메서드 실행");
		mapper.BookInsert(book);
		
	}

	@Override
	public List<BookVO> BookList() {
		log.info("BookServiceImpl.BookList 메서드 실행");
		return mapper.BookList();
	}

	@Override
	public BookVO BookRead(String isbn13) {
		log.info("BookServiceImpl.BookRead 메서드 실행");
		return mapper.BookRead(isbn13);
	}

	@Override
	public boolean BookModify(BookVO book) {
		log.info("BookServiceImpl.BookModify 메서드 실행");
		return mapper.BookUpdate(book) == 1;
	}

	@Override
	public boolean BookRemove(String isbn13) {
		log.info("BookServiceImpl.BookRemove 메서드 실행");
		return mapper.BookDelete(isbn13) == 1;
	}

}
