package com.debugking.www.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Follower {
	private int followerNum; //followerNumSeq
	private String memberId;
	private String followName;
	//1  follower
	//2  following
	private int followType;
}
