package com.debugking.www.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.debugking.www.dto.MemberInfo;


@Repository
public class MemberRepository {
	@Autowired
	SqlSession session;
	//회원 찾기 -한 명 찾기
	public MemberInfo idCheck(MemberInfo member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		//마지막엔 try 걸어야됌
		MemberInfo result = mapper.selectOne(member);
		return result;
	}
	//회원등록하기
	public int signup(MemberInfo member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		//마지막엔 try 걸어야됌
		int result = mapper.signup(member);
		return result;
	}
	


}
