package kr.co.librarylyh.controller;

import kr.co.librarylyh.domain.UserVO;
import kr.co.librarylyh.service.MailSendService;
import kr.co.librarylyh.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
@Controller
@Log4j2
@RequestMapping("/library/*")
@AllArgsConstructor
public class UserController {
    @Autowired
	private UserService service;
   
    @Autowired
    private MailSendService mailService;
    

    @GetMapping({"/agreementForm", "/login", "/join"})
    public void replace() {
        // http://localhost:80/library/join.jsp(login.jsp)
    }
    // 회원가입
    @PostMapping("/join")
    public String join(UserVO user, HttpServletResponse response) {
		log.info("회원가입 시작");
    	
    	service.join(user); // 회원가입 쿼리 실행
    	
    	return "redirect:/library/login";
    } 
    
 // 이메일 인증 메서드
 	@GetMapping("/mailCheck")
 	@ResponseBody
 	public String mailCheck(String email) {
 		log.info("이메일 데이터 전송");
 		log.info("이메일 : " + email);
 		
 		return mailService.joinEmail(email);
 	}
    
    // 아이디 중복 검사
    @PostMapping("/idCheck") 
    @ResponseBody
    public String id_check(String id) throws Exception{
    	log.info("id_check 메서드 진입");
    	
    	int result = service.idCheck(id);
    	log.info("결과 : " + result);
    	
    	if(result != 0) {
    		return "fail"; // 중복 아이디 존재
    	} else {
    		return "success"; // 중복 아이디 X
    	}
    }
    
 // 닉네임 중복 검사
    @PostMapping("/nickNameCheck") 
    @ResponseBody
    public String nickName_check(String nickName) throws Exception{
    	log.info("nickNameCheck 메서드 진입");
    	
    	int result = service.nickNameCheck(nickName);
    	log.info("결과 : " + result);
    	
    	if(result != 0) {
    		return "fail"; // 중복 아이디 존재
    	} else {
    		return "success"; // 중복 아이디 X
    	}
    }

    // 로그인 
    @PostMapping("/login")
    public String login(HttpServletRequest request, UserVO user, RedirectAttributes rttr) throws Exception {
    	log.info("UserController - login 시작");
    	HttpSession session = request.getSession();
    	UserVO loginUser = service.login(user);
        
    	if(loginUser == null) {
    		int result = 0;
    		rttr.addFlashAttribute("result", result);
    		return "redirect:/library/login";
    	}
    	
    	session.setAttribute("user", loginUser);
    	
        return "redirect:/library/home";
    }
    
    //로그아웃
    @GetMapping("/logout")
    public String logoutDo(HttpServletRequest request) throws Exception{
    	log.info("UserController - logout 시작");
    	HttpSession session = request.getSession();
    	
    	session.invalidate();
    	
    	return "redirect:/library/home";
    }
    
    // 마이페이지 이동
    @GetMapping("/myPage")
    public String myPage() {
    	return "/library/myPage";
    }
    
    // 아이디 찾기 페이지 이동
    @GetMapping("/findId")
    public String findId() {return "/library/findId";}
    
    // 아이디 찾기 결과 페이지 이동
    @GetMapping("/findIdResult")
    public String findIdResult() {return "/library/findIdResult";}
    
   @PostMapping("/findIdResult")
    public String searchId(HttpServletRequest request, Model model, UserVO user,
    						@RequestParam String name,
    						@RequestParam String email) {
	   log.info("UserController - findIdResult 시작");
    	user.setName(name);
    	user.setEmail(email);
    	
    	UserVO findId = service.findUserId(user);
    	
    	model.addAttribute("findId", findId);
    	
    	log.info("test" + findId);
    	
    	return "library/findIdResult";
    } 
    
    // 비밀번호 찾기
    @GetMapping("/findPw")
    public String findPw() { return "/library/findPw";}
 
    @PostMapping("/findPwResult")
    public String searchPw(HttpServletRequest request ,Model model, UserVO user,
    						@RequestParam String id,
    						@RequestParam String name,
    						@RequestParam String email) {
    	log.info("UserController - findPwResult 시작");
    	user.setId(id);
    	user.setName(name);
    	user.setEmail(email);
    	int search=service.findUserPw(user);
 	
    	model.addAttribute("search", search);
    	
    	
    	return "/library/findPwResult";
    }
    
    @GetMapping("/findPwResult")
    public void findPwResult() {}
   
    
    
} 
