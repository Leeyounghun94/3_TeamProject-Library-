package kr.co.librarylyh.controller;

import kr.co.librarylyh.domain.BookRequestVO;
import kr.co.librarylyh.domain.UserVO;
import kr.co.librarylyh.service.BoardService;
import kr.co.librarylyh.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    private BoardService boardService;
    
    
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
    	
    	String userId = loginUser.getId();//// add_게시판 아이디 확인용 2024 09 23
    	session.setAttribute("userId", userId);/// add_게시판 아이디 확인용  2024 09 23
    	String userNickName = loginUser.getNickName(); // add_ 게시판 닉네임 확인용 2024 09 23
    	session.setAttribute("userNickName", userNickName); // add_ 게시판 닉네임 확인용 2024 09 23
    	int userAuthority = loginUser.getAuthority(); // add_ 게시판 관리자 권한 확인(관리자 답글용) 2024 09 24
    	session.setAttribute("userAuthority", userAuthority); // add_ 게시판 관리자 권한 확인(관리자 답글용) 2024 09 24
    	
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
    
    // 요청 도서 목록 2024 09 30
    @GetMapping("/myBookRequest") 
    public void myBookRequest(HttpServletRequest request, Model model) {
    	
    	HttpSession session = request.getSession();
    	
    	String id = (String) session.getAttribute("userId"); // 로그인 시 발생한 세션 : userId 따로 분리

    	model.addAttribute("r_bookList", boardService.getRequestBookList(id));
    	
    }
    
    // 요청 도서 목록 2024 10 30
    @GetMapping("/adminBookRequest") 
    public void adminBookRequest(Model model) {
    	

    	model.addAttribute("r_bookList", boardService.adminRequestBookList());
    }
    
	// 요청 도서 목록 수정 2024 10 01
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH }, //put 전체/ patch 일부 수정
			value="/{r_bookBno}",consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE )
	public ResponseEntity<String> editRequestBook(@RequestBody BookRequestVO Rvo, @PathVariable("r_bookBno") Long r_bookBno){
			//					   이미 폼(form)에 있는 값			 수정할 번호

		Rvo.setR_bookBno(r_bookBno); // 이미 가지고있는 객체의 rno 값을 넣음
		
		
		log.info("UserController.editRequestBook() 메서드 실행 / 수정할 r_bookBno : " + Rvo);

		log.info("수정할 객체 : " + Rvo);

		return boardService.updateRequestBook(Rvo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK) // 200 정상
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); // 500 서버 오류
	}	
	
	// 요청 도서 목록 삭제 2024 10 01
	@DeleteMapping(value="/{r_bookBno}", produces = {MediaType.TEXT_PLAIN_VALUE}) // JSON으로 나올 필요가 없음
	public ResponseEntity<String> removeRequestBook(@PathVariable("r_bookBno") Long r_bookBno){
		
		log.info("ReplyController.remove() 메서드 실행 / 삭제할 rno : " + r_bookBno);
		
		return boardService.deleteRequestBook(r_bookBno) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK) // 200 정상
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); // 500 서버 오류
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
