package kr.co.librarylyh.domain;

import lombok.Data;

@Data
public class RsPageDTO {

	
	// Reservation - Paging 처리
	
	private int pageSize = 10;	// 한 페이지 안에서 보여줄 게시글 수
	
	private int blockSize = 10; // 현재 페이지에서 블럭의 최대 수 (10개)
	
	private int page = 1; // 현재 페이지
	
	private int block = 1; // 현재 페이지 블럭
	

	
	private int startPage ; // 시작 페이지 
	
	private int endPage ; // 마지막 페이지 
	
	private int startIndex = 0; // 현재 인덱스 
	
	private int prevBlockPage ; // 이전 블럭의 마지막 페이지
	
	private int nextBlockPage; // 다음 블럭의 시작 페이지
	
	
	

}
