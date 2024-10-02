package kr.co.librarylyh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.librarylyh.domain.BookListVO;
import kr.co.librarylyh.domain.CartVO;
import kr.co.librarylyh.domain.CategoryVO;
import kr.co.librarylyh.domain.Criteria;
import kr.co.librarylyh.domain.Paging;
import kr.co.librarylyh.domain.RsPageDTO;
import kr.co.librarylyh.domain.UserVO;
import kr.co.librarylyh.domain.bookReservationVO;
import kr.co.librarylyh.service.BookListService;
import kr.co.librarylyh.service.BookReservationService;
import kr.co.librarylyh.service.CartService;
import kr.co.librarylyh.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import oracle.jdbc.proxy.annotation.Post;

@Controller//스프링이 컨트롤러 역할을 제공
@Log4j2
@RequestMapping("/library/*")	// http://localhost:80/library/???
@AllArgsConstructor

public class bookReservationController {

	// 도서 예약 컨트롤러
	
	private BookReservationService service ; // service - Reservation
	private BookListService bookService ;	// service - BookService
	
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
	public void RsUpdate() {// MyPage -> 나의 예약 정보 - 예약 변경/취소
					
	}
	
	
	@GetMapping("/cart/cart")
	public void cart() {
		
		}
	
	@PostMapping("/cart/cart/{isbn13}")
	public String cartbook(Model model) {
		
		model.addAttribute("user_id");
		return "library/cart/cart/";
	}
	
	
	// 예약 신청하기
	@PostMapping("/reservation/RsCreate")
	public String RsCreate(Model model, @ModelAttribute BookListVO bookvo, @ModelAttribute UserVO uservo) {
		
		model.addAttribute("isbn13", bookvo);
		model.addAttribute("author", bookvo);
		model.addAttribute("publisher", bookvo);
		model.addAttribute("price", bookvo);
		
		model.addAttribute("name", uservo);
		
		
		log.info("bookReservationController.RsCreate 메서드 실행");	

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
			Model model, Criteria cri) {
		
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
		
/*		// bookReservation - 페이징 처리 
		
		int total =service.RsGetTotal();
		
		RsPageDTO rsPageMake = new RsPageDTO(cri, total);		
		
		model.addAttribute("rsPageMaker", rsPageMake);
*/		
		
		
		log.info("bookReservationController.RsList 메서드 실행");
		
		return "library/reservation/BookReservation";
	}
		

	// addToBasket 메서드를 호출하여 user_id와 isbn13을 Service에 전달.
	@PostMapping("/cart/cart")
    @ResponseBody // 이 부분을 사용하면 JSON 형식으로 반환 가능
    public Map<String, Object> confirmReservation(@RequestParam("user_id") String user_id) {
        // 예약 로직 실행
        boolean isSuccess = service.confirmReservation(user_id);

        // 결과를 JSON 형태로 반환
        Map<String, Object> response = new HashMap<>();
        response.put("success", isSuccess);
        response.put("message", isSuccess ? "예약이 완료되었습니다!" : "예약에 실패했습니다.");
        return response;
		}
	
	  
	
	// BookReservationController의 confirmReservation 메서드가 호출되어 Service에 요청을 전달.
	  @PostMapping("/confirmReservation")
      public String confirmReservation(@RequestParam("user_id") String user_id, Model model) {
          boolean result = service.confirmReservation(user_id);
          model.addAttribute("message", result);
          return "reservationResult";
      }
	
	
	
	
	
	

}