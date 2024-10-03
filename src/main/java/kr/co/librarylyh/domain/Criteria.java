package kr.co.librarylyh.domain;



import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
@Setter
@Getter
public class Criteria {

  private int pageNum; // 페이지 번호
  private int amount; // 한 페이지에 나올 데이터량
  
  private String type;
  private String keyword;
  private String category; // 게시글 분류 2024 09 28
  private String replyerUserId;
  
  
  public Criteria() {
    this(1, 10);
  }

  public Criteria(int pageNum, int amount) {
    this.pageNum = pageNum;
    this.amount = amount;
  }
  

  // MyBatis는 원하는 속성을 찾을 때 getTypeArr()과 같이 이름에 기반을 두어서 검색
  
  public String[] getTypeArr() {
	  
    return type == null? new String[] {}: type.split("");
  }
  

	public String getListLink() {

		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
				

		return builder.toUriString();

	}
	
}
