package com.debugking.www.dto;

import lombok.Data;

@Data
public class MemberInfo {
	private String memberId;	//회원이 로그인할 때 쓸 아이디이다. 
	private String memberPwd;	//유저 비밀번호
	private String memberName;	//유저가 회원 가입할 때 입력한 실명
	private String memberPhone;	//유저 휴대폰 번호
	private String memberBirth;	//생일
	private String signupDate;	//가입날짜
	private String memberEmail;	//이메일
	private int memberPoint;	//유저의 포인트 보유수 
	private String recommender;	//추천인 
	private String memberLevel;	//DEFAULT 'beginner'
	private String photo;
}