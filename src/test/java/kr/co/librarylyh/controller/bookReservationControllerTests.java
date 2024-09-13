package kr.co.librarylyh.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)	// 메서드별 테스트용(junit4) 
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})	// 참고할 파일
@Log4j2
@WebAppConfiguration

public class bookReservationControllerTests {

	
	@Setter(onMethod_ = @Autowired)
	private WebApplicationContext ctx ;
	
	private MockMvc mockMvc ;
	
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception {
		
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/library/reservation/BookReservation"))
				.andReturn()
				.getModelAndView()
				.getModelMap());		
			
	}
/*	|-----------|----------|------------|----------|--------------------|--------------------|
|r_bookname |u_id      |r_bookprice |r_phone   |r_start             |r_end               |
|-----------|----------|------------|----------|--------------------|--------------------|
|수정제목       |hhh       |5000        |010-777   |2001-10-02 00:00:00 |2001-10-07 00:00:00 |
|수정제목       |테스 유 아디77 |5000        |010-777   |2001-10-02 00:00:00 |2001-10-07 00:00:00 |
|수정제목       |www       |5000        |010-777   |2001-10-02 00:00:00 |2001-10-07 00:00:00 |
|테스트 북 네임   |테스 유 아디   |1000        |010-00-00 |2024-09-01 00:00:00 |2024-09-03 00:00:00 |
|-----------|----------|------------|----------|--------------------|--------------------| */	
		
	
	@Test
	public void testRegister() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/library/reservation/RsCreate")
				.param("r_bookname", "컨.트.롤.")
				.param("u_id", "개새")
				.param("r_bookprice", "10000")
				.param("r_phone", "456-789-123")
				.param("r_start", "1999-10-01")
				.param("r_end", "2010-10-01"))
				.andReturn()
				.getModelAndView()
				.getViewName();
		log.info("결과 어떰? " + resultPage);
	/* 결과 어떰? redirect:/reservation/BookReservation */	
	}
	
	@Test
	public void testRead() throws Exception {
		
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/library/reservation/read")
				.param("u_id", "시발"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
		
	}
	
	
/*	@Test
	public void testModify() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/reservation/modify")
				.param("u_id", "QQQ"))
				.andReturn()
				.getModelAndView()
				.getViewName();
		
		log.info("삭제 결과? " + resultPage);
	} */
	
	
	@Test
	public void testRemove() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/library/reservation/BookReservation")
				.param("u_id", "테스 유 아디"))
				.andReturn()
				.getModelAndView()
				.getViewName();
		
		log.info("삭제 결과? " + resultPage);
	}
	
}
