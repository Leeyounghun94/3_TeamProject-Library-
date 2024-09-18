package kr.co.librarylyh.mapper;

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
public class bookReservationMapperTests {
	
	
	@Setter(onMethod_ =  @Autowired)
	private bookReservationMapper mapper ;
	
//	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	
	
	@Test
	public void testInsert() {
		
		bookReservationVO vo = new bookReservationVO();
		
		vo.setIsbn13(01010101010L);
		vo.setU_id("아임매퍼");
		vo.setRsStartDay("2024-08-01");
		vo.setRsEndDay("2024-08-03");
		
		mapper.rsInsert(vo);
		
		log.info("입력된 객체 : " + vo);
/* 입력된 객체 : bookReservationVO(Date=null, u_id=아이엠아디, isbn13=558482096648, 
 * 				 rsStartDay=2024-09-01, rsEndDay=2024-09-03, rsNum=null)		
 */
	} 

	@Test
	public void testList() {
		
		mapper.rsList().forEach(library -> log.info(library));

		
/*		|---------|--------------|------|--------------------|--------------------|
		|u_id     |isbn13        |rsnum |rsstartday          |rsendday            |
		|---------|--------------|------|--------------------|--------------------|
		|ZR2411C  |4567894567894 |27    |2024-09-01 00:00:00 |2024-09-03 00:00:00 |
		|QQQ123   |123123123     |28    |2024-09-01 00:00:00 |2024-09-03 00:00:00 |
		|qwer789  |789789789     |29    |2024-09-01 00:00:00 |2024-09-03 00:00:00 |
		|q1w2e3r  |9517534682    |30    |2024-09-01 00:00:00 |2024-09-03 00:00:00 |
		|k4k5k6k7 |9876543210    |31    |2024-09-01 00:00:00 |2024-09-03 00:00:00 |
		|w8w8w8w  |10203040      |32    |2024-09-01 00:00:00 |2024-09-03 00:00:00 |
		|아이엠아디    |558482096648  |33    |2024-09-01 00:00:00 |2024-09-03 00:00:00 |
		|---------|--------------|------|--------------------|--------------------| */
	}
	
	
	@Test
	public void testRead() {
		
		bookReservationVO vo = mapper.rsRead(30L);
		
		log.info("Read 한 값 : " + vo);
		
	/*	|--------|-----------|------|--------------------|--------------------|
		|u_id    |isbn13     |rsnum |rsstartday          |rsendday            |
		|--------|-----------|------|--------------------|--------------------|
		|q1w2e3r |9517534682 |30    |2024-09-01 00:00:00 |2024-09-03 00:00:00 |
		|--------|-----------|------|--------------------|--------------------| */
	}
	
	@Test
	public void testUpdate() {
		
		bookReservationVO vo = new bookReservationVO();
		
		vo.setU_id("www");
		vo.setRsNum(29L);
		vo.setIsbn13(789789789L);			
		vo.setRsStartDay("2024-09-09");
		vo.setRsEndDay("2024-09-10");
		
		log.info("수정된 결과 뭐임 ?" + vo);
/*  수정된 결과 뭐임 ?  bookReservationVO(Date=null, u_id=null, isbn13=789789789, 
 * 						rsStartDay=2024-09-09, rsEndDay=2024-09-10, rsNum=29)		- 1 try
 * 
 *  수정된 결과 뭐임 ?	bookReservationVO(Date=null, u_id=www, isbn13=789789789,
 *  					rsStartDay=2024-09-09, rsEndDay=2024-09-10, rsNum=29)		- 2 try
 */
	
		
	}
	
	@Test
	public void testDelete() {
			
		log.info("삭제한 결과 : " + mapper.rsDelete(34L));
		/* 삭제한 결과 : 1 (33L) - 1 try
		 * 삭제한 결과 : 1 (34L) - 2 try
											*/
	}
	
	
	
	
}
