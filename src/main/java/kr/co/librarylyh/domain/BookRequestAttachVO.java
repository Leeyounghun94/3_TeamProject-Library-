package kr.co.librarylyh.domain;

import lombok.Data;

@Data
public class BookRequestAttachVO {
	
	private String r_uuid;
	private String r_uploadPath;
	private String r_fileName;
	private boolean r_fileType;
	
	private Long r_bno;

}
