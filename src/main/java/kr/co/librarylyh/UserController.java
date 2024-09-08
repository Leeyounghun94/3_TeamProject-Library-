package kr.co.librarylyh;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.librarylyh.domain.UserVO;
import kr.co.librarylyh.service.UserService;
import kr.co.librarylyh.utils.SessionConst;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/library/*")
@AllArgsConstructor
public class UserController {
	
		private UserService service;
		
		@GetMapping({"/home"})
		public String home() {
			
			String homePage = "/library/home";
			
			return homePage;
		}
		
		@GetMapping("/login")
		public String loginForm() {
			String loginPage = "/library/login";
			
			return loginPage;		
		}
		
		/*
		 * @PostMapping("/loginConfirm") public String loginConfirm(UserVO user,
		 * HttpSession session) { String nextPage = "/library/loginCheck";
		 * 
		 * user = service.login(user); if(user == null) { nextPage = "/library/user"; }
		 * else { session.setAttribute("loginUser", user);
		 * session.setMaxInactiveInterval(60 * 30); }
		 * 
		 * return nextPage; }
		 * 
		 * @GetMapping("/logoutForm") public String logoutForm(@CookieValue(value =
		 * "userLogin", required = false) String loginUser, HttpServletResponse
		 * response) { String nextPage = "redirect:/member/";
		 * 
		 * Cookie cookie = new Cookie("loginUser", loginUser); cookie.setMaxAge(0);
		 * 
		 * response.addCookie(cookie);
		 * 
		 * return nextPage; }
		 * 
		 * @GetMapping("/findPassword") public String findPassword() { String nextPage =
		 * "/library/findPassword"; return nextPage; }
		 * 
		 * @PostMapping("/findPassword") public String findPassword(UserVO user,
		 * HttpSession session) { String nextPage = "library/findPassword";
		 * 
		 * if(user == null) { nextPage = "library/login"; } else { nextPage =
		 * "/library/newPassword"; } return nextPage; }
		 */
		
		@GetMapping("/")
		public String homeLogin(HttpServletRequest request, Model model) {
			// 세션이 없으면 home
			HttpSession session = request.getSession(false);
			if(session == null) {
				return "home";
			}
			
			UserVO user = (UserVO)session.getAttribute(SessionConst.LOGIN_USER);
			// 세션에 회원 데이터가 없으면 home
			if(user == null) {
				return "home";
			}
			model.addAttribute("loginUser", user);
			return "login";
		}
		
		// 세션이 유지되면 로그인으로 이동
		@PostMapping("/createAccountForm")
		public void createAccountForm() {
		
		}
		
		@PostMapping("createAccountConfirm")
		public String createAccountConfirm(UserVO user) {
			String nextPage = "/library/login";
			
			service.register(user);
			
			if(user == null) {
				nextPage = "/library/login";
			} else {
				nextPage = "library/mypage";
			}
			
			return nextPage;
		}
		
		@GetMapping({"/get", "/modify"}) 
		// 이중화 작업
		public void get(@RequestParam("u_id") String u_id, Model model) {
			log.info("UserController.get | modify 메서드 실행");
			model.addAttribute("board", service.get(u_id));
			// 서비스 계층에 get메서드에 u_id 값을 넣어 주면 SQL 처리후 객체 나옴
			
		}
		
		@GetMapping("/modify")
		public String modifyForm(UserVO user, HttpSession session) {
			String nextPage = "library/mypage";
			
			user = (UserVO) session.getAttribute("loginUser");
			
			if(user == null) {
				nextPage = "library/home";
			} else {
				nextPage = "library/modify";
			}
			
			return nextPage;	
		}
		
		@PostMapping("/modify") 
		public String modify(UserVO user, RedirectAttributes rttr) {
			log.info("UserController.modify 메서드 실행");
			
			if(service.modify(user)) {
				rttr.addFlashAttribute("result", "success"); //수정 성공 시 success 메시지 보냄
			} else {
				rttr.addFlashAttribute("result", "fail"); // 수정 실패 시 fail 메시지 보냄
			}
			return "redirect:/users/home"; 
		}
		
		@PostMapping("/remove") 
		public String remove(@RequestParam("u_id") String u_id, RedirectAttributes rttr) { // 번호를 받아 delete 쿼리 실행
			log.info("UserController.remove 메서드 실행");
			
			if(service.remove(u_id)) {
				rttr.addFlashAttribute("result", "success"); //수정 성공 시 success 메시지 보냄
			} else {
				rttr.addFlashAttribute("result", "fail"); // 수정 실패 시 fail 메시지 보냄
			}
			
			return "redirect:/library";
		}
}
