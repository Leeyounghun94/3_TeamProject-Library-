package kr.co.librarylyh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.librarylyh.domain.BoardAttachVO;
import kr.co.librarylyh.domain.BoardVO;
import kr.co.librarylyh.domain.BookRequestVO;
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
		board.getAttachList().forEach(attach -> { // 첨부파일 이름 및 경로 첨부파일_테이블에 저장
			attach.setBno(board.getBno());
			attachMapper.insert(attach); // BoardAttachVO.java의 insert
			attachMapper.insertBoard(attach); // 첨부파일 이름 및 경로 게시글_테이블에 저장
		});
	}
	
	public void registerRequest(BookRequestVO bookRequest) { // 희망 도서 요청 파일 값 2024 09 30

		log.info("register......" + bookRequest);

		mapper.insertSelectKeyRequest(bookRequest); // 희망도서 게시글 추가

		if (bookRequest.getAttachListRequest() == null || bookRequest.getAttachListRequest().size() <= 0) {
			return;
		}
		bookRequest.getAttachListRequest().forEach(attach -> { // 첨부파일 이름 및 경로 첨부파일_테이블에 저장
			attach.setR_bno(bookRequest.getR_bookBno()); // 추가된 희망도서의 bno값을 attach에 다 넣어줌 (set)
			attachMapper.insertRequest(attach); // 요청한 도서 번호를 이용하여, 그 번호에 적용된 첨부파일 경로 입력
		});
	}


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

		attachMapper.deleteAll(board.getBno()); // 수정 버튼 시 기존 첨부파일 삭제 (해당 게시글의 tbl_attach의 데이터 삭제)
		
		log.info("삭제 성공......" + attachMapper);
		
		boolean modifyResult = mapper.update(board) == 1; // 기입 된 내용 수정(제목, 내용, 카테고리등.. update) 후 업로드 결과 boolean
		
		log.info("업데이트 성공(글수정 쿼리)......" + modifyResult);
		
		log.info("첨부파일 변화 확인......" + board.getAttachList());
		
		if (modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0) { // 수정되 었고(modifyResult = 1), 첨부파일 리스트 사이즈 둘 다 1보다 클 경우

			board.getAttachList().forEach(attach -> { // 첨부파일 수만큼( 여러 파일 첨부)
				
				log.info("board....리스트출력 확인" + board ); // 리스트 출력 확인
				
				attach.setBno(board.getBno()); // attach에 bno를 추가 (BoardAttachVO에 bno값을 넣어 줌)
				attachMapper.insert(attach); // 첨부파일 경로 tbl_attach 에 추가
				attachMapper.insertBoard(attach); // 첨부파일 변경시 이미지 들어가게끔
			}); // end if 
			return modifyResult;
		}
		attachMapper.insertBoardNoImage(board.getBno()); // 첨부파일 삭제 경우 .no 입력하여 제목우측 이미지 제거
		return modifyResult; // 첨부파일이 없을 경우 boolean 결과 값만 반환
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
	public List<BoardVO> getListListFree(Criteria cri) { // 게시글 분류 자유 게시판 2024 09 28

		log.info("get List with criteria: " + cri);

		return mapper.getListWithPagingListFree(cri);
	}
	
	@Override
	public List<BoardVO> getListListQnA(Criteria cri) { // 게시글 분류 질문답변 게시판 2024 09 28

		log.info("get List with criteria: " + cri);

		return mapper.getListWithPagingListQnA(cri);
	}
	
	@Override
	public List<BookRequestVO> getRequestBookList(String r_bookUserId) { // 게시글 분류 질문답변 게시판 2024 09 28

		return mapper.getRequestBookList(r_bookUserId);
	}
	
	@Override
	public List<BookRequestVO> adminRequestBookList() { // 게시글 분류 질문답변 게시판 2024 09 28

		return mapper.adminRequestBookList();
	}
	
	
	@Override
	public int updateRequestBook(BookRequestVO Rvo) { // 요청게시물 수정(번호이용) 2024 10 01
		return mapper.updateRequestBook(Rvo); // userController 에서 이용중
	}
	
	@Override
	public int deleteRequestBook(Long r_bookBno) { 	// 희망 도서 요청 게시글 삭제 2024 10 01
		return mapper.deleteRequestBook(r_bookBno); // userController 에서 이용중
	}


	
	@Override
	public int getTotal(Criteria cri) {

		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public int getTotalListFree(Criteria cri) { // 게시글 분류 자유 게시판 2024 09 28

		log.info("get total count");
		return mapper.getTotalCountListFree(cri);
	}
	
	@Override
	public int getTotalListQnA(Criteria cri) { // 게시글 분류 질문답변 게시판 2024 09 28

		log.info("get total count");
		return mapper.getTotalCountListQnA(cri);
	}
	
	// 첨부파일 관련 
	@Override 
	public List<BoardAttachVO> getAttachList(Long bno) {

		log.info("get Attach list by bno" + bno);
		return attachMapper.findByBno(bno);
	}
	
	// 게시글 좋아요 관련
	
	@Override
	public LikeVO serviceCheckLike(Long bno) {  // 게시글 좋아요 여부
		// TODO Auto-generated method stub
		
		return mapper.checkLike(bno);
	}


	@Override
	public void serviceInsertLike(String likeUserId, Long bno) throws Exception { // 게시글 좋아요 (좋아요 상승)
		// TODO Auto-generated method stub
		mapper.boardLikeNumUp(bno); // 해당 메서드 실행 하여 조회수 증가
		
		mapper.insertLike(likeUserId, bno);
	}

	@Override
	public int serviceDeleteLike(String likeUserId, Long bno) throws Exception { // 게시글 좋아요 (좋아요 하락)
		// TODO Auto-generated method stub
		mapper.boardLikeNumDown(bno);
		return mapper.deleteLike(likeUserId, bno);
	}



	/*@Override
	public int serviceCountLike(Long bno) {
		// TODO Auto-generated method stub
		return mapper.countLike(bno);
	}*/
	

}
