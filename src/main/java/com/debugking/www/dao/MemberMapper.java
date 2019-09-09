package com.debugking.www.dao;

import com.debugking.www.dto.MemberInfo;

public interface MemberMapper {
	public MemberInfo selectOne(MemberInfo member); // 셀렉트 한명찾기
	
	public int signup(MemberInfo member); //인설트 회원등록

	
}
