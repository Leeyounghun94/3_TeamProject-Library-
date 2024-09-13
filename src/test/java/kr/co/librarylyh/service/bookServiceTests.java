package kr.co.librarylyh.service;

import static org.junit.Assert.assertNotNull;

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
public class bookServiceTests {

	
	
	@Setter(onMethod_ = @Autowired)
	private BookService service ;
	
	
	@Test
	public void testExist() {
		assertNotNull(service);
	}
	
	
	@Test
	public void testRsRegister () {
		
		BookVO book = new BookVO();
		
		book.setIsbn13("12345678945");
		book.setBook("tlqkf");
		book.setAuthor("roto");
		book.setPublisher("개집");
		book.setPrice(1000);
		book.setPhoto("개사진");
		
		service.BookRegister(book);
		
		log.info("뭐나오노" + book);
	/* 뭐나오노BookVO(isbn13=12345678945, book=tlqkf, 
	 * author=roto, publisher=개집, price=1000, photo=개사진) */	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}
