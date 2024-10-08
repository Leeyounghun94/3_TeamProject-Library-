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

	
	@Test
	public void testRsRegister () {
		
		bookReservationVO vo = new bookReservationVO();
		
		vo.setIsbn13(7777777L);
		vo.setU_id("칠성사이다");
		vo.setRsStartDay("2024-09-13");
		vo.setRsEndDay("2024-09-14");
		vo.setRsNum(77L);
		
		service.rsRegister(vo);
		
		
		log.info("서비스에서 만든 객체 : " + vo);
		
	}
	
	@Test
	public void testRsRead() {
		
		log.info(service.rsRead(30L));
		
/*		|--------|-----------|------|--------------------|--------------------|
		|u_id    |isbn13     |rsnum |rsstartday          |rsendday            |
		|--------|-----------|------|--------------------|--------------------|
		|q1w2e3r |9517534682 |30    |2024-09-01 00:00:00 |2024-09-03 00:00:00 |
		|--------|-----------|------|--------------------|--------------------| */
		

	}
	
	
	@Test
	public void testGetList() {
		
		
		service.rsList().forEach(library -> log.info(library));
			
	}
	
/*	|---------|-------------|------|--------------------|--------------------|
	|u_id     |isbn13       |rsnum |rsstartday          |rsendday            |
	|---------|-------------|------|--------------------|--------------------|
	|아이엠아디    |558482096648 |35    |2024-09-01 00:00:00 |2024-09-03 00:00:00 |
	|QQQ123   |123123123    |28    |2024-09-01 00:00:00 |2024-09-03 00:00:00 |
	|qwer789  |789789789    |29    |2024-09-01 00:00:00 |2024-09-03 00:00:00 |
	|q1w2e3r  |9517534682   |30    |2024-09-01 00:00:00 |2024-09-03 00:00:00 |
	|k4k5k6k7 |9876543210   |31    |2024-09-01 00:00:00 |2024-09-03 00:00:00 |
	|w8w8w8w  |10203040     |32    |2024-09-09 00:00:00 |2024-09-10 00:00:00 |
	|아이엠아디    |558482096648 |36    |2024-09-01 00:00:00 |2024-09-03 00:00:00 |
	|아임매퍼     |136348168    |37    |2024-08-01 00:00:00 |2024-08-03 00:00:00 |
	|---------|-------------|------|--------------------|--------------------|	*/
	
	
	@Test
	public void testModify() {
	
		bookReservationVO vo = service.rsRead(36L);
		
		if(vo == null ) {
			log.info("찾는 객체가 없습니다.");
			
		}else {
			vo.setU_id("섭스 수정 ID");
			vo.setRsNum(91L);
			vo.setIsbn13(11111L);
			vo.setRsStartDay("2024-09-13");
			vo.setRsEndDay("2024-09-16");
			
			log.info("섭스에서 수정한 결과 : " + vo);
			
	/*		섭스에서 수정한 결과 : bookReservationVO(Date=null, u_id=섭스 수정 ID, isbn13=11111, 
													rsStartDay=2024-09-13, rsEndDay=2024-09-16, rsNum=91) */
		}
	
	}

	
	@Test
	public void testRemove() {
		
		log.info("삭제한 결과 : " + service.rsRemove(40L));
		
		// 삭제한 결과 : true
	
	
	}
	
	

}


