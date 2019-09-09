package com.debugking.www.dto;

import lombok.Data;

@Data
public class MemberInfo {
	private int memberNum;
	private String memberid;//
	private String memberpwd;//
	private String membername;
	private String memberphone;//
	private String memberbirth;
	private String signupDate;
	private String memberAddress;
	private String memberEmail;//
	private int memberpoint;
	private int isManager;
	private String recommender;
	private String clubNum;
}
