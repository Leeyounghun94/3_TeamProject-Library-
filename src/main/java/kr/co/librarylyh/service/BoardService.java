package kr.co.librarylyh.service;

import java.util.List;

import kr.co.librarylyh.domain.BoardAttachVO;
import kr.co.librarylyh.domain.BoardVO;
import kr.co.librarylyh.domain.Criteria;
import kr.co.librarylyh.domain.LikeVO;

// 컨트롤러랑 직접적인 거래하는 애임. 서비스에서 impl이랑 중개해줌.
public interface BoardService {

	public void register(BoardVO board);

	// public BoardVO get(Long bno);
	public BoardVO get(Long bno) throws Exception; // 게시물 조회수

	public boolean modify(BoardVO board);

	public boolean remove(Long bno);

	// public List<BoardVO> getList();

	public List<BoardVO> getList(Criteria cri);

	//추가
	public int getTotal(Criteria cri);
	
	public List<BoardAttachVO> getAttachList(Long bno);
	
	//게시글 좋아요 여부
	public LikeVO serviceCheckLike(Long bno); // 게시글 좋아요 여부 판단 
	
	public void serviceInsertLike(String userId, Long bno); // 게시글 좋아요 (좋아요)
	
	public int serviceDeleteLike(LikeVO likeVO); // 게시글 좋아요 한번더 (좋아요 취소)
	
	public int serviceCountLike(Long bno); // 좋아요 갯수가 몇개인지
	
	


}
