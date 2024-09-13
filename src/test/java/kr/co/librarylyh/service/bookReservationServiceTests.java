package kr.co.librarylyh.service;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.librarylyh.domain.bookReservationVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)	// 메서드별 테스트용(junit4) 
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")	// 참고할 파일
@Log4j2
public class bookReservationServiceTests {
	
	
	@Setter(onMethod_ = @Autowired)
	private BookReservationService service ;
	
	
	@Test
	public void testExist() {
		assertNotNull(service);
	}

	
/*	@Test
	public void testRsRegister () {
		
		bookReservationVO vo = new bookReservationVO();
		
		vo.setR_bookname("테스트 북 네임");
		vo.setU_id("테스 유 아디");
		vo.setR_bookprice(1000);
		vo.setR_phone("010-00-00");
		vo.setR_start("2024-09-01");
		vo.setR_end("2024-09-03");
	
		service.rsRegister(vo);
		
		log.info("서비스에서 만든 객체 : " + vo);
		/*	서비스에서 만든 객체 : bookReservationVO(r_bookname=테스트 북 네임, 
														u_id=테스 유 아디, r_bookprice=1000, 
														r_phone=010-00-00, r_start=2024-09-01, 
														r_end=2024-09-03) 		
	} */
	
	@Test
	public void testRsRead() {
		
	//	bookReservationVO vo = service.rsRead("www");
		
	//	log.info("서비스에서 읽어온 결과 : " + vo);
		/* 서비스에서 읽어온 결과 : bookReservationVO(r_bookname=수정제목, 
		 * u_id=www, r_bookprice=5000, r_phone=010-777,
		 *  r_start=2001-10-02 00:00:00, r_end=2001-10-07 00:00:00)
		 */
	}
	
	
	
	
	
	
	@Test
	public void testGetList() {
		List<bookReservationVO> list = service.rsList();
		list.forEach(rs -> log.info(rs));
			
	}
	
	/* 	|-----------|----------|------------|--------|--------------------|--------------------|
		|r_bookname |u_id      |r_bookprice |r_phone |r_start             |r_end               |
		|-----------|----------|------------|--------|--------------------|--------------------|
		|수정제목       |hhh       |5000        |010-777 |2001-10-02 00:00:00 |2001-10-07 00:00:00 |
		|수정제목       |테스 유 아디77 |5000        |010-777 |2001-10-02 00:00:00 |2001-10-07 00:00:00 |
		|수정제목       |QQQ       |5000        |010-777 |2001-10-02 00:00:00 |2001-10-07 00:00:00 |
		|수정제목       |www       |5000        |010-777 |2001-10-02 00:00:00 |2001-10-07 00:00:00 |
		|-----------|----------|------------|--------|--------------------|--------------------| */
	
	
	
	@Test
	public void testDelete() {

		//bookReservationVO vo = service.rsRead("QQQ");		
		// vo.setU_id("QQQ");
		// int count = service.rsRemove(vo);
		 
	//	 log.info("삭제 결과 : " + service.rsRemove("QQQ"));
		 // 삭제 결과 : 1
		
	}
}


