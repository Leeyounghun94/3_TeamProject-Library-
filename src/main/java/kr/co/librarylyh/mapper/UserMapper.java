package kr.co.librarylyh.mapper;

import kr.co.librarylyh.domain.UserVO;

// DB와 영속성을 가진 패키지


public interface UserMapper {
	// 추상메서드와 XML을 결합하여 구현 클래스를 사용하는 마이바티스
	// XML생성 시 resources 폴더를 계층별로 생성 후 파일명을 인터페이스와 같게 XML 파일 생성
	
	public int insertSelectUid(UserVO user); // u_id 생성 후 회원가입 완료
	
	public UserVO read(String u_id); // 회원 정보 읽어옴
	
	public int update(UserVO user); // 회원 정보 수정
	
	public int delete(String u_id); // 회원 탈퇴
	
	public UserVO login(UserVO user); // 회원 로그인 
	
	public boolean findId(String id); // 회원 아이디 찾기
	
	public UserVO findPassword(UserVO user); // 비밀번호 찾기
}
