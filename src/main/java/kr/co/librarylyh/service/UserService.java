package kr.co.librarylyh.service;

import java.util.List;

import kr.co.librarylyh.domain.Criteria;
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
	
	// 전체 유저 리스트
	public List<UserVO> getUserList(int authority);

	// 어드민 권한 부여
	public int adminRegister(UserVO user);
	
	// 회원 정보 읽어옴 2024 10 02 (포인트 관련 내용으로 사용)
	public UserVO read(String u_id);
	
	// 매일매일 포인트 증정 2024 10 02
	public void updateLastVisitAndPoint(UserVO user);
	
	// 나의 도서목록 요청 페이징 [전체 가져오기] 2024 10 03
	public int getTotalMyRequest(String id);
	
	// 관리자용 요청 목록 전체 페이징 [전체 가져오기] 2024 10 03
	public int getTotalAdminRequest();
	
}
