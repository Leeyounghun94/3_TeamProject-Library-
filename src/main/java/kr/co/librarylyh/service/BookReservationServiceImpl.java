package kr.co.librarylyh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.librarylyh.domain.bookReservationVO;
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
	private bookReservationMapper mapper;
	
	@Override
	public void rsRegister(bookReservationVO vo) {
		log.info("BookReservationServiceImpl.rsRegister 메서드 실행");
		mapper.rsInsert(vo);
		
	}

	@Override
	public List<bookReservationVO> rsList() {
		log.info("BookReservationServiceImpl.rsList 메서드 실행");
		return mapper.rsList();
	}

	@Override
	public boolean rsModify(bookReservationVO vo) {
		log.info("BookReservationServiceImpl.rsModify 메서드 실행");
		return mapper.rsUpdate(vo) == 1 ;
	}

	@Override
	public boolean rsRemove(String u_id) {
		log.info("BookReservationServiceImpl.rsRemove 메서드 실행");
		return mapper.rsDelete(u_id) == 1 ;
	}

	@Override
	public bookReservationVO rsRead(String u_id) {
		log.info("BookReservationServiceImpl.rsRead 메서드 실행");
		return mapper.rsRead(u_id);
	}


}
