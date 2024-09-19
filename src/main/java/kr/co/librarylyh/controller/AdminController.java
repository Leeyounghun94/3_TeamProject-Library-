package kr.co.librarylyh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.librarylyh.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/library/admin/*")
@AllArgsConstructor
public class AdminController {
	
	UserService service;
	
	@GetMapping("/main")
	public void adminMain() throws Exception{
		log.info("관리자 페이지 이동");
	}
	
	@GetMapping("/booksManage")
	public void booksManage()throws Exception {
		log.info("도서 등록 페이지 접속");
	}
	
	@GetMapping("/booksList")
	public void booksList()throws Exception {
		log.info("도서 목록 페이지 접속");
	}

	@GetMapping("/adminManage")
	public void adminManage(Model model)throws Exception {
		
		model.addAttribute("list", service.getUserList()); // 어드민 목록 가져옴
		
	}
	
	@GetMapping("/adminRegister") // 관리자 등록
	public void adminManage()throws Exception {
	}

	@GetMapping("/userList")
	public void userList()throws Exception {
		log.info("회원 목록 페이지 접속");
	}
	
	@PostMapping("/adminManage")
	public void adminManagePost() throws Exception {
		service.getUserList();
	}
	
}
