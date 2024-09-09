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
				mockMvc.perform(MockMvcRequestBuilders.get("/reservation/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap());		
			
	}
		
	
	@Test
	public void testRegister() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/reservation/register")
				.param("bookname", "컨.트.롤.")
				.param("bookprice", "10000"))
				.andReturn()
				.getModelAndView()
				.getViewName();
		log.info("결과 어떰? " + resultPage);
		
	}
	
	@Test
	public void testRead() throws Exception {
		
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/reservation/read")
				.param("u_id", "QQQ"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
		
	}
	
	
	@Test
	public void testModify() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/reservation/modify")
				.param("u_id", "QQQ"))
				.andReturn()
				.getModelAndView()
				.getViewName();
		
		log.info("삭제 결과? " + resultPage);
	}
	
	
	@Test
	public void testRemove() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/reservation/remove")
				.param("u_id", "QQQ"))
				.andReturn()
				.getModelAndView()
				.getViewName();
		
		log.info("삭제 결과? " + resultPage);
	}
	
}
