package kr.co.librarylyh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.librarylyh.domain.Criteria;
import kr.co.librarylyh.domain.ReplyPageDTO;
import kr.co.librarylyh.domain.ReplyVO;
import kr.co.librarylyh.mapper.BoardMapper;
import kr.co.librarylyh.mapper.ReplyMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service // 스프링에서 서비스 담당임을 알아 감.
@Log4j2
public class ReplyServiceImpl implements ReplyService{

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;

	
/*	@Override
	public int register(ReplyVO vo) {
		log.info("ReplyServiceImpl.register() 메서드 실행" + vo);
		return mapper.insert(vo);
	}*/
	
	@Transactional
	@Override
	public int register(ReplyVO vo) {

		log.info("register......" + vo);

		boardMapper.updateReplyCnt(vo.getBno(), 1);

		return mapper.insert(vo);

	}

	@Override
	public ReplyVO get(Long rno) {
		log.info("ReplyServiceImpl.get() 메서드 실행" + rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("ReplyServiceImpl.modify() 메서드 실행" + vo);
		return mapper.update(vo);
	}

/*	@Override
	public int remove(Long rno) {
		log.info("ReplyServiceImpl.remove() 메서드 실행" + rno);
		return mapper.delete(rno);
	}*/
	
	@Transactional
	@Override
	public int remove(Long rno) {

		log.info("remove...." + rno);

		ReplyVO vo = mapper.read(rno);

		boardMapper.updateReplyCnt(vo.getBno(), -1);
		return mapper.delete(rno);

	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		log.info("ReplyServiceImpl.getList() 메서드 실행, 게시물 번호: " + bno);
		return mapper.getListWithPaging(cri, bno);
	}
	
	// 댓글 페이징 처리 관련
	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		log.info("ReplyServiceImpl.getListPage() 메서드 실행, 댓글이 해당하는 게시물 번호: " + bno);
		return new ReplyPageDTO(mapper.getCountByBno(bno), mapper.getListWithPaging(cri, bno));
	}
	
	// 댓글 작성시 회원 포인트 5 추가 - 2024 10 02
	@Override
	public void replyAddPoint(String userId) {
		mapper.replyAddPoint(userId);
	}
	



	
}// ReplyService의 구현 클래스
