package kr.co.librarylyh.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.librarylyh.domain.BoardAttachVO;
import kr.co.librarylyh.domain.BoardVO;
import kr.co.librarylyh.domain.BookPointVO;
import kr.co.librarylyh.domain.BookRequestVO;
import kr.co.librarylyh.domain.Criteria;
import kr.co.librarylyh.domain.PageDTO;
import kr.co.librarylyh.domain.UserVO;
import kr.co.librarylyh.service.BoardService;
import kr.co.librarylyh.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;


 

@Controller
@Log4j2
@RequestMapping("/library/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;/////중요
	private UserService userService;
	
	
	@GetMapping("/board/register")
	public void register() {

	}

	@GetMapping("/list") // 메인(기존) 게시판
	public void list(Criteria cri, Model model, Long bno) {

	    
		model.addAttribute("list", service.getList(cri)); // 게시물 리스트

		int total = service.getTotal(cri); // 총 게시물 수

		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total)); // 페이징 객체 전달
		
	}
	
	@GetMapping("/listFree") // 자유 게시판
	public void listFree(Criteria cri, Model model, Long bno) {
		
	    
		model.addAttribute("list", service.getListListFree(cri)); // 게시물 리스트

		int total = service.getTotalListFree(cri); // 총 게시물 수

		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total)); // 페이징 객체 전달
		
	}
	
	@GetMapping("/listQnA") // 질문답변(QnA) 게시판
	public void listQnA(Criteria cri, Model model, Long bno) {
		
	    
		model.addAttribute("list", service.getListListQnA(cri)); // 게시물 리스트

		int total = service.getTotalListQnA(cri); // 총 게시물 수

		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total)); // 페이징 객체 전달
		
	}
	
	
	@PostMapping("/board/register") // 새글 작성
	public String register(BoardVO board, RedirectAttributes rttr, HttpServletRequest request) {

		log.info("==========================");

		log.info("register: " + board);

		if (board.getAttachList() != null) {

			board.getAttachList().forEach(attach -> log.info(attach));

		}

		log.info("==========================");

		service.register(board); // 보드 객체를 사용하여 글을 등록하고
		
		
    	HttpSession session = request.getSession();
    	
    	// 게시글 작성시 포인트 증가 및 로그기록 2024 10 02
    	String userU_id = (String) session.getAttribute("userU_id"); // 로그인 시 발생한 세션 : userU_id 따로 분리 2024 10 02
    	
    	UserVO Uvo = userService.read(userU_id);
    	
    	String id = Uvo.getId();// 로그인 시 발생한 세션 : id 따로 분리 2024 10 02
    	
    	String nickName = Uvo.getNickName();// 로그인 시 발생한 세션 : userNickName 따로 분리 2024 10 02

    	int userPoint = Uvo.getPoint() + 50; // 로그인 시 발생한 세션 : point 따로 분리 2024 10 02

    	// 포인트 총량을 세션으로 가져오니 최신화가 안됨, 그래서 포인트를 가져오는 sql 문을 작성하기로함
		int bookPoint = 50; // 포인트 50 증가
		
		String bookPointHistory = "게시글 작성 포인트 증가";
		
    	service.boardAddPoint(id); // 게시글 유저 포인트 추가 2024 10 02
    	
    	BookPointVO vo = new BookPointVO();
    	
    	vo.setBookPoint(bookPoint);
    	vo.setBookPointTotal(userPoint);
    	vo.setBookPointHistory(bookPointHistory);
    	vo.setBookPointUserId(id);
    	vo.setBookPointNickName(nickName);
    	
    	service.allPointHistory(vo); // 게시글 작성 로그 기록
    	
		rttr.addFlashAttribute("result", board.getBno()); // 그 글을 떙겨오면 몇번 값인지 알수있음
		
		String pathreturn = board.getCategory(); // 게시판 분류 2024 09 29

		
		if(pathreturn.equals("자유")) { // 게시물 분류에 따른 경로 변경 2024 09 28
			
			return "redirect:/library/listFree";
			
		}else if(pathreturn.equals("QnA")) {
			
			return "redirect:/library/listQnA";
			
		}
			return "redirect:/library/list";
		
	}
	
	@GetMapping("/listRequest") // 도서 요청 게시판
	public void listRequest() {
		
	}
	
	 // 도서 요청 하기 2024 09 30
	@PostMapping("/listRequest")
	public String registerBookRequest(BookRequestVO requestBoard, RedirectAttributes rttr, HttpServletRequest request) {

		log.info("==========================");

		log.info("register: " + requestBoard);

		if (requestBoard.getAttachListRequest() != null) { // 첨부 파일이 있을 경우

			requestBoard.getAttachListRequest().forEach(attach -> log.info(attach));

		}

		log.info("==========================");
		

			service.registerRequest(requestBoard); // 보드 객체를 사용하여 도서 글을 등록
			
			if(requestBoard != null) { // 도서 요청글을 작성할 경우 매서드 시작
			
	    	HttpSession session = request.getSession();
	    	
	    	// 게시글 작성시 포인트 증가 및 로그기록 2024 10 02
	    	String userU_id = (String) session.getAttribute("userU_id"); // 로그인 시 발생한 세션 : userU_id 따로 분리 2024 10 02
	    	
	    	UserVO Uvo = userService.read(userU_id);
	    	
	    	int userPointChk = Uvo.getPoint(); // 유저가 보유한 포인트
	    	
	    	// 조건 추가, 포인트가 0 미만 일 경우 도서 요청 작성 제한 2024 10 03
		    	if (userPointChk - 500 > 0) {
		    		
			    	String id = Uvo.getId();// 로그인 시 발생한 세션 : id 따로 분리 2024 10 02
			    	
			    	String nickName = Uvo.getNickName();// 로그인 시 발생한 세션 : userNickName 따로 분리 2024 10 02
			    	
			    	int userPoint = Uvo.getPoint() - 500; // 로그인 시 발생한 세션 : point 따로 분리 2024 10 02
	
			    	// 포인트 총량을 세션으로 가져오니 최신화가 안됨, 그래서 포인트를 가져오는 sql 문을 작성하기로함
					int bookPoint = -500; // 포인트 50 증가
					
					String bookPointHistory = "도서 요청으로 포인트감소";
					
					service.bookRequestPoint(id);
					
			    	BookPointVO vo = new BookPointVO();
			    	
			    	vo.setBookPoint(bookPoint);
			    	vo.setBookPointTotal(userPoint);
			    	vo.setBookPointHistory(bookPointHistory);
			    	vo.setBookPointUserId(id);
			    	vo.setBookPointNickName(nickName);
			    	
			    	service.allPointHistory(vo); // 게시글 작성 로그 기록
			    	

					service.registerRequest(requestBoard); // 보드 객체를 사용하여 도서 글을 등록
					
					
					rttr.addFlashAttribute("result", requestBoard.getR_bookBno()); // 번호를 가지고 모달창에 완료 문구띄우기
					
				}else {
					
					rttr.addFlashAttribute("result", "fail"); // 포인트 부족시 문구 반환
				}
	    	
	    	}
	    	


		
		return "redirect:/library/listRequest";
			
	}// end registerBookRequest


	@GetMapping({ "/board/get", "/board/modify" })
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		// @RequestParam 사용: 프론트에서 보내는 데이터 형식이 query parameters, form data, mulripart data일 경우
		//RequestParam을 통해 URL에서 추출된 bno 값을 이용하게 됨.
		log.info("/get or modify");
		model.addAttribute("board", service.get(bno));
		
		
		model.addAttribute("likeChk", service.serviceCheckLike(bno)); // 좋아요 체크 여부
		
		//model.addAttribute("likeCount", service.serviceCountLike(bno)); // 좋아요 갯수 파악
	}
	
	
	@PostMapping("/board/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("modify:" + board);

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("category", cri.getCategory());
		
		String pathreturn = board.getCategory();

		
		if(pathreturn.equals("자유")) { // 게시물 분류에 따른 경로 변경 2024 09 28
			
			return "redirect:/library/listFree";
			
		}else if(pathreturn.equals("QnA")) {
			
			return "redirect:/library/listQnA";
			
		}
			return "redirect:/library/list";
	}

	@PostMapping("/board/remove")
	public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr, BoardVO board) { // 게시물 분류 2024 09 29

		log.info("remove..." + bno);

		List<BoardAttachVO> attachList = service.getAttachList(bno);

		if (service.remove(bno)) {

			// delete Attach Files
			deleteFiles(attachList);

			rttr.addFlashAttribute("result", "success");
		}
		
		String pathreturn = board.getCategory();
		
		if(pathreturn.equals("자유")) { // 게시물 분류에 따른 경로 변경 2024 09 29
			
			return "redirect:/library/listFree"+ cri.getListLink();
			
		}else if(pathreturn.equals("QnA")) {
			
			return "redirect:/library/listQnA"+ cri.getListLink();
			
		}
			return "redirect:/library/list" + cri.getListLink(); 
			
	}
	
	// 첨부파일 리스트를 가져옴
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE) 
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno) {

	log.info("getAttachList " + bno);

	return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);

	}
	
	private void deleteFiles(List<BoardAttachVO> attachList) {
	    
	    if(attachList == null || attachList.size() == 0) {
	      return;
	    }
	    
	    log.info("delete attach files...................");
	    log.info(attachList);
	    
	    attachList.forEach(attach -> {
	      try {        
	        Path file  = Paths.get("D:\\upload\\"+attach.getUploadPath()+"\\" + attach.getUuid()+"_"+ attach.getFileName());
	        
	        Files.deleteIfExists(file);
	        
	        if(Files.probeContentType(file).startsWith("image")) {
	        
	          Path thumbNail = Paths.get("D:\\upload\\"+attach.getUploadPath()+"\\s_" + attach.getUuid()+"_"+ attach.getFileName());
	          
	          Files.delete(thumbNail);
	        }
	
	      }catch(Exception e) {
	        log.error("delete file error" + e.getMessage());
	      }//end catch
	    });//end foreachd
	  }
	
	
	//(빈 하트 일 때) 좋아요를 누를 경우 userId, bno를 받아 쿼리문 실행을 목적으로 함
	@PostMapping("/likeUp") // 좋아요 클릭 > 좋아요 수 증가
	@ResponseBody
	public void likeUp(@Param("likeUserId") String likeUserId, @Param("bno") Long bno) throws Exception {
		
		service.serviceInsertLike(likeUserId, bno);
		
		
	}// end likeUp *(ajax)
	
	//(색칠 하트 일 때) 좋아요를 누를 경우 userId, bno를 받아 쿼리문 실행을 목적으로 함
	@PostMapping("/likeDown") // 좋아요 클릭 > 좋아요 수 증가
	@ResponseBody
	public void likeDown(@Param("likeUserId") String likeUserId, @Param("bno") Long bno) throws Exception {
		
		service.serviceDeleteLike(likeUserId, bno);
		
		
	}// end likeDown *(ajax)
	
	
	

	

}
