package kr.co.librarylyh.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.librarylyh.domain.UserVO;
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
	public String adminManage(Model model) throws Exception {
	    log.info("adminManage 페이지 진입");
	    List<UserVO> adminList = service.getUserList(1);
	    model.addAttribute("list", adminList); // 어드민 목록 가져옴
	    return "/library/admin/adminManage";
	}
	
	@GetMapping("/adminRegister")
	public String adminRegister(Model model) throws Exception {
	    log.info("adminRegister 페이지 진입");
	    List<UserVO> userList = service.getUserList(0);
	    model.addAttribute("list", userList); // 일반회원 목록 가져옴
	    return "/library/admin/adminRegister";
	}

	@GetMapping("/userList")
	public void userList()throws Exception {
		log.info("회원 목록 페이지 접속");
	}
	
	@PostMapping("/adminRegister")
	public String register(UserVO user) {
		
		user = service.get(user.getU_id());
		
		if(user.getAuthority() == 0) {
			user.setAuthority(1);
			
			return "redirect:/library/admin/adminManage";
		}
		
		return "redirect:/library/admin/adminManage";
	}
}
