package kr.co.librarylyh.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.librarylyh.domain.UserVO;
import kr.co.librarylyh.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@RequestMapping(value = "/userPage") // 사용자한테 안보임 데이터가 가는 주소
@Log4j2
@AllArgsConstructor
public class UserRestController {
	@Autowired
	private UserService service;

	// 정보수정 페이지 띄움
	@GetMapping(value = "/updateForm")
	public void updateForm() {
	}

	// 마이페이지에서 정보수정
	@PutMapping(value = "/updateForm")
	public ResponseEntity<String> saveUser(@RequestBody UserVO user, HttpSession session) {
		log.info("UserRestController-회원정보 수정 시작");
		log.info(user);
		service.update(user);
		log.info(user.getNickName());
		
		
		return new ResponseEntity<>("success", HttpStatus.OK);

	}
}
