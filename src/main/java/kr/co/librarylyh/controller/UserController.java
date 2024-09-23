package kr.co.librarylyh.controller;

import kr.co.librarylyh.domain.UserVO;
import kr.co.librarylyh.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


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
    
    
    @GetMapping("/home")
    public void home() {
    }
    
    
    @GetMapping({"/reservation/BookReservation", "/reservation/StudyReservation", "/reservation/RsCreate"})
    public void reservationInfo() {
    	
    }

    @GetMapping({"/agreementForm", "/login", "/join"})
    public void replace() {
        // http://localhost:80/library/join.jsp(login.jsp)
    }
    // 회원가입
    @PostMapping("/join")
    public String join(UserVO user, HttpServletResponse response) {
		log.info("회원가입 테스트");
    	
    	service.join(user); // 회원가입 쿼리 실행
    	
    	return "redirect:/library/login";
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
        
    	HttpSession session = request.getSession();
    	UserVO loginUser = service.login(user);
        
    	if(loginUser == null) {
    		int result = 0;
    		rttr.addFlashAttribute("result", result);
    		return "redirect:/library/login";
    	}
    	
    	session.setAttribute("user", loginUser);
    	
    	String userId = loginUser.getId();//// add
    	session.setAttribute("userId", userId);/// add
    	
        return "redirect:/library/home";
    }
    
    //로그아웃
    @GetMapping("/logout")
    public String logoutDo(HttpServletRequest request) throws Exception{
    	HttpSession session = request.getSession();
    	
    	session.invalidate();
    	
    	return "redirect:/library/home";
    }
    
    @GetMapping("/myPage")
    public String myPage() {
    	return "/library/myPage";
    }

    
    @GetMapping("/modify")
    public void modifyForm(HttpSession session, ModelMap map) {
    	session.removeAttribute("msg");
    	String id = (String) session.getAttribute("loginUser");
    	
    	UserVO vo = service.get(id);
    	map.addAttribute("vo", vo);
    }
    
    @PostMapping("/modify")
    public String modify(UserVO vo) {
    	service.modify(vo);
    	return "redirect:/library/user/myPage";
    }
}
