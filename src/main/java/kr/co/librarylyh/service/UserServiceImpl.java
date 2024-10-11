package kr.co.librarylyh.service;

import kr.co.librarylyh.domain.UserVO;
import kr.co.librarylyh.mapper.UserMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Log4j2
public class UserServiceImpl implements UserService{
    @Setter(onMethod_ = @Autowired)
    private UserMapper mapper;

    public void join(UserVO user) {
    	
    	mapper.join(user);
        log.info("결과 : "+user.getU_id());

    }

    @Override
    public UserVO login(UserVO user) {

        UserVO loginUser = mapper.login(user);

        return loginUser;
    }
    
    // 
    @Override
    public void updateLastVisitAndPoint(UserVO Uvo) {
        
        UserVO loginUsr = Uvo;
        
        // 매일 로그인 포인트 증정
        if (loginUsr != null) {
            
            // 현재 날짜를 Date 타입으로 가져옴
            Date today = new Date();
            
            // 마지막 방문일 가져옴
            Date lastVisitDate = loginUsr.getLastVisitDate();
            
            // 오늘 처음 방문한 경우 포인트 추가
            if (lastVisitDate == null || !isSameDay(lastVisitDate, today)) {
                loginUsr.setPoint(loginUsr.getPoint() + 100); // 기존 포인트 + 100(방문포인트)
                loginUsr.setLastVisitDate(today); // 마지막 방문일 업데이트
                
                // db에 포인트 및 마지막 방문일 업데이트
                mapper.updateLastVisitAndPoint(loginUsr);
            }
        }
    }
    
    // 두 날짜가 같은 날인지 비교하는 메서드 추가
    private boolean isSameDay(Date date1, Date date2) {
        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(date1);
        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(date2);
        return cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR) &&
               cal1.get(Calendar.DAY_OF_YEAR) == cal2.get(Calendar.DAY_OF_YEAR);
    }
    
    // 회원 정보 읽어옴 2024 10 02 (포인트 관련 및 보드 게시글 내용으로 사용)
	@Override
	public UserVO readInfo(String u_id) {
		return mapper.readInfo(u_id);
	}


    // 회원정보 읽기
	@Override
	public UserVO read(String id) {
		return mapper.read(id);
	}
	
	// 회원탈퇴
	@Override
	public boolean remove(String u_id) {
		return mapper.delete(u_id) == 1;
	}
	
	// 회원 아이디 중복체크
	@Override
	public int idCheck(String id) {
		return mapper.idCheck(id);
	}
	
	// 회원 닉네임 중복체크
	@Override
	public int nickNameCheck(String nickName) {		
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
	public UserVO findUserId(UserVO user) {
		// 아이디찾기
		return mapper.findUserId(user);
	}

	@Override
	public int findUserPw(UserVO user) {
		// 비밀번호찾기
		
		return mapper.findUserPw(user);
	}

	@Override
	public UserVO pwUpdate(UserVO user) {
		// 비밀번호 업데이트

		return mapper.pwUpdate(user);
	}

	@Override
	public int update(UserVO user) {

		return mapper.update(user);
		// 회원정보 업데이트
		
	}

	@Override
	public int checkPw(UserVO user) {
		// 현재 비밀번호 확인
		log.info("sdfssdfsafee나와라");
		return mapper.checkPw(user);
	}

	
	// 나의 도서요청 목록 페이징 [전체 수 가져오기] 2024 10 03
	@Override
	public int getTotalMyRequest(String id) {
		
		return mapper.getTotalMyRequest(id);
	}
	
	// 관리자용 요청 목록 전체 페이징 [전체 수 가져오기] 2024 10 03
	@Override
	public int getTotalAdminRequest() {
		
		return mapper.getTotalAdminRequest();
		
	}
	
	// 관리자용 요청 목록 전체 페이징 [전체 수 가져오기] 2024 10 03
	@Override
	public int getTotalMyPoint(String id) {
		
		return mapper.getTotalMyPoint(id);
		
	}
	
	// 관리자 포인트 내역 페이징 [전체 수 가져오기] 2024 10 03
	@Override
	public int getTotalAdminPoint() {
		
		return mapper.getTotalAdminPoint();
	}
	
	//날짜 업데이트 2024 10 03
	@Override
	public void updateLastVisitDate(UserVO loginUser) {
		
		mapper.updateLastVisitDate(loginUser);
	}




	
	
	
}
