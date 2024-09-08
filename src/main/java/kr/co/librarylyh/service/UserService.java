package kr.co.librarylyh.service;

import kr.co.librarylyh.domain.UserVO;

// 비즈니스 로직 처리



public interface UserService {
	// 메서드에 실제 용어 사용
	
	// 회원가입
	public int register(UserVO user);
	
	// 정보수정
	public boolean modify(UserVO user);
	
	// 회원 정보 상세보기
	public UserVO get(String u_id);
	
	// 회원 탈퇴
	public boolean remove(String u_id);
	
	// 회원 로그인
	public UserVO login(UserVO user);
	
	public boolean findId(String id);
	
	public int findPassword(UserVO user);

}
