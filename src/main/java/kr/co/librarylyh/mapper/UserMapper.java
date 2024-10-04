package kr.co.librarylyh.mapper;


import java.util.List;

import kr.co.librarylyh.domain.UserVO;

// DB와 영속성을 가진 패키지


public interface UserMapper {
	// 추상메서드와 XML을 결합하여 구현 클래스를 사용하는 마이바티스
	// XML생성 시 resources 폴더를 계층별로 생성 후 파일명을 인터페이스와 같게 XML 파일 생성
	
	/*
	 * public int insertSelectUid(UserVO user); // u_id 생성 후 회원가입 완료
	 */	
	public UserVO read(String u_id); // 회원 정보 읽어옴
	
	public int update(UserVO user); // 회원 정보 수정
	
	public int delete(String u_id); // 회원 탈퇴
	
	  
	
	// 회원가입 
	public void join(UserVO user); 
	
	// 중복 아이디 체크
	public int idCheck(String id); 
	
	// 중복 닉네임 체크
	public int nickNameCheck(String nickName);
	
	// 회원 로그인
	public UserVO login(UserVO user);
	
	// 비밀번호 확인
	public int checkPw(String id);
	
	// 비밀번호 변경
	public int updatePw(String pw);
	
	// 어드민 리스트 
	public List<UserVO> getUserList(int authority); 
	
	// 어드민 등록
	public void adminRegister(UserVO user);
	
	// 매일매일 포인트 증정 2024 10 02
	public void updateLastVisitAndPoint(UserVO user);
	
	// 나의 도서 요청 목록 페이징 [전체 가져오기] 2024 10 03
	public int getTotalMyRequest(String id);
	
	// 관리자용 요청 목록 전체 페이징 [전체 수 가져오기] 2024 10 03
	public int getTotalAdminRequest();

	// 나의 포인트 내역 페이징 [전체 수 가져오기] 2024 10 03
	public int getTotalMyPoint(String id);
	
	// 관리자 포인트 내역 페이징 [전체 수 가져오기] 2024 10 03
	public int getTotalAdminPoint();
	
	//날짜 업데이트 2024 10 03
	public void updateLastVisitDate(UserVO loginUser);
}	
