package kr.co.librarylyh.domain;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {

  private Long bno;
  private String title;
  private String content;
  private String category;
  private Date regdate;
  private Date updateDate;
  private String nickName;
  
  private int replyCnt; // 댓글 수
  private Long viewNum; // 게시글 조회수
  private Long likeNum; // 게시글 좋아요 수 
  
  
  private String fileName; // 원본 파일 이름
  private String uploadPath; // 업로드 경로
  private String uuid; // UUID 값
  
  private LocalDate startDate;
  private LocalDate endDate;
  
  
  private List<BoardAttachVO> attachList;
  
}
