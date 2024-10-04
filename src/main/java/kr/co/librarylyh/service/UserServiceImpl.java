package kr.co.librarylyh.service;

import kr.co.librarylyh.domain.UserVO;
import kr.co.librarylyh.mapper.UserMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDate;
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
    
	/*// 매일매일 포인트 증정 2024 10 02
    @Override
    public void updateLastVisitAndPoint(UserVO Uvo) {
    	
    	UserVO loginUsr = Uvo;
    	
        //매일 로그인 포인트 증정
        if(loginUsr != null) {
        	
        	Date today =LocalDate.now(); // 현재 날짜 가져옴
        	
        	LocalDate lastVisitDate = loginUsr.getLastVisitDate(); // 마지막 방문일 가져옴
        	
        	//오늘 처음 방문한 경우 포인트 추가
        	
        	if(lastVisitDate == null || !lastVisitDate.isEqual(today)) {

        		loginUsr.setPoint(loginUsr.getPoint() + 100); // 기존 포인트 + 100(방문포인트)
        		loginUsr.setLastVisitDate(today); // 마지막 방문일 업데이트
        		
        		mapper.updateLastVisitAndPoint(loginUsr); // db에 포인트 및 마지막 방문일 업데이트

            	
        	}//end inner if
        	
        }//end if
    	
    }*/
    
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
