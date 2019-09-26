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
	private String photoname;  //파일 이름
	private String savefile;   //파일이 저장되는 위치
	private String myintro;    //myblog 자기 소개 글
	private char emailchecked; //이메일 인증 여부
}