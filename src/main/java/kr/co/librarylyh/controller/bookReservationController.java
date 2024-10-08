package kr.co.librarylyh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import kr.co.librarylyh.domain.BookListVO;
import kr.co.librarylyh.domain.CategoryVO;
import kr.co.librarylyh.domain.Paging;
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
	
	private BookReservationService service ; // service - Reservation
	private BookListService bookService ;	// service - BookService
	private UserService userService ;	// service - UserService
	
	@GetMapping("/home")
	public void home() {// home.jsp 연결
		
	}
	
	@GetMapping("/reservation/ReservationMain")
	public void ReservationMain() {// Reservation Main Page
		
	}
	
	
	@GetMapping("/reservation/StudyReservation")
	public void StudyReservation() {// 열람실 예약하기 - 해당 서비스 추후 개발 예정
		
	}
	

	
	@GetMapping("/reservation/RsUpdate")
	public void RsUpdate() {// MyPage -> 나의 예약 정보
					
	}
	
	
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
	@GetMapping("/reservation/BookReservation")
	public String RsList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(value = "amount", defaultValue = "10") int amount,
			@RequestParam(value = "category_id", required = false) String category_id,
			@RequestParam(value = "rentalAvailable", required = false) String rentalAvailable,
			@RequestParam(value = "publicationDateFilter", required = false) String publicationDateFilter,
			Model model) {
		
		Paging pge = new Paging(pageNum, amount);
		Map<String, Object> searchParams = new HashMap<>();

		// 필터 조건이 있을 경우에만 searchParams에 추가 (필터 설정 안할때 URL 난장판되길래 만듦)
		if (category_id != null && !category_id.isEmpty()) {
			searchParams.put("category_id", category_id);
		}
		if (rentalAvailable != null && !rentalAvailable.isEmpty()) {
			searchParams.put("rentalAvailable", rentalAvailable);
		}
		if (publicationDateFilter != null && !publicationDateFilter.isEmpty()) {
			searchParams.put("publicationDateFilter", publicationDateFilter);
		}

		// 기본 검색 조건에 맞는 모든 책 목록 가져오기
		List<BookListVO> bookList = bookService.getListWithFiltersAndPaging(pge, searchParams);
		model.addAttribute("bookList", bookList);
		
		log.info("bookReservationController.RsList 메서드 실행");
		
		return "library/reservation/BookReservation";
	}
		


}