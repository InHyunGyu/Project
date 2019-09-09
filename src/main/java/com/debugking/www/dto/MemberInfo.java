package com.debugking.www.dto;

import lombok.Data;

@Data
public class MemberInfo {
	private int memberNum;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberPhone;//
	private String memberBirth;//
	private String signupDate;
	//private String memberAddress;
	private String memberEmail;//
	private int memberPoint;
	private int isManager;
	private String recommender;
	private String clubNum;
}
