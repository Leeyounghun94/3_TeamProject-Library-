package kr.co.librarylyh.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.librarylyh.domain.BookVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)	// 메서드별 테스트용(junit4) 
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")	// 참고할 파일
@Log4j2
public class bookMapperTests {
	
	@Setter(onMethod_ =  @Autowired)
	private BookMapper mapper ;


	@Test
	public void testInsert() {
		
		BookVO book = new BookVO();
		
		book.setIsbn13("78978978978");
		book.setBook("마도서22");
		book.setAuthor("작가님11");
		book.setPublisher("넥슨");
		book.setPrice(3000);
		book.setPhoto("사진2");
		
		mapper.BookInsert(book);
		
		log.info("책 넣을게~ : " + book);
	}
	
/*	책 넣을게~ : BookVO(isbn13=4567894567894, book=마도서, 
			author=작가님, publisher=넥슨, price=5000, photo=사진1) */
	
}
