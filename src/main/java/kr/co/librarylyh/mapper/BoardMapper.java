package kr.co.librarylyh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.librarylyh.domain.BoardVO;
import kr.co.librarylyh.domain.Criteria;
import kr.co.librarylyh.domain.LikeVO;

public interface BoardMapper {

	public List<BoardVO> getList();

	public List<BoardVO> getListWithPaging(Criteria cri);

	public void insert(BoardVO board);

	public Integer insertSelectKey(BoardVO board);

	public BoardVO read(Long bno);

	public int delete(Long bno);

	public int update(BoardVO board);

	public int getTotalCount(Criteria cri);
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	
	public void boardViewNum(Long bno) throws Exception; // 게시물 조회수

	//게시글 좋아요 여부
	public LikeVO checkLike(Long bno); // 게시글 좋아요 여부 판단 
	
	public void insertLike(String userId, Long bno); // 게시글 좋아요 (좋아요)
	
	public int deleteLike(LikeVO likeVO); // 게시글 좋아요 한번더 (좋아요 취소)
	
	public int countLike(Long bno); // 좋아요 갯수가 몇개인지
	
}
