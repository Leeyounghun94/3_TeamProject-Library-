package kr.co.librarylyh.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.librarylyh.domain.bookReservationVO;
import kr.co.librarylyh.service.BookReservationService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController// rest 방식으로 응답하며, view-jsp 가 아닌 json과 xml 로 나타난다.
@RequestMapping("/library/*")//	 http://localhost:80/replies/????
@Log4j2
@AllArgsConstructor// 생성자 구현 -> new ReplyController(ReplyService);

public class BookRsRestController {

	// Rest 방식의 Controller
	
	// 예약 - 수정과 삭제를 담당...
	
	
	
	private final BookReservationService rsService ;
	
	
	
	
	// 예약 수정하기
		@PutMapping(value = "/{rsNum}", produces = {MediaType.APPLICATION_JSON_VALUE})
		public ResponseEntity<String> RsUpdate(@PathVariable("rsNum") Long rsNum, @PathVariable("isbn13") Long isbn13, @RequestBody bookReservationVO vo) {
			
			vo.setRsNum(rsNum);
			
			if(rsService.rsModify(rsNum, isbn13)) {
				
				return new ResponseEntity<>("success", HttpStatus.OK);
				
			} else {
				
				return new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
			}
		
		}
		
		
	// 예약 삭제하기..
		@DeleteMapping(value = "{rsNum}", produces = { MediaType.APPLICATION_JSON_VALUE })
		public ResponseEntity<String> RsRemove(@PathVariable("rsNum") Long rsNum) {
			
			log.info("bookReservationController.remove 메서드 실행");
			
			if (rsService.rsRemove(rsNum)) {
				
				return new ResponseEntity<>("success", HttpStatus.OK)
						
			}else {
				
	
			
			return "redirect:/reservation/BookReservation";
					
			}
	
		}
	
}