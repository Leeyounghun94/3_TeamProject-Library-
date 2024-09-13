package kr.co.librarylyh.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.librarylyh.domain.UserVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j2
public class UserServiceTests {
	
	@Setter(onMethod_ = {@Autowired})
	private UserService service;
	
	@Test
	public void testExist() { // 객체 생성 유무 판단용 테스트
		log.info("테스트 : " + service);
		assertNotNull(service);
	}
	
	@Test
	public void testJoin() {
		UserVO user = new UserVO();
		
		user.setName("test00");
		user.setBirth("990121");
		user.setPhone("010-1234-4321");
		user.setEmail("library00@naver.com");
		user.setId("test000");
		user.setPw("test00");
		user.setNickName("test0_0");
		// u_id = ZRBQCC08IC
		service.join(user);
		log.info("결과 : " + user);
		//  INFO  kr.co.librarylyh.service.UserServiceTests(testJoin42) - 결과 : UserVO(u_id=ZRBQCC08IC, name=test5, birth=990201, phone=010-5555-5432, email=library5@naver.com, id=test555, pw=test555, nickName=test5_5)
	}
	
	@Test
	public void testGet() {
		
		log.info(service.get("C9QPU8YCAL"));
		/*
		|-----------|--------|-------|--------------|-------------------|--------|-----------|------------|
		|u_id       |name    |birth  |phone         |email              |id      |pw         |nickname    |
		|-----------|--------|-------|--------------|-------------------|--------|-----------|------------|
		|C9QPU8YCAL |service |990201 |010-9876-5432 |library1@naver.com |service |service123 |serviceTest |
		|-----------|--------|-------|--------------|-------------------|--------|-----------|------------|
		*/
	}
	
	@Test
	public void testModify() {
		UserVO user = service.get("ZRBQCC08IC");
		
		if(user == null) {
			log.info("찾는 객체가 없습니다.");
		}
		user.setName("test05");
		user.setBirth("990201");
		user.setPhone("010-5555-5432");
		user.setEmail("library5@naver.com");
		user.setId("test55");
		user.setPw("test55");
		user.setNickName("test5_5");
		
		service.modify(user);
		log.info("결과 : " + user);
	}
	
	@Test
	public void testRemove() {
		log.info(service.remove("C9QPU8YCAL"));
	}
	
	@Test
	public void testLogin() {
		UserVO user = new UserVO();
		
		user.setId("test555");
		user.setPw("test55");
		
		user = service.login(user);
		log.info(user);
	}
	
	@Test
	public void testIdCheck() throws Exception {
		String id = "test555";
		service.idCheck(id); // 1반환
	}
	
	@Test
	public void testNickNameCheck() throws Exception {
		String nick1 = "controller"; // 존재 O
		String nick2 = "abc";		 // 존재 X
		
		service.nickNameCheck(nick1); // 1
		service.nickNameCheck(nick2); // 0
	}
}
