package com.debugking.www.dto;

import lombok.Data;

@Data
public class Replies {
	private int replyNo;  //replyNoSeq
	private String memberId;
	private String replyContent;
	private String replyDate;
	private int postNo;
}
