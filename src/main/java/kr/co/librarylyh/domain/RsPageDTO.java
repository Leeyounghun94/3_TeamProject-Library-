package kr.co.librarylyh.domain;

import lombok.Data;

@Data
public class RsPageDTO {

	
	// Reservation - Paging 처리
	
	private int startPage ; // 시작 페이지 
	
	private int endPage ; // 마지막 페이지 
	
	private boolean prev, next; // 이전, 다음
	
	private int total; // 전체 게시물 수
	
	private Criteria cri;
	
	
	/* 생성자 */
    public RsPageDTO(Criteria cri, int total) {
        
        this.cri = cri;
        this.total = total;
        
        /* 마지막 페이지 */
        this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
        
        /* 시작 페이지 */
        this.startPage = this.endPage - 9;
        
        /* 전체 마지막 페이지 */
        int realEnd = (int)(Math.ceil(total * 1.0/cri.getAmount()));
        
        /* 전체 마지막 페이지(realend)가 화면에 보이는 마지막페이지(endPage)보다 작은 경우, 보이는 페이지(endPage) 값 조정 */
        if(realEnd < this.endPage) {
            this.endPage = realEnd;
        }
        
        /* 시작 페이지(startPage)값이 1보다 큰 경우 true */
        this.prev = this.startPage > 1;
        
        /* 마지막 페이지(endPage)값이 1보다 큰 경우 true */
        this.next = this.endPage < realEnd;
	
	
    }
}
