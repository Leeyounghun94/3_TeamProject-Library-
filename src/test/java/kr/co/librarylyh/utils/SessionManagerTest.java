package kr.co.librarylyh.utils;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.librarylyh.domain.UserVO;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j2
public class SessionManagerTest {
	
	SessionManager sessionManager = new SessionManager();
	
	@Test
	void sessionTest() {
		// 세션 생성
		MockHttpServletResponse response = new MockHttpServletResponse();
		UserVO user = new UserVO();
		sessionManager.createSession(user, response);
		
		// 요청에 응답 쿠키 저장
		MockHttpServletRequest request = new MockHttpServletRequest();
		request.setCookies(response.getCookies());
		
		// 세션 조회
		Object result = sessionManager.getSession(request);
		assertThat(result).isEqualTo(user);
		
		// 세션 만료
		sessionManager.expire(request);
		Object expired = sessionManager.getSession(request);
		assertThat(expired).isNull();
	}
}
