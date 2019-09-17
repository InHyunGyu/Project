package com.debugking.www.dto;

import lombok.Data;

@Data
public class follower {
	private int followerNum; //followerNumSeq
	private String memberId;
	private String followName;
	//1  follower
	//2  following
	private int followType;
}
