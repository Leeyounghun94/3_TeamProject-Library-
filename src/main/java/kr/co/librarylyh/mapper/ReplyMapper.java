package kr.co.librarylyh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.librarylyh.domain.Criteria;
import kr.co.librarylyh.domain.ReplyVO;


public interface ReplyMapper {
	// xml와 연동해서 sql 처리
	// 추상메서드가 필요하다.
	
	public int insert(ReplyVO vo); // 외부에서 폼으로 ReplyVO 객체가 넘어오고 리턴은 int가 됨.
	
	public ReplyVO read(Long rno); // 댓글 번호를 가지고 댓글(객체)을 가져옴
	
	public int update(ReplyVO vo); // 객체가 넘어가서 수정됨 결과는 int 처리
	
	public int delete (Long rno); // 댓글 번호를 가지고 레코드를 삭제 후에 int가 리턴 됨
	
	// 댓글 리스트 : 페이징 처리 + bno (pk+fk) -> 여러개의 파라미터인 경우 @Param()을 사용하면 편리함
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
//												    페이징처리 기준점, 게시물의 번호 pk+fk
	
	//댓글의 숫자 파악
	public int getCountByBno(Long bno);
	
}
