package com.debugking.www.dao;

import com.debugking.www.dto.MemberInfo;

public interface MemberMapper {
	public MemberInfo selectOne(String memberId); // 셀렉트 한명찾기
	
	public int signup(MemberInfo member); //인설트 회원등록

	public MemberInfo login(MemberInfo member); //로그인

	public int memberDelete(MemberInfo member); //회원 탈퇴
	
	//이메일 인증 관련 메서드
	public String getUserEmail(String userid); //회원의 이메일을 가져오기 위한 메서드
	public int setUserEmailChecked(String userid); //회원이 이메일 인증을 완료했을 경우 발동
	
	public int setPhotoname(MemberInfo member);
	public int setSavefile(MemberInfo member);
	
}
