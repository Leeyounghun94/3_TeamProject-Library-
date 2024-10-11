package kr.co.librarylyh.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.librarylyh.domain.BookListVO;
import kr.co.librarylyh.domain.CartVO;
import kr.co.librarylyh.domain.CategoryVO;
import kr.co.librarylyh.domain.UserVO;
import kr.co.librarylyh.domain.bookReservationVO;
import kr.co.librarylyh.service.BookListService;
import kr.co.librarylyh.service.BookReservationService;
import kr.co.librarylyh.service.CartService;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RestController // rest 방식으로 응답하며, view-jsp 가 아닌 json과 xml 로 나타난다.
@RequestMapping("/library/*")
@Log4j2

public class BookRsRestController {

	// Rest 방식의 Controller

	// 예약 - 수정과 삭제를 담당...

	@Setter(onMethod_ = @Autowired)
	private BookReservationService rsService;

	@Setter(onMethod_ = @Autowired)
	private BookListService bookService;

	@Setter(onMethod_ = @Autowired)
	private CartService cartService;

	// 예약 수정하기
	@PutMapping(value = "/{rsNum}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<String> RsUpdate(@PathVariable("rsNum") Long rsNum, @PathVariable("isbn13") Long isbn13,
			@RequestBody bookReservationVO vo) {

		vo.setRsNum(rsNum);

		if (rsService.rsModify(rsNum, isbn13)) {

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

			return new ResponseEntity<>("success", HttpStatus.OK);

		} else {

			return new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
		}

	}

	// 상세보기에서 장바구니 버튼 클릭할 때 유저 정보 + 책 정보
	@GetMapping(value = "/insertCart/{isbn13}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> cartbook(@PathVariable("isbn13") Long isbn13, HttpSession session) {

		log.info("===================장바구니 실행=====================");
		UserVO vo = (UserVO) session.getAttribute("user");

		LocalDate cartDate = LocalDate.now();
		DateTimeFormatter timeFomat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String time = cartDate.format(timeFomat);

		BookListVO book = bookService.get(isbn13);

		CartVO cart = new CartVO();

		cart.setC_title(book.getBook());
		cart.setIsbn13(isbn13);
		cart.setPhoto(book.getPhoto());
		cart.setUser_id(vo.getU_id());
		cart.setCartDate(time);

		// String cartNum = String.valueOf(session.getAttribute("cart_id")) ;

		int cartIdCheck = cartService.cartIdCheck(cart);
		log.info("=========User_id============" + cart.getUser_id());
		log.info("=========cartIdCheck============" + cartIdCheck);
		log.info("==========cartdate===============" + cart.getCartDate());

		int result = 0;

		if (cartIdCheck == 0) {

			result = cartService.cartRegister(cart);
			log.info(cart.getCart_id() + "=====cart_id=========");

//		session.setAttribute("cart_id", cart.getCart_id());
			log.info("================cartNum null 실행===================");
		} else {
			List<String> cartNum = cartService.findCartID(cart);

			cart.setCart_id(cartNum.get(0));
			log.info(cart.getCart_id() + "=====cart_id=========");

			result = cartService.CartIdPut(cart);

		}

		log.info("cart_id" + cart.getCart_id());

		return result == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 장바구니 페이지에서 장바구니 비우기(전체 삭제) 했을 때의 메서드
	@DeleteMapping(value = "/clearCart/{cartid}")
	public ResponseEntity<String> clearCart(@PathVariable("cartid") String cartid) {

		log.info("=================clearcart  실행 중=================" + cartid);

		boolean cartResult = cartService.clearBasket(cartid);

		return cartResult ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 장바구니 페이지에서 삭제 버튼 눌렀을 때의 메서드(개별 삭제)
	@DeleteMapping(value = "/deleteCart/{cartid}/{isbn13}")
	public ResponseEntity<String> deleteCart(@PathVariable("cartid") String cartid,
			@PathVariable("isbn13") Long isbn13) {
		log.info("=================deleteCart  실행 중=================" + cartid);

		boolean deleteResult = cartService.cartRemove(cartid, isbn13);

		return deleteResult ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	@PostMapping(value = "/inserRs", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> insertRs(@RequestBody List<bookReservationVO> vo) {
		log.info("=================insertRs  실행 중=================" + vo);
		int rsCount = 0;
		int total = vo.size();

		for (bookReservationVO rs : vo) {
			int result = rsService.rsRegister(rs);
			rs.getIsbn13();
			rs.getUser_id();
			rs.getRsStartDay();
			rs.getRsEndDay();
			
			if (result > 0) {
				
			}else {				
			}
		}
		log.info("해당 값 : " + rsCount);
		if(total == rsCount) {
			return  new ResponseEntity<>("success", HttpStatus.OK);
		}else {			
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

}