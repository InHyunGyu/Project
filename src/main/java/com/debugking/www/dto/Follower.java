package com.debugking.www.dto;

import java.util.ArrayList;

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
}
