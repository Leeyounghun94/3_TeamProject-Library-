package kr.co.librarylyh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.librarylyh.domain.UserVO;
import kr.co.librarylyh.mapper.UserMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service // root-context 항목 추가
@AllArgsConstructor
public class UserServiceImpl implements UserService {
	
	final static public int USER_ACCOUNT_ALREADY_EXIST = 0;
	final static public int USER_ACCOUNT_CREATE_SUCCESS = 1;
	final static public int USER_ACCOUNT_CREATE_FAIL = -1;
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Override
	public int register(UserVO user) {
		
		log.info("UserServiceImpl.register 메서드 실행");
		
		boolean find_id = mapper.findId(user.getId());
		
		if(!find_id) {
			int result = mapper.insertSelectUid(user);
			
			if(result > 0) {
				return USER_ACCOUNT_CREATE_SUCCESS;
			} else {
				return USER_ACCOUNT_CREATE_FAIL;
			} 
			
		} else {
			return USER_ACCOUNT_ALREADY_EXIST;
		}
		
	}

	@Override
	public boolean modify(UserVO user) {
		
		log.info("UserServiceImpl.modify 메서드 실행");
		
		return mapper.update(user) == 1;
	}

	@Override
	public UserVO get(String u_id) {

		log.info("UserServiceImpl.get 메서드 실행");
		
		return mapper.read(u_id);
	}

	@Override
	public boolean remove(String u_id) {
		
		log.info("UserServiceImpl.remove 메서드 실행");
		
		return mapper.delete(u_id) == 1;
	}

	@Override
	public UserVO login(UserVO user) {
		log.info("UserServiceImpl.login 메서드 실행");
		return user = mapper.login(user);
	}

	@Override
	public boolean findId(String id) {
		
		boolean userId = mapper.findId(id);
		
		if(userId == false) {
			return false;	
		}
		return true;		
		
	}

	@Override
	public int findPassword(UserVO user) {
		
		user.setId("test333");
		user.setPhone("010-1234-9876");
		
		return 0;
	}



	
}
