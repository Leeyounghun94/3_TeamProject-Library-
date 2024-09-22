package kr.co.librarylyh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;


import kr.co.librarylyh.service.UserService;

@SessionAttributes({"user"})
@RequestMapping("/library/myPage")
@Controller
public class MyPageController {
	
	private UserService service;
	
	@GetMapping("/changePw")
	public void changePw() {}
	
	@GetMapping("/updateForm")
	public void updateForm() {}
	


	
}
