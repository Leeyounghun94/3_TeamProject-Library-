package kr.co.librarylyh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.librarylyh.domain.BoardVO;
import kr.co.librarylyh.domain.Criteria;
import kr.co.librarylyh.domain.LikeVO;

public interface BoardMapper {

	public List<BoardVO> getList();

	public List<BoardVO> getListWithPaging(Criteria cri);

	// public void insert(BoardVO board);

	public Integer insertSelectKey(BoardVO board); // 게시글 등록

	public BoardVO read(Long bno); // 특정 게시글 읽기

	public int delete(Long bno); // 게시글 삭제

	public int update(BoardVO board); // 게시글 수정

	public int getTotalCount(Criteria cri); // 게시글 수 카운트
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	
	public void boardViewNum(Long bno) throws Exception; // 게시물 조회수

	//게시글 좋아요 여부
	
	public LikeVO checkLike(Long bno); // 게시글 좋아요 여부 판단 
	
	public void insertLike(String likeUserId, Long bno); // 게시글 좋아요 (좋아요)
	
	public int deleteLike(String likeUserId, Long bno); // 게시글 좋아요 한번더 (좋아요 취소)
	
	public void boardLikeNumUp(Long bno) throws Exception; // tbl_board 게시글 좋아요 수 증가
	
	public void boardLikeNumDown(Long bno) throws Exception; // tbl_board 게시글 좋아요 수 감소
	
	//public int countLike(Long bno); // 좋아요 갯수가 몇개인지
	
	
	// 게시글 제목 옆에 뜨게
	public void insertFileName(BoardVO board);
	
}
