package kr.co.librarylyh.controller;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

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
   @GetMapping("/changePwForm")
   public String checkPwForm() {
      return "library/myPage/changePw";  
   }
   
   // 회원정보 삭제
   @GetMapping("/delete")
   public String userDelete(@ModelAttribute UserVO user) {
      
      
      return null;
   }

   

   
}
