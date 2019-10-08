package com.debugking.www.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.debugking.www.dto.MemberInfo;




@Repository
public class MemberRepository {
	@Autowired
	SqlSession session;
	
	//아아다 찾기
	public MemberInfo getMemberId(MemberInfo member2){
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		
		MemberInfo member = mapper.getMemberId(member2);
		
		return member;
	}
	
	public MemberInfo getMemberPwd(MemberInfo member2) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		
		MemberInfo member = mapper.getMemberPwd(member2);
		
		return member;
	}
	
	
	//회원 찾기 -한 명 찾기
	public MemberInfo idCheck(String memberId) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		//마지막엔 try 걸어야됌
		MemberInfo result = mapper.selectOne(memberId);
		return result;
	}
	//회원등록하기
	public int signup(MemberInfo member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		System.out.println("member"+member);
		//마지막엔 try 걸어야됌
		int result = mapper.signup(member);
		return result;
	}
	//회원로그인
	public MemberInfo login(MemberInfo member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		MemberInfo result=null;
		try{
			result = mapper.login(member);
		}catch(Exception e){
			return null;
		}
		return result;
	}
	//회원삭제
	public int memberDelete(MemberInfo member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int result = mapper.memberDelete(member);
		System.out.println("weroiuosvn"+result);
		return result;
	}
	
	//유저 이메일 가져오기
	public String getUserEmail(String userid){
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		String useremail = mapper.getUserEmail(userid);
		
		return useremail;
	}
	
	public int setUserEmailChecked(String userid)
	{
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int result = mapper.setUserEmailChecked(userid);
		
		return result;
	}
	
	public MemberInfo selectOne(String memberId) {
		// TODO Auto-generated method stub
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		MemberInfo member = mapper.selectOne(memberId);
		return member;
	}
	public int setPhotoname(MemberInfo member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int result = mapper.setPhotoname(member);
		
		return result;
	}
	public int setSavefile(MemberInfo member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int result = mapper.setSavefile(member);		
		
		return result;
	}
	public int memberUpdate(MemberInfo member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int result = mapper.memberUpdate(member);
		
		return result;
	}

	public int tempPwdSet(MemberInfo member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int result = mapper.tempPwdSet(member);
		
		return result; 
	}
 
	public String checkEmail(String memberEmail) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		String result = mapper.checkEmail(memberEmail);
		
		return result; 
	}


	public int setUserTempPwd(MemberInfo member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int result = mapper.setUserTempPwd(member);
		
		return result;
	}


}
