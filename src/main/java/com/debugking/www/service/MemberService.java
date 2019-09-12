package com.debugking.www.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.debugking.www.dao.MemberRepository;
import com.debugking.www.dao.PointslogRepository;

import com.debugking.www.dto.MemberInfo;
import com.debugking.www.dto.Pointslog;

@Service
public class MemberService {

	@Autowired
	MemberRepository repo;
	@Autowired
	PointslogRepository logrepo;

	
	
	Pointslog pointlog = new Pointslog();
	private final int startPoint = 10;
	
	//회원가입
	public int signup(MemberInfo member) {
		//추천인 있는경우
		if(member.getRecommender()!=""){
			if(member.getMemberId()=="admin"){
				member.setIsManager(1);
			}
			else{
				member.setIsManager(0);
			}
			
			member.setMemberPoint(1000);
			int result = repo.signup(member);
			
			//자신 포인트 로그 찍기
			pointlog.setAmount(member.getMemberPoint());
			pointlog.setBalance(member.getMemberPoint());
			pointlog.setMemberId(member.getMemberId());
			pointlog.setTheOtherId(member.getRecommender());
			pointlog.setPointtype("deposite");
			logrepo.insertpointslog(pointlog);

			//Update id + point 상대방
			pointlog.setAmount(member.getMemberPoint());
			pointlog.setBalance(member.getMemberPoint());//sql문에서 + 해주기
			pointlog.setMemberId(member.getRecommender());
			pointlog.setTheOtherId(member.getMemberId());
			pointlog.setPointtype("deposite");
			logrepo.updatepointslog(pointlog);
			
			return result;
		}
		//추천인 없는경우
		else{
			member.setMemberPoint(10);
			member.setMemberLevel("beginner");
			member.setRecommender(null);
			int result = repo.signup(member);
			
			//자신 포인트 로그 찍기
			pointlog.setAmount(startPoint);
			pointlog.setBalance(startPoint);
			pointlog.setMemberId(member.getMemberId());
			pointlog.setPointtype("deposite");
			
			logrepo.insertpointslog(pointlog);
			
			return result;
		}
	}
}
