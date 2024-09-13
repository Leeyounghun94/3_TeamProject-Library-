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

import kr.co.librarylyh.mapper.UserMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j2
public class UserControllerTests {
	@Setter(onMethod_ = @Autowired)
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testLogin() throws Exception {
		String result = mockMvc.perform(MockMvcRequestBuilders.post("/library/login")
				.param("id", "test555")
				.param("pw", "test55"))
				.andReturn().getModelAndView().getViewName();
		log.info("결과 : " + result);
	}
	
	@Test
	public void testJoin() throws Exception {
		String result = mockMvc.perform(MockMvcRequestBuilders.post("/library/join")
				.param("name", "컨트롤러")
				.param("birth", "990909")
				.param("phone", "010-6666-6666")
				.param("email", "mbc666@gmail.com")
				.param("id", "con123")
				.param("pw", "con123")
				.param("nickName", "controller"))
				.andReturn().getModelAndView().getViewName();
		log.info(result);
	}
	
	@Test
	public void testNickName() throws Exception {
		String result = mockMvc.perform(MockMvcRequestBuilders.post("/library/nickNameCheck")
				.param("nickName", "controller"))
				.andReturn().getModelAndView().getViewName();
		log.info(result);
		
	}
	
	@Test
	public void testModify() throws Exception {
		String result = mockMvc.perform(MockMvcRequestBuilders.post("/users/modify")
				.param("u_id", "WJ5SRX6YML")
				.param("pw", "con000")
				.param("name", "test666")
				.param("phone", "010-6666-6666")
				.param("email", "mbc666@gmail.com"))
				.andReturn().getModelAndView().getViewName();
		log.info(result);
	}
	
	@Test
	public void testRemove() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/users/remove")
				.param("u_id", "WJ5SRX6YML"))
				.andReturn().getModelAndView().getViewName();
		// getViewName : return 값을 받아서 String 처리 = resultPage
		log.info("결과 : " + resultPage); 
	}
	
	
}