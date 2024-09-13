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
	
	// 회원 가입
	public void join(UserVO user);
	
	// 회원 로그인
    public UserVO login(UserVO user);
    
    // 중복 아이디 체크
	public int idCheck(String id);
	
	// 중복 닉네임 체크
	public int nickNameCheck(String nickName);
	
	

}