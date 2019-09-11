package com.debugking.www.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.debugking.www.dao.LevelsRepository;
import com.debugking.www.dao.MemberRepository;
import com.debugking.www.dao.PointslogRepository;
import com.debugking.www.dto.Levels;
import com.debugking.www.dto.MemberInfo;
import com.debugking.www.dto.Pointslog;

@Service
public class MemberService {

	@Autowired
	MemberRepository repo;
	@Autowired
	PointslogRepository logrepo;
	@Autowired
	LevelsRepository levelrepo;
	
	Levels level = new Levels();
	Pointslog pointlog = new Pointslog();
	private final int startPoint = 10;
	
	//회원가입
	public int signup(MemberInfo member) {
		if(member.getRecommender()!=null){	
			member.setMemberPoint(1000);
			int result = repo.signup(member);
			
			//자신 포인트 로그 찍기
			pointlog.setAmount(member.getMemberPoint());
			pointlog.setBalance(member.getMemberPoint());
			pointlog.setMemberid(member.getMemberId());
			pointlog.setTheOtherId(member.getRecommender());
			pointlog.setPointtype("deposite");
			logrepo.insertpointslog(pointlog);
			
			//레벨등록하기
			level.setMemberid(member.getMemberId());
			level.setMemberid("beginner");
			levelrepo.insertlevel(level);
			
			//Update id + point 상대방
			pointlog.setAmount(member.getMemberPoint());
			pointlog.setBalance(member.getMemberPoint());//sql문에서 + 해주기
			pointlog.setMemberid(member.getRecommender());
			pointlog.setTheOtherId(member.getMemberId());
			pointlog.setPointtype("deposite");
			logrepo.updatepointslog(pointlog);
			
			return result;
		}else{
			member.setMemberPoint(10);
			int result = repo.signup(member);
			
			//자신 포인트 로그 찍기
			pointlog.setAmount(startPoint);
			pointlog.setBalance(startPoint);
			pointlog.setMemberid(member.getMemberId());
			pointlog.setTheOtherId(member.getRecommender());
			pointlog.setPointtype("deposite");
			logrepo.insertpointslog(pointlog);
			
			//레벨등록하기
			level.setMemberid(member.getMemberId());
			level.setMemberid("beginner");
			levelrepo.insertlevel(level);
			
			logrepo.insertpointslog(pointlog);
			
			return result;
		}
	}
}
