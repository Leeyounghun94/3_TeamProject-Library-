package kr.co.librarylyh.controller;

import kr.co.librarylyh.domain.BookPointVO;
import kr.co.librarylyh.domain.BookRequestVO;
import kr.co.librarylyh.domain.Criteria;
import kr.co.librarylyh.domain.PageDTO;
import kr.co.librarylyh.domain.UserVO;
import kr.co.librarylyh.service.BoardService;
import kr.co.librarylyh.service.MailSendService;
import kr.co.librarylyh.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import java.util.Calendar;
import java.util.Date;

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
    private MailSendService mailService;
    
    
    
    @GetMapping("/home")
    public void home(HttpServletRequest request, Model model) throws Exception{ // 일단 개발 중단
    	
    }
    


    @GetMapping({"/agreementForm", "/login", "/join"})
    public void replace() {
        // http://localhost:80/library/join.jsp(login.jsp)
    }
    // 회원가입
    @PostMapping("/join")
    public String join(UserVO user, HttpServletResponse response) {
		log.info("회원가입 시작");
    	
    	service.join(user); // 회원가입 쿼리 실행
    	String joinUserId = user.getId();
    	boardService.userJoinPoint(joinUserId); // 회원가입시 1000포인트 증정
    	
    	String bookPointHistory = "회원가입 포인트 증가";
    	
    	BookPointVO vo = new BookPointVO();
    	
    	vo.setBookPoint(1000);
    	vo.setBookPointTotal(user.getPoint() + 1000);
    	vo.setBookPointHistory(bookPointHistory);
    	vo.setBookPointUserId(joinUserId);
    	vo.setBookPointNickName(user.getNickName());

    	
    	boardService.allPointHistory(vo); // 가입 포인트 로그 기록
    	
    	
    	
    	return "redirect:/library/login";
    } 
    
    // 이메일 인증 메서드
 	@GetMapping("/mailCheck")
 	@ResponseBody
 	public String mailCheck(String email) {
 		log.info("이메일 데이터 전송");
 		log.info("이메일 : " + email);
 		
 		return mailService.joinEmail(email);
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

    	log.info("UserController - login 시작");
        HttpSession session = request.getSession();
        UserVO loginUser = service.login(user);

        if (loginUser == null) {
            int result = 0;
            rttr.addFlashAttribute("result", result);
            return "redirect:/library/login";
        }

        // 세션 설정
        session.setAttribute("user", loginUser);

        String userId = loginUser.getId(); // 게시판 아이디 확인용
        session.setAttribute("userId", userId);
        String userNickName = loginUser.getNickName(); // 게시판 닉네임 확인용
        session.setAttribute("userNickName", userNickName);
        int userAuthority = loginUser.getAuthority(); // 관리자 권한 확인용
        session.setAttribute("userAuthority", userAuthority);
        String userU_id = loginUser.getU_id(); // 포인트 총량 가져오기
        session.setAttribute("userU_id", userU_id);

        // 유저 정보 조회
        UserVO Uvo = service.readInfo(userU_id);
        
        log.info("Uvo 값 확인 :" + Uvo);

        if (loginUser != null) {
            Date today = new Date(); // 현재 날짜를 Date로 가져오기
            log.info("today: " + today);

            Date lastVisitDate = Uvo.getLastVisitDate(); // 마지막 방문일 가져오기
            
            log.info("lastVisitDate:" + lastVisitDate);

            // "오늘 첫 방문이거나, 이전에 방문한 경우" 조건
            if (lastVisitDate == null || !isSameDay(lastVisitDate, today)) {
                // 포인트 지급 및 마지막 방문일 업데이트
                service.updateLastVisitAndPoint(Uvo); // 실질적 포인트 추가 및 날짜 업데이트

                String id = Uvo.getId(); // 로그인 시 발생한 세션: id 분리
                String nickName = Uvo.getNickName(); // 로그인 시 발생한 세션: userNickName 분리
                int userPoint = Uvo.getPoint(); // 현재 유저의 포인트 가져오기

                int bookPoint = 100; // 포인트 100 증가
                String bookPointHistory = "일일 접속 포인트 증가";

                boardService.boardAddPoint(id); // 게시글 유저 포인트 추가

                BookPointVO vo = new BookPointVO();
                vo.setBookPoint(bookPoint);
                vo.setBookPointTotal(userPoint + bookPoint); // 총 포인트는 현재 포인트 + 지급된 포인트
                vo.setBookPointHistory(bookPointHistory);
                vo.setBookPointUserId(id);
                vo.setBookPointNickName(nickName);

                boardService.allPointHistory(vo); // 포인트 기록 로그 저장

                // 마지막 방문 날짜를 오늘로 업데이트
                loginUser.setLastVisitDate(today);
            }
        }

        return "redirect:/library/home";
    }

    // 두 날짜가 같은 날인지 비교하는 메서드
    private boolean isSameDay(Date date1, Date date2) {
        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(date1); // date1 날짜를 Calendar 객체(cal1)에 저장
        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(date2); // date2 날짜를 Calendar 객체에(cal2) 저장
        return cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR) && // cal1과 cal2의 년도가 같고
               cal1.get(Calendar.DAY_OF_YEAR) == cal2.get(Calendar.DAY_OF_YEAR);
        		// (해당연도의 몇번째 날짜인지) cal1 과 cal2가 동일 할 경우 true 반환
    }
    
    //로그아웃
    @GetMapping("/logout")
    public String logoutDo(HttpServletRequest request) throws Exception{
    	log.info("UserController - logout 시작");
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
	   log.info("UserController - findIdResult 시작");
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
    	log.info("UserController - findPwResult 시작");
    	user.setId(id);
    	user.setName(name);
    	user.setEmail(email);
    	int search=service.findUserPw(user);
    	log.info("search 결과 : " + search);
    	log.info("user info : " + user);
    	model.addAttribute("search", search);
    	
    	
    	return "/library/findPwResult";
    }
    
    @GetMapping("/findPwResult")
    public void findPwResult() {}

    
    
    // 요청 도서 목록 2024 09 30
    @GetMapping("/myBookRequest") 
    public void myBookRequest(HttpServletRequest request, Model model, @Param("cri") Criteria cri, @Param("id") String id) {
    	
    	HttpSession session = request.getSession();
    	
    	id = (String) session.getAttribute("userId"); // 로그인 시 발생한 세션 : userId 따로 분리

    	model.addAttribute("r_bookList", boardService.getRequestBookList(id, cri));
    	
    	int total = service.getTotalMyRequest(id); // 총 게시물 수
    	
    	model.addAttribute("pageMaker", new PageDTO(cri, total)); // 페이징 객체 전달
    	
    }
    
    // [관리자] 요청 도서 목록 2024 09 30
    @GetMapping("/adminBookRequest") 
    public void adminBookRequest(Model model, Criteria cri) {
    	
    	
    	model.addAttribute("r_bookList", boardService.adminRequestBookList(cri));
    	int total = service.getTotalAdminRequest();
    	
    	model.addAttribute("pageMaker", new PageDTO(cri, total)); // 페이징 객체 전달
    	
    }
    
    // 나의 포인트 기록 2024 10 03
    @GetMapping("/myPagePoint") 
    public void myPagePoint(HttpServletRequest request, Model model, @Param("cri") Criteria cri, @Param("id") String id) {
    	
    	HttpSession session = request.getSession();
    	
    	id = (String) session.getAttribute("userId"); // 로그인 시 발생한 세션 : userId 따로 분리

    	model.addAttribute("bookPointList", boardService.getMyPointList(id, cri));
    	
    	int total = service.getTotalMyPoint(id); // 총 게시물 수
    	
    	model.addAttribute("pageMaker", new PageDTO(cri, total)); // 페이징 객체 전달
    	
    }
    
    // 관리자 포인트 기록 2024 10 03
    @GetMapping("/adminBookPoint") 
    public void adminBookPoint(HttpServletRequest request, Model model, @Param("cri") Criteria cri, @Param("id") String id) {
    	   	

    	model.addAttribute("bookPointList", boardService.adminPointList(cri));
    	
    	int total = service.getTotalAdminPoint(); // 총 게시물 수
    	
    	model.addAttribute("pageMaker", new PageDTO(cri, total)); // 페이징 객체 전달
    	
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
	
	// 포인트 내역 '회수 클릭시 액션' [관리자] 2024 10 03
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH }, //put 전체/ patch 일부 수정
			value="/asd/{PointRno}",consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE )
	public ResponseEntity<String> pointWithDraw(@RequestBody BookPointVO Pvo, @PathVariable("PointRno") int PointRno){
			//					   						 이미 폼(form)에 있는 값						 수정할 번호

		Pvo.setBookPointNo(PointRno); // 이미 가지고있는 객체의 rno 값을 넣음
		
		
		log.info("UserController.pointWithDraw() 메서드 실행 / 수정할 rnoPoint : " + Pvo);

		log.info("수정할 객체 : " + Pvo);

		return boardService.updateBookPoint(Pvo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK) // 200 정상
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); // 500 서버 오류
	}	


}
