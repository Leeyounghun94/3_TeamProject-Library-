package kr.co.librarylyh.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ReplyPageDTO {
	
	private int replyCnt; // 댓글 수 
	private List<ReplyVO> list; // 댓글 목록
}
