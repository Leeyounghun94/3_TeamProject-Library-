package kr.co.librarylyh.utils;

import java.util.Arrays;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

@Component // 스프링 빈으로 자동 등록
public class SessionManager {
	private static final String SESSION_COOKIE_NAME="mySessionId";
	private Map<String, Object> sessionStore = new ConcurrentHashMap<>();
	
	// 세션 생성
	public void createSession(Object value, HttpServletResponse response) {
		// 세션 id 를 생성하고, 값을 세션에 저장
		
		String sessionId = UUID.randomUUID().toString();
		sessionStore.put(sessionId, value);
		Cookie mySessionCookie = new Cookie(SESSION_COOKIE_NAME, sessionId);
		response.addCookie(mySessionCookie);
	}
	
	//세션 조회
	public Object getSession(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals(SESSION_COOKIE_NAME)) {
				return sessionStore.get(cookie.getValue());
			}
		}
		return cookies;
	}
	
	// 세션 만료
	public void expire(HttpServletRequest request) {
		Cookie sessionCookie = findCookie(request, SESSION_COOKIE_NAME);
		if(sessionCookie != null) {
			sessionStore.remove(sessionCookie.getValue());
		}
	}
	
	private Cookie findCookie(HttpServletRequest request, String cookieName) {
		if(request.getCookies() == null) {
			return null;
		}
		return Arrays.stream(request.getCookies())
				.filter(cookie -> cookie.getName().equals(cookieName))
				.findAny()
				.orElse(null);
	}
}
