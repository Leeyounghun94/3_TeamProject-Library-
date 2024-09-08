package kr.co.librarylyh;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping("/library/*")
public class SessionInfoController {
	
	@GetMapping("/session-info")
	public String sessionInfo(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		
		if(session == null) {
			return "세션이 없습니다.";
		}
		System.out.println(session.getId()+ ", " + session.getAttribute("user"));
		
		session.getAttributeNames().asIterator()
			.forEachRemaining(name -> log.info("session name={}, value={}", name, session.getAttribute(name)));
		
		log.info("sessionId={}", session.getId());
		log.info("getMaxInactiveInterval={}", session.getMaxInactiveInterval());
		log.info("creationTime={}", new Date(session.getCreationTime()));
		log.info("lastAccessedTime={}", new Date(session.getLastAccessedTime()));
		log.info("isNew={}", session.isNew());
		
		return "세션출력";
	}
}
