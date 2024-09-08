package kr.co.librarylyh;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.librarylyh.domain.UserVO;
import kr.co.librarylyh.service.UserService;
import kr.co.librarylyh.utils.SessionConst;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/library/*")
@AllArgsConstructor
public class LoginController {
	
	private UserService service;
	
	@PostMapping("/login")
	public String login(@Validated @ModelAttribute UserVO user, BindingResult result, HttpServletRequest request) {
		if(result.hasErrors()) {
			return "/library/login";
		}
		user = service.login(user);
		if(user == null) {
			result.reject("로그인 실패", "아이디 또는 비밀번호가 맞지 않습니다.");
			return "/library/login";
		}
		
		// 로그인 성공 처리
		// 세션이 있으면 있는 세션 반환, 없으면 신규 세션을 생성
		HttpSession session = request.getSession();
		
		session.setAttribute(SessionConst.LOGIN_USER, user); 
		
		return "redirect:/library/home";
	}
	
	@PostMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session != null) {
			session.invalidate();
		}
		return "redirect:/library/login";
	}

}
