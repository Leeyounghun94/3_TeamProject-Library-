package kr.co.librarylyh.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.librarylyh.domain.BookListVO;
import kr.co.librarylyh.domain.CartVO;
import kr.co.librarylyh.domain.bookReservationVO;
import kr.co.librarylyh.mapper.CartMapper;
import kr.co.librarylyh.mapper.bookReservationMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service		// 스프링에 서비스를 담당한다 라는 코드(비즈니스 로직 영역을 담당함)
// root-context.xml에 context 항목 추가
@Log4j2			// 로그 출력용
@AllArgsConstructor // 모든 매개값을 이용하여 자동으로 생성자 생성

public class BookReservationServiceImpl implements BookReservationService {
	
	
	@Setter(onMethod_ = @Autowired)
	private bookReservationMapper rsMapper;
	
	@Setter(onMethod_ = @Autowired)
	private CartMapper cartMapper;
		
	
	@Override
	public void rsRegister(bookReservationVO vo) {
		log.info("BookReservationServiceImpl.rsRegister 메서드 실행");
		rsMapper.rsInsert(vo);
		
		
	}

	@Override
	public List<bookReservationVO> rsList() {
		log.info("BookReservationServiceImpl.rsList 메서드 실행");
		return rsMapper.rsList();
	} 

	
	@Override
	public bookReservationVO rsRead(Long rsNum) {
		log.info("BookReservationServiceImpl.rsRead 메서드 실행");
		return rsMapper.rsRead(rsNum);
	}

	@Override
	public boolean rsModify(Long rsNum, Long isbn13) {
		log.info("BookReservationServiceImpl.rsModify 메서드 실행");
		return rsMapper.rsUpdate(rsNum, isbn13) == 1;
	}

	
	@Override
	public boolean rsRemove(Long rsNum) {
		log.info("BookReservationServiceImpl.rsRemove 메서드 실행");
		return rsMapper.rsDelete(rsNum) == 1;
	}
	
	@Override
	public boolean rsDel(Long rsNum, Long isbn13) {
		log.info("BookReservationServiceImpl.rsDel 메서드 실행");

		return rsMapper.rsDel(rsNum, isbn13) == 1;
	}

	
	
	@Override
	public boolean confirmReservation(String user_id) {
		 
		try {
             List<BookListVO> basketItems = rsMapper.getBasketItems(user_id);
             for (BookListVO book : basketItems) {
            	 rsMapper.insertReservation(user_id, book.getIsbn13());
             }
             rsMapper.clearBasket(user_id); // 장바구니 비우기
             return true; // 예약 성공
         } catch (Exception e) {
             return false; // 예약 실패
         }
	}
     
		
	

	@Override
	public void addToBasket(String isbn13) throws Exception {
		log.info("BookReservationServiceImpl.addToBasket 메서드 실행");
		cartMapper.cartInsert(null);
	}

	@Override
	public List<CartVO> listBasketItems() {
		log.info("BookReservationServiceImpl.listBasketItems 메서드 실행");
		return cartMapper.cartList();
	}

	@Override
	public boolean removeFromBasket(String isbn13) {
		log.info("BookReservationServiceImpl.removeFromBasket 메서드 실행");
		return cartMapper.clearBasket(isbn13) == 1;
	}

	@Override
	public String cartBookRs(String user_id) {
		log.info("BookReservationServiceImpl.cartBookRs 메서드 실행");
		

		 // 장바구니의 도서 목록 조회
        List<BookListVO> basketItems = rsMapper.getBasketItems(user_id);

        // 예약 테이블에 도서 삽입
        for (BookListVO book : basketItems) {
        	rsMapper.insertReservation(user_id, book.getIsbn13());
        }

        // 장바구니에서 해당 도서 삭제
        rsMapper.clearBasket(user_id);

        return "예약이 확정되었습니다!";
	}

	





}
