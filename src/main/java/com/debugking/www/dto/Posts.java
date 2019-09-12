package com.debugking.www.dto;

import lombok.Data;

@Data
public class Posts {
	private int postNo;
	private String memberId;
	private String fileName;
	private String postTitle;
	private String postContent;
	private int postView;
	private int postLike;
	private String isBest;		//DEFAULT 'N'
	private String postdate;
	private String isAnnouncement;	//DEFAULT 'N',
}
