package kr.co.librarylyh.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.librarylyh.domain.BoardAttachVO;
import kr.co.librarylyh.domain.BoardVO;
import kr.co.librarylyh.domain.BookPointVO;
import kr.co.librarylyh.domain.BookRequestVO;
import kr.co.librarylyh.domain.Criteria;
import kr.co.librarylyh.domain.LikeVO;

// 컨트롤러랑 직접적인 거래하는 애임. 서비스에서 impl이랑 중개해줌.
public interface BoardService {

	public void register(BoardVO board); // 게시글 등록
	
	public void registerRequest(BookRequestVO bookRequest); // 
	

	// public BoardVO get(Long bno);
	public BoardVO get(Long bno) throws Exception; // 게시물 조회수

	public boolean modify(BoardVO board); // 게시글 수정

	public boolean remove(Long bno); // 게시글 삭제
	
	public int deleteRequestBook(Long r_bookBno); // 희망 도서 요청 게시글 삭제 2024 10 01


	// public List<BoardVO> getList();

	public List<BoardVO> getList(Criteria cri); // 게시물 가져오기.
	
	public List<BoardVO> getListListFree(Criteria cri); // 게시판 분류 자유 게시물 가져오기. 2024 09 28 
	
	public List<BoardVO> getListListQnA(Criteria cri); // 게시판 분류 질문답변 게시물 가져오기. 2024 09 28 
	
	public List<BookRequestVO> getRequestBookList(String r_bookUserId, Criteria cri); // 요청게시물 가져오기 2024 09 30

	public int updateRequestBook(BookRequestVO Rvo); // 요청게시물 가져오기(번호이용) 2024 10 01
	
	public List<BookRequestVO> adminRequestBookList(Criteria cri); // [관리자]요청게시물 전체 가져오기 2024 10 01
	
	public int updateBookPoint(BookPointVO Pvo); // 포인트 철회 2024 10 03
	
	public int getTotal(Criteria cri); // 게시글 수 카운트
	
	public int getTotalListFree(Criteria cri); // 게시판 분류 자유 게시글 수 카운트 2024 09 28 
	
	public int getTotalListQnA(Criteria cri); // 게시판 분류 질문답변 게시글 수 카운트 2024 09 28 
	
	public List<BoardAttachVO> getAttachList(Long bno); // 첨부파일 리스트 가져오기
	
	//게시글 좋아요 여부
	
	public LikeVO serviceCheckLike(Long bno); // 게시글 좋아요 여부 판단 
	
	public void serviceInsertLike(String likeUserId, Long bno) throws Exception; // 게시글 좋아요 (좋아요)
	
	public int serviceDeleteLike(String likeUserId, Long bno) throws Exception; // 게시글 좋아요 한번더 (좋아요 취소)
	
	
	// 포인트 관련
	
	public void boardAddPoint(String userId); // 게시글 작성시 50 포인트 [유저테이블] 2024 10 02
	
	public void allPointHistory(BookPointVO vo); // 포인트 로그 기록 2024 10 02
	
	public void bookRequestPoint(String requestBoard); // 도서 요청시 500 포인트 차감[유저테이블] 2024 10 02

	public void userJoinPoint(String userId); // 회원가입 시 1000포인트[유저테이블] 2024 10 02

	public List<BookPointVO> getMyPointList(String bookPointUserId, Criteria cri); // 포인트 리스트 가져오기 2024 10 03

	public List<BookPointVO> adminPointList(Criteria cri); // 전체 포인트 리스트 [관리자]가져오기 2024 10 03

}
