package com.debugking.www.dto;

import lombok.Data;

@Data
public class Files {
	private int fileno;
	private String memberId;
	private int fileSize;
	private String fileName;
	private String fileDate;
	private int postNo;
	private int reported; //DEFAULT 0
	
}
