package kr.co.librarylyh.service;

import kr.co.librarylyh.domain.BookPointVO;
import kr.co.librarylyh.domain.UserVO;
import kr.co.librarylyh.mapper.BoardMapper;
import kr.co.librarylyh.mapper.UserMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Log4j2
public class UserServiceImpl implements UserService{
    @Setter(onMethod_ = @Autowired)
    private UserMapper mapper;
    private BoardMapper boardMapper;

    public void join(UserVO user) {
    	
    	mapper.join(user);
        log.info("결과 : "+user.getU_id());

    }

    @Override
    public UserVO login(UserVO user) {

        UserVO loginUser = mapper.login(user);

        return loginUser;
    }
    
	// 매일매일 포인트 증정 2024 10 02
    @Override
    public void updateLastVisitAndPoint(UserVO Uvo) {
    	
    	UserVO loginUsr = Uvo;
    	
        //매일 로그인 포인트 증정
        if(loginUsr != null) {
        	
        	LocalDate today =LocalDate.now(); // 현재 날짜 가져옴
        	
        	LocalDate lastVisitDate = loginUsr.getLastVisitDate(); // 마지막 방문일 가져옴
        	
        	//오늘 처음 방문한 경우 포인트 추가
        	
        	if(lastVisitDate == null || !lastVisitDate.isEqual(today)) {

        		loginUsr.setPoint(loginUsr.getPoint() + 100); // 기존 포인트 + 100(방문포인트)
        		loginUsr.setLastVisitDate(today); // 마지막 방문일 업데이트
        		
        		mapper.updateLastVisitAndPoint(loginUsr); // db에 포인트 및 마지막 방문일 업데이트

        		// 방문 포인트 로그 기록
        		
        		
        		String bookPointHistory = "일일방문 포인트 증가";
        		
            	BookPointVO vo = new BookPointVO();
            	
            	vo.setBookPoint(100);
            	vo.setBookPointTotal(loginUsr.getPoint() + 100);
            	vo.setBookPointHistory(bookPointHistory);
            	vo.setBookPointUserId(loginUsr.getId());
            	vo.setBookPointNickName(loginUsr.getNickName());
            	// 현재 날짜와 시간을 Date로 변환하여 설정
            	// ZoneId.systemDefault()는 시스템의 기본 시간대를 사용하므로, 시간대를 별도로 설정할 필요없음
            	// vo.setBookPointDate(Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant()));
            	
            	log.info("vo값 확인14214asdasdafㄴㅇㄴㅁㅇ :" + vo);
            	
            	boardMapper.allPointHistory(vo); // 게시글 작성 로그 기록
            	
        	}//end inner if
        	
        }//end if
    	
    }

	@Override
	public boolean modify(UserVO user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public UserVO get(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean remove(String u_id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int idCheck(String id) {
		// 회원 아이디 중복체크
		return mapper.idCheck(id);
	}

	@Override
	public int nickNameCheck(String nickName) {
		// 회원 닉네임 중복체크
		return mapper.nickNameCheck(nickName);
	}

	@Override
	public List<UserVO> getUserList(int authority) {
		// 어드민 리스트
		return mapper.getUserList(authority);
	}

	@Override
	public int adminRegister(UserVO user) {
		// 일반 유저 -> 관리자로 권한 변경
		
		mapper.adminRegister(user);
		
		if(user.getAuthority() == 1) {
			return 1;
		}
		
		return 0;
	}

	@Override
	public UserVO read(String u_id) {
		
		return mapper.read(u_id);
	}
	
	// 나의 도서요청 목록 페이징 [전체 가져오기] 2024 10 03
	@Override
	public int getTotalMyRequest(String id) {
		
		return mapper.getTotalMyRequest(id);
	}
	
	// 관리자용 요청 목록 전체 페이징 [전체 가져오기] 2024 10 03
	public int getTotalAdminRequest() {
		
		return mapper.getTotalAdminRequest();
		
		};
	
	
	



	
	
	
}
