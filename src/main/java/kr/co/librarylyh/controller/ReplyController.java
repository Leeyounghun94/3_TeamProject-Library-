package kr.co.librarylyh.controller;

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

import kr.co.librarylyh.domain.Criteria;
import kr.co.librarylyh.domain.ReplyPageDTO;
import kr.co.librarylyh.domain.ReplyVO;
import kr.co.librarylyh.service.ReplyService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController // Rest로 응답함 -> view-jsp가 아닌 json, xml로 나옴
@RequestMapping("/replies") // http://localhost:80/replies/???
@Log4j2
@AllArgsConstructor // new ReplyController(ReplyService);
public class ReplyController { // Rest 방식의 컨트롤러로 구현 + ajax 처리 함

	// private BoardService bService; 나중에 응용해 보세요.
	private ReplyService service;

	// http://localhost:80/replies/new
	@PostMapping(value="/new", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE) //입력값은 json으로
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
		// 리턴은 200이나 500으로 처리 된다.
		log.info("ReplyVO 객체 json 입력 값 : " + vo); // 파라미터로 넘어온 값 출력 테스트

		int insertCount = service.register(vo); // sql 처리 후에 결과값이 1 | 0 이 나옴

		log.info("서비스 + 매퍼 처리 결과 : " + insertCount);

		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) // 200 정상
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); // 500 서버 오류
		// 삼항 연산자나 if로 리턴을 할때 정상 처리인지 오류 값인지를 전달 해야 한다.
	}
	
/*	//http://localhost:80/replies/pages/11/1 -> xml
	//http://localhost:80/replies/pages/11/1.json -> json
	@GetMapping(value = "/pages/{bno}/{page}.json",
				produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<List<ReplyVO>> getList(@PathVariable("page") int page, @PathVariable("bno") Long bno){
		
		log.info("ReplyController.getList() 메서드 실행");
		log.info("페이지 번호 : " + page);
		log.info("찾을 번호 : " + bno);
		Criteria cri = new Criteria(page, 10); // 현재 페이지와 리스트 개수를 전달
		log.info("Criteria : " + cri);
		
		return new ResponseEntity<>(service.getList(cri, bno), HttpStatus.OK); // 200 정상
		
		//[{"rno":7,"bno":11,"reply":"댓글11","replyer":"kkw","replyDate":1724723545000,"updateDate":1724723545000},{"rno":14,"bno":11,"reply":"댓글11","replyer":"kkw","replyDate":1724723559000,"updateDate":1724723559000},{"rno":18,"bno":11,"reply":"댓글11","replyer":"kkw","replyDate":1724723570000,"updateDate":1724723570000},{"rno":22,"bno":11,"reply":"댓글11","replyer":"kkw","replyDate":1724723586000,"updateDate":1724723586000},{"rno":23,"bno":11,"reply":"매퍼댓글테스트","replyer":"매퍼kkw","replyDate":1724724697000,"updateDate":1724724697000}]
	}*/
	
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
