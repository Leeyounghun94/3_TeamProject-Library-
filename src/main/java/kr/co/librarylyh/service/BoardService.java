package kr.co.librarylyh.service;

import java.util.List;

import kr.co.librarylyh.domain.BoardAttachVO;
import kr.co.librarylyh.domain.BoardVO;
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

	// public List<BoardVO> getList();

	public List<BoardVO> getList(Criteria cri); // 게시물 가져오기.
	
	public List<BoardVO> getListListFree(Criteria cri); // 게시판 분류 자유 게시물 가져오기. 2024 09 28 
	
	public List<BoardVO> getListListQnA(Criteria cri); // 게시판 분류 질문답변 게시물 가져오기. 2024 09 28 
	
	public List<BookRequestVO> getRequestBookList(String r_bookUserId); // 요청게시물 가져오기 2024 09 30


	public int getTotal(Criteria cri); // 게시글 수 카운트
	
	public int getTotalListFree(Criteria cri); // 게시판 분류 자유 게시글 수 카운트 2024 09 28 
	
	public int getTotalListQnA(Criteria cri); // 게시판 분류 질문답변 게시글 수 카운트 2024 09 28 
	
	public List<BoardAttachVO> getAttachList(Long bno); // 첨부파일 리스트 가져오기
	
	//게시글 좋아요 여부
	
	public LikeVO serviceCheckLike(Long bno); // 게시글 좋아요 여부 판단 
	
	public void serviceInsertLike(String likeUserId, Long bno) throws Exception; // 게시글 좋아요 (좋아요)
	
	public int serviceDeleteLike(String likeUserId, Long bno) throws Exception; // 게시글 좋아요 한번더 (좋아요 취소)
	
	
	


}
