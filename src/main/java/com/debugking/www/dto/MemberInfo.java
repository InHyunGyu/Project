package com.debugking.www.dto;

import lombok.Data;

@Data
public class MemberInfo {
	private int memberNum;		//유저 아이디와 별도로 만들 user number. 시퀀스처리
	private String memberId;	//회원이 로그인할 때 쓸 아이디이다. 
	private String memberPwd;	//유저 비밀번호
	private String memberName;	//유저가 회원 가입할 때 입력한 실명
	private String memberPhone;	//유저 휴대폰 번호
	private String memberBirth;	//생일
	private String signupDate;	//가입날짜
	private String memberEmail;	//이메일
	private int memberPoint;	//유저의 포인트 보유수 
	private int isManager;		//매니저확인여부
	private String recommender;	//추천인 
	private String clubNum;		//
	private String memberLevel;	//DEFAULT 'beginner'
}