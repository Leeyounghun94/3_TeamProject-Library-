package kr.co.librarylyh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.librarylyh.domain.CartVO;
import kr.co.librarylyh.mapper.CartMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service		// 스프링에 서비스를 담당한다 라는 코드(비즈니스 로직 영역을 담당함)
//root-context.xml에 context 항목 추가
@Log4j2			// 로그 출력용
@AllArgsConstructor // 모든 매개값을 이용하여 자동으로 생성자 생성

public class CartServiceImpl implements CartService {

	@Setter(onMethod_ = @Autowired)
	private CartMapper cartMapper;
	

	@Override
	public void CartRegister(CartVO vo) {
		log.info("CartServiceImpl.CartRegister 메서드 실행");
		cartMapper.cartInsert(vo);
		
	}

	@Override
	public List<CartVO> cartList() {
		log.info("CartServiceImpl.cartList 메서드 실행");
		return cartMapper.cartList();
	}

	@Override
	public CartVO cartRead(String cart_id) {
		log.info("CartServiceImpl.cartRead 메서드 실행");
		return cartMapper.CartRead(cart_id);
	}

	@Override
	public boolean cartModify(CartVO vo) {
		log.info("CartServiceImpl.cartModify 메서드 실행");
		return cartMapper.cartUpdate(vo) == 1;
	}

	

	@Override
	public boolean clearBasket(String user_id) {
		log.info("CartServiceImpl.cartRemove 메서드 실행");
		return cartMapper.clearBasket(user_id) == 1;	}

}
