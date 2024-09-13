package kr.co.librarylyh.service;

import kr.co.librarylyh.domain.UserVO;

// 비즈니스 로직 처리



public interface UserService {
	// 메서드에 실제 용어 사용
	
	// 정보수정
	public boolean modify(UserVO user);
	
	// 회원 정보 상세보기
	public UserVO get(String id);
	
	// 회원 탈퇴
	public boolean remove(String u_id);
	
	public void join(UserVO user);

    public UserVO login(String id, String pw);
	
	

}
