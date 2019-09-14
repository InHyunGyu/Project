package com.debugking.www.dao;

import com.debugking.www.dto.MemberInfo;

public interface MemberMapper {
	public MemberInfo selectOne(String memberId); // 셀렉트 한명찾기
	
	public int signup(MemberInfo member); //인설트 회원등록

	public MemberInfo login(MemberInfo member); //로그인

	public int memberDelete(MemberInfo member); //회원 탈퇴

	
}
