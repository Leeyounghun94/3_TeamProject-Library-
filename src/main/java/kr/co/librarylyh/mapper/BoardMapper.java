package kr.co.librarylyh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.librarylyh.domain.BoardVO;
import kr.co.librarylyh.domain.BookPointVO;
import kr.co.librarylyh.domain.BookRequestVO;
import kr.co.librarylyh.domain.Criteria;
import kr.co.librarylyh.domain.LikeVO;

public interface BoardMapper {

	public List<BoardVO> getList();

	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public List<BoardVO> getListWithPagingListFree(Criteria cri); // 게시판 분류 자유게시물 출력 2024 09 28
	
	public List<BoardVO> getListWithPagingListQnA(Criteria cri); // 게시판 분류 질문답변 게시물 출력 2024 09 28
	
	public List<BookRequestVO> getRequestBookList(@Param("r_bookUserId") String r_bookUserId, @Param("cri") Criteria cri); // 요청게시물 가져오기 2024 09 30

	public int updateRequestBook(BookRequestVO Rvo); // 요청게시물 수정(번호이용) 2024 10 01
	
	public List<BookRequestVO> adminRequestBookList(Criteria cri); // 요청게시물 가져오기 2024 10 01

	
	// public void insert(BoardVO board);

	public Integer insertSelectKey(BoardVO board); // 게시글 등록
	
	public Integer insertSelectKeyRequest(BookRequestVO bookRequest); // 희망 도서요청 게시글 등록 2024 09 30

	public BoardVO read(Long bno); // 특정 게시글 읽기

	public int delete(Long bno); // 게시글 삭제
	
	public int deleteRequestBook(Long r_bookBno); // 희망 도서 요청 게시글 삭제 2024 10 01

	public int update(BoardVO board); // 게시글 수정

	public int getTotalCount(Criteria cri); // 게시글 수 카운트
	
	public int getTotalCountListFree(Criteria cri); // 게시판 분류 자유 게시글 수 카운트 2024 09 28
	
	public int getTotalCountListQnA(Criteria cri); // 게시판 분류 질문답변 게시글 수 카운트 2024 09 28
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	
	public void boardViewNum(Long bno) throws Exception; // 게시물 조회수

	//게시글 좋아요 여부
	
	public LikeVO checkLike(Long bno); // 게시글 좋아요 여부 판단 
	
	public void insertLike(@Param("likeUserId") String likeUserId, @Param("bno") Long bno); // 게시글 좋아요 (좋아요)
	
	public int deleteLike(@Param("likeUserId") String likeUserId, @Param("bno") Long bno); // 게시글 좋아요 한번더 (좋아요 취소)
	
	public void boardLikeNumUp(Long bno) throws Exception; // tbl_board 게시글 좋아요 수 증가
	
	public void boardLikeNumDown(Long bno) throws Exception; // tbl_board 게시글 좋아요 수 감소
	
	//public int countLike(Long bno); // 좋아요 갯수가 몇개인지
	
	
	// 게시글 제목 옆에 뜨게
	public void insertFileName(BoardVO board);
	
	// 포인트 관련
	public void boardAddPoint(String userId); // 게시글 작성시 50 포인트[유저테이블] 2024 10 02
	
	public void bookRequestPoint(String requestBoard); // 도서 요청시 500 포인트 차감[유저테이블] 2024 10 02
	
	public void userJoinPoint(String userId); // 회원가입 시 1000포인트[유저테이블] 2024 10 02
	
	public void allPointHistory(BookPointVO vo); // 포인트 로그 기록 2024 10 02
	
	
	
}
