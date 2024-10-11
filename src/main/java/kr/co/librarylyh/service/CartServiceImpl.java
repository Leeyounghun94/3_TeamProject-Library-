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
	public int cartRegister(CartVO vo) {// cartid 생성하고 넣기
		log.info("CartServiceImpl.CartRegister 메서드 실행");
		return cartMapper.cartInsert(vo);
		
	}
	
	@Override
	public int CartIdPut(CartVO vo) {// 기존 인서트
		log.info("CartServiceImpl.CartIdPut 메서드 실행");
		return cartMapper.CartIdPut(vo);
	}

	@Override
	public List<CartVO> cartList(String cart_id) {
		log.info("CartServiceImpl.cartList 메서드 실행");
		return cartMapper.cartList(cart_id);
	}

	@Override
	public CartVO cartRead(CartVO vo) {
		log.info("CartServiceImpl.cartRead 메서드 실행");
		return cartMapper.cartRead(vo);
	}

	@Override
	public boolean cartModify(CartVO vo) {
		log.info("CartServiceImpl.cartModify 메서드 실행");
		return cartMapper.cartUpdate(vo) == 1;
	}

	
	@Override
	public boolean cartRemove(String cart_id, Long isbn13) {
		log.info("CartServiceImpl.cartRemove 메서드 실행");
		return cartMapper.cartDelete(cart_id, isbn13) == 1;
	}
	

	@Override
	public boolean clearBasket(String user_id) {
		log.info("CartServiceImpl.clearBasket 메서드 실행");
		return cartMapper.clearBasket(user_id) == 1;
		
	}

	@Override
	public int cartCount(String cart_id) {
		log.info("CartServiceImpl.cartCount 메서드 실행");
		return cartMapper.cartCount(cart_id);
	}

	@Override
	public int cartIdCheck(CartVO vo) {
		// TODO Auto-generated method stub
		return cartMapper.cartIdCheck(vo);
	}

	@Override
	public List<String> findCartID(CartVO vo) {
		// TODO Auto-generated method stub
		return cartMapper.findCartID(vo);
	}



	

}
