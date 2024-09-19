package kr.co.librarylyh.service;

import kr.co.librarylyh.domain.UserVO;
import kr.co.librarylyh.mapper.UserMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

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
	public List<UserVO> getUserList() {
		// 유저 리스트 출력
		return mapper.getAdminList();
	}

	
}
