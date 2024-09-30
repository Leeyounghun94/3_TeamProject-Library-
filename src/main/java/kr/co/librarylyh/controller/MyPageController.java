package kr.co.librarylyh.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.librarylyh.domain.UserVO;
import kr.co.librarylyh.service.UserService;
import lombok.extern.log4j.Log4j2;

@SessionAttributes({"user"})
@RequestMapping("/library/myPage")
@Controller
@Log4j2
public class MyPageController {
   
   private UserService service;

   // 정보수정 페이지 띄움
   @GetMapping("/updateForm")
   public void updateForm() {}

   // 마이페이지에서 비밀번호변경
   @GetMapping("/changePw")
   public void checkPwForm() {
      
   }
   
   // 비밀번호 재설정 결과 페이지
   @GetMapping("/newPw")
   public void newPw() {}
   
   // 마이페이지 비밀번호 재설정 - 데이터베이스정보 확인
   @PostMapping("/newPw")
   public String checkPwResult(RedirectAttributes rttr, Model model, UserVO user) {
	   log.info("UserController - 패스워드변경 시작");
	   UserVO loginUser = service.login(user);
       
   	if(loginUser == null) {
   		int result = 0;
   		rttr.addFlashAttribute("result", result);
   		return "redirect:/library/myPage/newPw";
   	}
   	
   	model.addAttribute("user", loginUser);
   	
       return "redirect:/library/myPage/newPw";
   }
   
   // 회원정보 삭제
   @GetMapping("/delete")
   public String userDelete(@ModelAttribute UserVO user) {
      
      
      return null;
   }

   

   
}
