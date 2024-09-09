package kr.co.librarylyh.domain;

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
  
  
  private List<BoardAttachVO> attachList;
}
