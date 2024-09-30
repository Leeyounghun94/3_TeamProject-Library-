package kr.co.librarylyh.service;

import kr.co.librarylyh.domain.UserVO;
import kr.co.librarylyh.mapper.UserMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
        log.info("login : " + loginUser);
        return loginUser;
    }

	@Override
	public UserVO read(String id) {
		// TODO Auto-generated method stub
		return mapper.read(id);
	}

	@Override
	public boolean remove(String u_id) {
		// TODO Auto-generated method stub
		return mapper.delete(u_id) == 1;
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

	

}
