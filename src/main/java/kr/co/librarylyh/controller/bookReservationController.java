package kr.co.librarylyh.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
	private CartService cartService;
	
	@GetMapping("/home")
	public void home() {// home.jsp 연결
		
	}
	
	@GetMapping("/reservation/ReservationMain")
	public void ReservationMain() {// Reservation Main Page
		
	}
	
	
/*	@GetMapping("/reservation/StudyReservation")
	public void StudyReservation() {// 열람실 예약하기 - 해당 서비스 추후 개발 예정
		
	}
*/	

	
	// 예약 목록 조회
	@GetMapping("/reservation/RsUpdate")
	public String RsUpdate(HttpServletRequest request, Model model) {// MyPage -> 나의 예약 정보
					
		
    	HttpSession session = request.getSession(false);
    	
    	if(session == null){
    		//세션이 존재하지 않을 때의 로직
    		
    		return "library/home";
    	}
    	//세션이 존재할 때 세션에서 멤버를 불러오는 로직
    	UserVO loginMember = (UserVO) session.getAttribute("user");

    	if(loginMember == null){
    		//세션은 존재하지만, 로그인 멤버가 없을 때의 로직
    		
    		return "library/login";   		
    	}	
    	//로그인 멤버가 있다면, 위에서 받은 loginMember 변수를 이용하면 된다.
	
    	String cartNum = String.valueOf(session.getAttribute("cart_id"));
    	List<CartVO> myRsList = cartService.cartList(cartNum);

    	model.addAttribute("myRsList", myRsList);
    	model.addAttribute("userId", myRsList.get(0).getUser_id());
    	model.addAttribute("cartId", myRsList.get(0).getIsbn13());
    	
    	return "library/reservation/RsUpdate";
	}
	
	
	
	// Cart페이지에서 헤더 장바구니 버튼에서 Cart페이지 열기 
	@GetMapping("/cart/cart")
	public String loginCart(HttpServletRequest request, Model model) {
		
    	HttpSession session = request.getSession(false);
    	
    	if(session == null){
    		//세션이 존재하지 않을 때의 로직
    		
    		return "library/home";
    	}
    	//세션이 존재할 때 세션에서 멤버를 불러오는 로직
    	UserVO loginMember = (UserVO) session.getAttribute("user");

    	if(loginMember == null){
    		//세션은 존재하지만, 로그인 멤버가 없을 때의 로직
    		
    		return "library/login";
    	}	
    	//로그인 멤버가 있다면, 위에서 받은 loginMember 변수를 이용하면 된다.
    	
    	    	    
    	
    	//세션이 존재하며 Session에다가 cart_id를 넣어주기.
    	
 //   	String cartNum = String.valueOf(session.getAttribute("cart_id"));
    	    	    	
    	CartVO vo = new CartVO();
    	LocalDate date = LocalDate.now();
    	DateTimeFormatter timeFomat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    	String time = date.format(timeFomat);
    	vo.setUser_id(loginMember.getU_id());
    	vo.setCartDate(time);
    	    	
    	List<String> cartNum = cartService.findCartID(vo);  
    	log.info("==========cartNum========" + cartNum);
    	List<CartVO> cartList = cartService.cartList(cartNum.get(0));

    	model.addAttribute("cartList", cartList);
    	model.addAttribute("userId", cartList.get(0).getUser_id());
    	model.addAttribute("cartId", cartList.get(0).getCart_id());  
    	model.addAttribute("cartDate", cartList.get(0).getCartDate());
    	
    	model.addAttribute("listCount", cartService.cartCount(cartNum.get(0)));
    	
    	
    	return "library/cart/cart";
    }
		


	@GetMapping("/reservation/RsCreate")
	public void RsCreate( ) {// 도서 예약 신청하기 페이지 경로
		
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

}