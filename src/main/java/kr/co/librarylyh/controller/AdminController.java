package kr.co.librarylyh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/library/admin/*")
@AllArgsConstructor
public class AdminController {
	
	@GetMapping("/main")
	public void adminMain() throws Exception{
		log.info("관리자 페이지 이동");
	}

}
