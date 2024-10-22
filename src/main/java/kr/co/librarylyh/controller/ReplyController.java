package kr.co.librarylyh.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.librarylyh.domain.BookPointVO;
import kr.co.librarylyh.domain.Criteria;
import kr.co.librarylyh.domain.ReplyPageDTO;
import kr.co.librarylyh.domain.ReplyVO;
import kr.co.librarylyh.domain.UserVO;
import kr.co.librarylyh.service.BoardService;
import kr.co.librarylyh.service.ReplyService;
import kr.co.librarylyh.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController // Rest로 응답함 -> view-jsp가 아닌 json, xml로 나옴
@RequestMapping("/replies") // http://localhost:80/replies/???
@Log4j2
@AllArgsConstructor // new ReplyController(ReplyService);
public class ReplyController { // Rest 방식의 컨트롤러로 구현 + ajax 처리 함

	// private BoardService bService; 나중에 응용해 보세요.
	private ReplyService service;
	private BoardService boardService; // 댓글 포인트 적용 2024 10 02 
	private UserService userService;
	
	// http://localhost:80/replies/new
	@PostMapping(value="/new", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE ) //입력값은 json으로
	public ResponseEntity<String> create(@RequestBody ReplyVO vo, HttpServletRequest request) {
		// 리턴은 200이나 500으로 처리 된다.
		log.info("ReplyVO 객체 json 입력 값 : " + vo); // 파라미터로 넘어온 값 출력 테스트

		int insertCount = service.register(vo); // sql 처리 후에 결과값이 1 | 0 이 나옴

		log.info("서비스 + 매퍼 처리 결과 : " + insertCount);
		
    	HttpSession session = request.getSession();
    	
    	// 댓글 작성시 포인트 증가 및 로그기록 2024 10 02
    	
    	String userU_id = (String) session.getAttribute("userU_id"); // 로그인 시 발생한 세션 : userU_id 따로 분리 2024 10 02
    	
    	UserVO Uvo = userService.read(userU_id);
    	
    	String id = Uvo.getId();// 로그인 시 발생한 세션 : id 따로 분리 2024 10 02
    	
    	String nickName = Uvo.getNickName();// 로그인 시 발생한 세션 : userNickName 따로 분리 2024 10 02

    	int userPoint = Uvo.getPoint() + 5; // 로그인 시 발생한 세션 : point 따로 분리 2024 10 02
    	// 포인트 총량을 세션으로 가져오니 최신화가 안됨, 그래서 포인트를 가져오는 sql 문을 작성하기로함
		int bookPoint = 5; // 포인트 5 증가
		
		String bookPointHistory = "댓글 작성 포인트 증가";
		
		service.replyAddPoint(nickName); // 댓글 유저 포인트 추가 2024 10 02
    	
    	BookPointVO Bvo = new BookPointVO();
    	
    	Bvo.setBookPoint(bookPoint);
    	Bvo.setBookPointTotal(userPoint);
    	Bvo.setBookPointHistory(bookPointHistory);
    	Bvo.setBookPointUserId(id);
    	Bvo.setBookPointNickName(nickName);
    	
    	boardService.allPointHistory(Bvo); // 댓글 작성 로그 기록
    	

		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) // 200 정상
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); // 500 서버 오류
		// 삼항 연산자나 if로 리턴을 할때 정상 처리인지 오류 값인지를 전달 해야 한다.
	}
	
	
	//http://localhost:80//replies/4
	@GetMapping(value="/{rno}", produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno){
		log.info("ReplyController.get() 메서드 실행 / 찾을 rno : " + rno);
		
		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);

	}
	
	@DeleteMapping(value="/{rno}", produces = {MediaType.TEXT_PLAIN_VALUE}) // JSON으로 나올 필요가 없음
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno){
		
		log.info("ReplyController.remove() 메서드 실행 / 삭제할 rno : " + rno);
		
		return service.remove(rno) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK) // 200 정상
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); // 500 서버 오류
	}
	
	//http://localhost:80//replies/4
	//RequestMehod.PUT -> @PutMapping (객체 전체 필드 를 수정한다.)
	//RequestMehod.PATCH -> @PatchMapping (객체의 일부 필드(부분)수정 한다.)
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH }, //put 전체/ patch 일부 수정
					value="/{rno}",consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE )
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("rno") Long rno){
		//					   			 이미 폼(form)에 있는 값			 수정할 번호
		
		vo.setRno(rno); // 이미 가지고있는 객체의 rno 값을 넣음
		
		log.info("ReplyController.modify() 메서드 실행 / 수정할 rno : " + rno);
		
		log.info("수정할 객체 : " + vo);
		
		return service.modify(vo) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK) // 200 정상
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); // 500 서버 오류
	}
	
	@GetMapping(value = "/pages/{bno}/{page}", 
			produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("bno") Long bno) {

		Criteria cri = new Criteria(page, 10);
		
		log.info("get Reply List bno: " + bno);

		log.info("cri:" + cri);

		return new ResponseEntity<>(service.getListPage(cri, bno), HttpStatus.OK);
	}

	
	
	
	

}
