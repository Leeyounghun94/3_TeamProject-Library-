package kr.co.librarylyh.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

  private int startPage;
  private int endPage;
  private boolean prev, next;

  private int total;
  private Criteria cri;
  private String category; // 게시글 분류 2024 09 28

  public PageDTO(Criteria cri, int total) {

    this.cri = cri;
    this.total = total;

    this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;

    this.startPage = this.endPage - 9;

    int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

    if (realEnd <= this.endPage) {
      this.endPage = realEnd;
    }

    this.prev = this.startPage > 1; // 이전 페이지 영역 버튼 (ex 11~20 > 1~10 페이지 이동)

    this.next = this.endPage < realEnd; // 다음 페이지 영역 버튼
    
  } // end PageDTO
  
}

