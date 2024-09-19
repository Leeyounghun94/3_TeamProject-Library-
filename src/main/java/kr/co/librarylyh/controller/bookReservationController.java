package kr.co.librarylyh.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.librarylyh.domain.CategoryVO;
import kr.co.librarylyh.domain.bookReservationVO;
import kr.co.librarylyh.service.BookListService;
import kr.co.librarylyh.service.BookReservationService;
import kr.co.librarylyh.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller//스프링이 컨트롤러 역할을 제공
@Log4j2
@RequestMapping("/library/*")	// http://localhost:80/library/???
@AllArgsConstructor
public class bookReservationController {

	// 도서 예약 컨트롤러
	
	private BookReservationService service ; // service - 예약
	private BookListService bookService ;	// service - book
	private UserService userService ;	// service - user
	
	@GetMapping("/home")
	public void home() {// home.jsp 연결
		
	}
	
	@GetMapping("/reservation/ReservationMain")
	public void ReservationMain() {// 
		
	}
	
	
	@GetMapping("/reservation/StudyReservation")
	public void StudyReservation() {// 해당 서비스 구현 중
		
	}
	
/*	@GetMapping("/reservation/BookReservation")
	public void BookReservation( ) {
		
		log.info("bookReservationController.BookReservation 메서드 실행");		
		
	}
	*/
	
	
	
	
	// 예약 신청하기
	@PostMapping("/reservation/RsCreate")
	public String RsCreate(bookReservationVO vo, RedirectAttributes rttr, Model model) {
		
		log.info("bookReservationController.RsCreate 메서드 실행");
		
		service.rsRegister(vo);
		
		return "redirect:/reservation/RsCreate";

	}
	
	@GetMapping("/reservation/RsCreate")
	public void RsCreate( ) {
		
	}
	
	
	// BookReservation.jsp 에서 책 목록 조회 List
	@RequestMapping(value = "/reservation/BookReservation", method = RequestMethod.GET)
	public void RsList(Model model) {
		
		log.info("bookReservationController.Rslist 메서드 실행");
		
		List<CategoryVO> list = bookService.getCategoriesByISBN(0);
		model.addAttribute("list", list); 
	}
	
/*	@GetMapping("/reservation/BookReservation")
	public void RsList( ) {
		
	}*/
	
	
	
	@GetMapping("/read")
	public void read(@PathVariable("rsNum") Long rsNum, Model model) {
		
		log.info("bookReservationController.read 메서드 실행");
	
		
		
	}
	
	
	
	
	

}