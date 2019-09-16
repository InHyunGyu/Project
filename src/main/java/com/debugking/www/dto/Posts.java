package com.debugking.www.dto;

import lombok.Data;

@Data
public class Posts {
	private int postNo;  //postNoSeq
	private String memberId;
	private String postTitle;
	private String postContent;
	private int postView;
	private int postLike;
	private String postDate;
	private String isAnnouncement;	//DEFAULT 'N',
	private String postType;
	private String originalFile;
	private String savedFile;
	private int reported;
}
