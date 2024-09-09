package kr.co.librarylyh.mapper;

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
public class bookReservationMapperTests {
	
	
	@Setter(onMethod_ =  @Autowired)
	private bookReservationMapper mapper ;
	
//	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	
	
	@Test
	public void testInsert() {
		
		bookReservationVO vo = new bookReservationVO();
		
		vo.setR_bookname("테스트 북 네임");
		vo.setU_id("테스 유 아디77");
		vo.setR_bookprice(1000);
		vo.setR_phone("010-00-00");
		vo.setR_start("2024-09-01");
		vo.setR_end("2024-09-03");
		
		
		mapper.rsInsert(vo);
		
		log.info("입력된 객체 : " + vo);
		
	}

	@Test
	public void testSelect() {
		
		List<bookReservationVO> vo = mapper.rsList();
		
		log.info(vo);
		log.info("select 결과 : " + vo);
		
		/*  |-----------|----------|------------|------------|--------------------|--------------------|
			|r_bookname |u_id      |r_bookprice |r_phone     |r_start             |r_end               |
			|-----------|----------|------------|------------|--------------------|--------------------|
			|yyy        |hhh       |1000        |010-111-111 |2024-09-01 00:00:00 |2024-09-03 00:00:00 |
			|테스트 북 네임   |테스 유 아디77 |1000        |010-00-00   |2024-09-01 00:00:00 |2024-09-03 00:00:00 |
			|yyy        |QQQ       |1000        |010-111-111 |2024-09-01 00:00:00 |2024-09-03 00:00:00 |
			|yyy        |www       |1000        |010-111-111 |2024-09-01 00:00:00 |2024-09-03 00:00:00 |
			|yyy        |eee       |1000        |010-111-111 |2024-09-01 00:00:00 |2024-09-03 00:00:00 |
			|-----------|----------|------------|------------|--------------------|--------------------| */
		
	}
	
	
	@Test
	public void testRsInsertSelectKey() {
		
		bookReservationVO vo = new bookReservationVO();
		vo.setU_id("www");
		
		mapper.RsInsertSelectKey(vo);
		
		log.info(vo);
	}
	
	@Test
	public void testRead() {
		
		bookReservationVO vo = mapper.rsRead("www");
		
		log.info("메퍼에서 읽어온 결과 : " + vo);
		/* 메퍼에서 읽어온 결과 : bookReservationVO(r_bookname=수정제목, 
							u_id=www, r_bookprice=5000, 
							r_phone=010-777, r_start=2001-10-02 00:00:00, 
							r_end=2001-10-07 00:00:00) */		
	}
	
	
	@Test
	public void testUpdate() {
		
		bookReservationVO vo = new bookReservationVO();
		
		vo.setU_id("QQQ");
		vo.setR_bookname("정수정책");
		vo.setR_bookprice(1000);
		vo.setR_phone("010-789-788");
		vo.setR_start("2001/10/05");
		vo.setR_end("2001/10/14");
			
		int count = mapper.rsUpdate(vo);
		log.info(count + " : 수정 완료");
		//  1 : 수정 완료
	}
	
	
	
	@Test
	public void testDelete() {
		
		//bookReservationVO vo = new bookReservationVO();		
		//vo.setU_id("eee");
		//int count = mapper.rsDelete("eee");
		
		log.info("삭제한 결과 : " + mapper.rsDelete("eee"));
		//삭제한 결과 : 1
	}
	
	
	
	
}
