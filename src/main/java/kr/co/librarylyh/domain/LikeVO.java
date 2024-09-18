package kr.co.librarylyh.domain;

import lombok.Data;

@Data
public class LikeVO {
	private Long bno; // 게시물 번호
	private String userId; // 좋아요 누른 유저의 아이디

}
