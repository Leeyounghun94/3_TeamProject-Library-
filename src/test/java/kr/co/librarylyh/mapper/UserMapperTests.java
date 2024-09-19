package kr.co.librarylyh.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.librarylyh.domain.UserVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j2
@WebAppConfiguration
public class UserMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Test
	public void testJoin() {
		UserVO user = new UserVO();
		
		user.setName("두두두");
		user.setBirth("990913");
		user.setPhone("010-9877-5522");
		user.setEmail("library123@naver.com");
		user.setId("dududu123");
		user.setPw("dududu123");
		user.setNickName("듀듀듀");
		
		mapper.join(user);
		
		log.info("결과 : " + user);
		//  INFO  kr.co.librarylyh.mapper.UserMapperTests(testInsertSelectUid37) - 결과 : UserVO(u_id=M6P9FTCP6U, name=mapper, birth=990201, phone=010-9876-5432, email=library1@naver.com, id=mapper, pw=mapper123, nickName=mapperTest)
	}
		
	@Test
	public void testRead() {
		
		UserVO user = mapper.read("M6P9FTCP6U");
		log.info("정보 : "+user);
		// INFO  kr.co.librarylyh.mapper.UserMapperTests(testRead45) - 정보 : UserVO(u_id=M6P9FTCP6U, name=mapper, birth=990201, phone=010-9876-5432, email=library1@naver.com, id=mapper, pw=mapper123, nickName=mapperTest)
	}
	
	@Test
	public void testUpdate() {
		UserVO user = new UserVO();
		
		user.setU_id("M6P9FTCP6U");
		user.setName("mapper1");
		user.setPw("mapper123");
		user.setPhone("010-1111-1111");
		user.setEmail("library1@naver.com");
		
		int count = mapper.update(user);
		
		log.info("수정 결과 : " + count);
		log.info("수정 결과 : " + user);
		// INFO  kr.co.librarylyh.mapper.UserMapperTests(testUpdate61) - 수정 결과 : 1
        // INFO  kr.co.librarylyh.mapper.UserMapperTests(testUpdate62) - 수정 결과 : UserVO(u_id=M6P9FTCP6U, name=mapper1, birth=null, phone=010-1111-1111, email=library1@naver.com, id=null, pw=mapper123, nickName=null)
	}
	
	@Test
	public void testDelete() {
		log.info("삭제 테스트 : " + mapper.delete("M6P9FTCP6U"));
		// INFO  kr.co.librarylyh.mapper.UserMapperTests(testDelete69) - 삭제 테스트 : 1
	}
	
	
	@Test
	public void testLogin() {
		UserVO user = new UserVO();
		user.setId("test555");
		user.setPw("test55");
		
		user = mapper.login(user);
		
		log.info(user);
		log.info(user.getName()+ "로그인 성공");
		// INFO  kr.co.librarylyh.mapper.UserMapperTests(testLogin80) - UserVO(u_id=u_id, name=테스트3, birth=990103, phone=010-1234-9876, email=mbc3@naver.com, id=test333, pw=test333, nickName=tester3)
		// INFO  kr.co.librarylyh.mapper.UserMapperTests(testLogin81) - 테스트3로그인 성공	}
	}
	
	@Test
	public void testIdCheck() {
		
		String id1 = "test555"; // 1
		String id2 = "idCheck"; // 0
		
		mapper.idCheck(id1); // 존재하는 아이디
		mapper.idCheck(id2); // 존재하지 않는 아이디
	}
	
	@Test
	public void testNickNameCheck() {
		String nick1 = "controller"; // 존재하는 닉네임
		String nick2 = "abc"; // 존재하지 않는 닉네임
		
		mapper.nickNameCheck(nick1); // 1
		mapper.nickNameCheck(nick2); // 0
	}
	
	@Test
	public void testgetList() {
		mapper.getAdminList().forEach(user -> log.info(user));
	}
	
	@Test
	public void testAdminRegister() {
		UserVO user = new UserVO();
		
		user.setName("관리자");
		user.setBirth("020103");
		user.setEmail("admin123@gmail.com");
		user.setId("admin111");
		user.setPw("admin111");
		user.setPhone("010-1234-0987");
		user.setAuthority(1);
		
		mapper.admin(user);
		log.info(user);
	}
	
}
