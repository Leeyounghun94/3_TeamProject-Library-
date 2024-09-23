package kr.co.librarylyh.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.format.annotation.DateTimeFormat;
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
import kr.co.librarylyh.domain.Criteria;
import kr.co.librarylyh.domain.PageDTO;
import kr.co.librarylyh.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;


 

@Controller
@Log4j2
@RequestMapping("/library/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;/////중요
	
	
	@GetMapping("/board/register")
	public void register() {

	}

	@GetMapping("/list")
	public void list(Criteria cri, Model model, Long bno) {

		model.addAttribute("list", service.getList(cri)); // 게시물 리스트

		int total = service.getTotal(cri); // 총 게시물 수

		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total)); // 페이징 객체 전달
		
		
	}
	
	@PostMapping("/board/register")
	public String register(BoardVO board, RedirectAttributes rttr) {

		log.info("==========================");

		log.info("register: " + board);

		if (board.getAttachList() != null) {

			board.getAttachList().forEach(attach -> log.info(attach));

		}

		log.info("==========================");

		service.register(board); // 보드 객체를 사용하여 글을 등록하고
		
		
		rttr.addFlashAttribute("result", board.getBno()); // 그 글을 떙겨오면 몇번 값인지 알수있음

		return "redirect:/library/list"; // 게시물을 등록하고 그 값을 list로 보낸다 + list 페이지로 이동 된다.
	}
	

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

		return "redirect:/library/list";
	}

	@PostMapping("/board/remove")
	public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {

		log.info("remove..." + bno);

		List<BoardAttachVO> attachList = service.getAttachList(bno);

		if (service.remove(bno)) {

			// delete Attach Files
			deleteFiles(attachList);

			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/library/list" + cri.getListLink();
	}
	
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
