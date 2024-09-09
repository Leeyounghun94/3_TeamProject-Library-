package kr.co.librarylyh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.librarylyh.domain.bookReservationVO;
import kr.co.librarylyh.service.BookReservationService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller//스프링이 컨트롤러 역할을 제공
@Log4j2
@RequestMapping("/library/*")	// http://localhost:80/library/???
@AllArgsConstructor
public class bookReservationController {

	// 도서 예약 컨트롤러
	
	private BookReservationService service ;
	
	@GetMapping("/home")
	public void home() {// home.jsp 연결
		
	}
	
	@GetMapping("/reservation/ReservationMain")
	public void ReservationMain() {// 
		
	}
	
	
	@GetMapping("/reservation/BookReservation")
	public void BookReservation() {
		
	}
	

	@GetMapping("/reservation/RsCreate")
	public void RsCreate() {
		
	}
	
	@GetMapping("/reservation/StudyReservation")
	public void StudyReservation() {
		
	}
	
	
	@GetMapping("/board/list")
	public void Board() {
		
	}
	
	
	
	
	//예약 등록하기로 하고싶은데. . ..
	@PostMapping("/register")//	 http://localhost:80/library/
	public String Register(bookReservationVO vo, RedirectAttributes rttr) {
		
		log.info("bookReservationController.RsRegister 메서드 실행");
		log.info("- - - - - - - -");
		
		service.rsRegister(vo);
		
		rttr.addAttribute("result ", vo.getU_id());
		
		return "redirect:/reservation/list";
			
	}
	
	@GetMapping("/list")// 	 http://localhost:80/library/
	public void list(Model model) {
		
		log.info("bookReservationController.list 메서드 실행");
		model.addAttribute("list", service.rsList());
	}
	
	
	@GetMapping("/read")
	public void read(@RequestParam("u_id") String u_id, Model model) {
		
		log.info("/read");
		model.addAttribute("vo", service.rsRead(u_id));
		
	}
	
	
	@PostMapping("/modify")
	public String RsUpdate(bookReservationVO vo, RedirectAttributes rttr) {
		
		log.info("bookReservationController.RsUpdate 메서드 실행");
		
		
		if(service.rsModify(vo)) {
			
			rttr.addFlashAttribute("result", "수정이 성공되었습니다.");
			
		} else {
			
			rttr.addFlashAttribute("result", "수정이 실패 하였습니다.");
		}
		
		return "redirect:/reservation/list";
	}
	
	
	
	// 예약 삭제하기..
	@PostMapping("/remove")// http://localhost:80/library/delete/{u_id}
	public String remove(@RequestParam("u_id") String u_id, RedirectAttributes rttr ) {
		
		log.info("bookReservationController.remove 메서드 실행");

		if(service.rsRemove(u_id)) {
			
			rttr.addFlashAttribute("result", "수정이 성공되었습니다.");
			
		} else {
			
			rttr.addFlashAttribute("result", "수정이 실패 하였습니다.");
		}
		
		
		return "redirect:/reservation/list";
				
	}
	
	

}