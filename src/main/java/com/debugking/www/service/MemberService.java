package com.debugking.www.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.debugking.www.dao.MemberRepository;
import com.debugking.www.dao.PointslogRepository;
import com.debugking.www.dto.MemberInfo;

@Service
public class MemberService {

	@Autowired
	MemberRepository repo;
/*	@Autowired
	PointslogRepository logrepo;*/
	public int signup(MemberInfo member) {
		if(member.getRecommender()!=null){
			member.setMemberPoint(1000);
			//logrepo.insertpointslog(member);
			
			//Update id + point
			MemberInfo temp = new MemberInfo();
			temp.setMemberId(member.getRecommender());
			temp.setRecommender(member.getMemberId());
			temp.setMemberPoint(1000);
			//logrepo.updatepointslog(temp);
		}
		
		int result = repo.signup(member);
		//Update
		return result;
	}
	
}
