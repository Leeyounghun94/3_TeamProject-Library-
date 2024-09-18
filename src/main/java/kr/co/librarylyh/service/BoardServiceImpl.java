package kr.co.librarylyh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.librarylyh.domain.BoardAttachVO;
import kr.co.librarylyh.domain.BoardVO;
import kr.co.librarylyh.domain.Criteria;
import kr.co.librarylyh.domain.LikeVO;
import kr.co.librarylyh.mapper.BoardAttachMapper;
import kr.co.librarylyh.mapper.BoardMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;
	

	@Transactional
	@Override
	public void register(BoardVO board) {

		log.info("register......" + board);

		mapper.insertSelectKey(board);

		if (board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}

		board.getAttachList().forEach(attach -> {

			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
	}

	/* @Override
	public BoardVO get(Long bno) {

		log.info("get......" + bno);

		return mapper.read(bno);

	}*/
	
	//게시물 조회수
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO get(Long bno) throws Exception{
		mapper.boardViewNum(bno); // 해당 메서드 실행 하여 조회수 증가
		return mapper.read(bno); // 해당 게시물을 읽어와 반환
	}
	
	
	@Transactional
	@Override
	public boolean modify(BoardVO board) {

		log.info("modify......" + board);

		attachMapper.deleteAll(board.getBno());

		boolean modifyResult = mapper.update(board) == 1;
		
		if (modifyResult && board.getAttachList().size() > 0) {

			board.getAttachList().forEach(attach -> {

				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			});
		}

		return modifyResult;
	}

	@Override
	public boolean remove(Long bno) {

		log.info("remove...." + bno);
		
		attachMapper.deleteAll(bno);

		return mapper.delete(bno) == 1; // 매서드의 반환값이 1인지 확인하는 조건 
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {

		log.info("get List with criteria: " + cri);

		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {

		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override // 첨부파일 관련 
	public List<BoardAttachVO> getAttachList(Long bno) {

		log.info("get Attach list by bno" + bno);
		return attachMapper.findByBno(bno);
	}

	@Override
	public LikeVO serviceCheckLike(Long bno) {
		// TODO Auto-generated method stub
		
		return mapper.checkLike(bno);
	}

	@Override
	public void serviceInsertLike(String userId, Long bno) {
		// TODO Auto-generated method stub
		mapper.insertLike(userId, bno);
	}

	@Override
	public int serviceDeleteLike(LikeVO likeVO) {
		// TODO Auto-generated method stub
		return mapper.deleteLike(likeVO);
	}

	@Override
	public int serviceCountLike(Long bno) {
		// TODO Auto-generated method stub
		return mapper.countLike(bno);
	}
	

}
