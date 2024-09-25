package kr.co.librarylyh.controller;

import kr.co.librarylyh.domain.UserVO;
import kr.co.librarylyh.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

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
   


    @GetMapping({"/agreementForm", "/login", "/join"})
    public void replace() {
        // http://localhost:80/library/join.jsp(login.jsp)
    }
    // 회원가입
    @PostMapping("/join")
    public String join(UserVO user, HttpServletResponse response) {
		/* log.info("회원가입 테스트"); */
    	
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
    	
        return "redirect:/library/home";
    }
    
    //로그아웃
    @GetMapping("/logout")
    public String logoutDo(HttpServletRequest request) throws Exception{
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
	   log.info("lkj!@#!@#!@3"+email);
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
    	user.setId(id);
    	user.setName(name);
    	user.setEmail(email);
    	int search=service.findUserPw(user);
    	
    	if(search == 0) {
    		model.addAttribute("msg", "기입된 정보가 잘못되었습니다. 다시 입력해주세요.");
    	}
    	
    	UserVO newPw = service.pwUpdate(user);
    	
    	model.addAttribute("newPw", newPw);
    	
    	return "library/findPwResult";
    }
    
    @GetMapping("/findPwResult")
    public void findPwResult() {}
   
    
    /*@GetMapping("updateForm")
    public String updateForm(@RequestParam(value="u_id", required=false) String u_id, UserVO user, Model model) {
    	
    	if(u_id != null) {
    		service.get(u_id);
    		log.info("!@@#$%#$!"+u_id);
    		return "redirect:/library/myPage/updateForm";
    	}
    	return "/library/myPage/";
    } */
    
    /*@PostMapping("updateForm")
    public String update(HttpServletRequest request ,Model model, UserVO user,
    						@RequestParam String u_id,
    						@RequestParam String name,
    						@RequestParam String phone,
    						@RequestParam String email) {
    	user.setU_id(u_id);
    	UserVO userInfo = service.get(u_id);
    	
    	if(userInfo == null) {
    		return "/library/myPage";
    	}
    	user.setName(name);
    	user.setPhone(phone);
    	user.setEmail(email);
    	UserVO update = user;
    	service.updateUser(update);
    	
    	return "/library/myPage";
    	
    } */
    
    
    
} 
