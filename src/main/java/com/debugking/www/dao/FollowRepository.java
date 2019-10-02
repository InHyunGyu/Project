package com.debugking.www.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.debugking.www.dto.Follower;
import com.debugking.www.dto.MemberInfo;

@Repository
public class FollowRepository {
	@Autowired
	SqlSession session;

	public int followCount(String memberId) {
		FollowMapper mapper = session.getMapper(FollowMapper.class);
		
		int followCount = mapper.followCount(memberId);
		
		return followCount;
	}
	
	public ArrayList<MemberInfo> follower(String memberId) {
		FollowMapper mapper = session.getMapper(FollowMapper.class);
		ArrayList<MemberInfo> list = new ArrayList<>();
		list = mapper.follower(memberId);
		
		return list;
	}

	public ArrayList<MemberInfo> following(String memberId) {
		FollowMapper mapper = session.getMapper(FollowMapper.class);
		ArrayList<MemberInfo> list = new ArrayList<>();
		list = mapper.following(memberId);
		
		return list;
	}

	public void	insert(Follower follow) {
		FollowMapper mapper = session.getMapper(FollowMapper.class);
		
		mapper.insert(follow);
		
	}

	public Follower selectOne(Follower follow) {
		FollowMapper mapper = session.getMapper(FollowMapper.class);
		
		Follower result = mapper.selectOne(follow);
		
		return result;
	}

	public void delete(Follower follow) {
		FollowMapper mapper = session.getMapper(FollowMapper.class);
		
		mapper.delete(follow);
		
	}

	public ArrayList<Follower> followlist(String memberId) {
		FollowMapper mapper = session.getMapper(FollowMapper.class);
		
		ArrayList<Follower> list = new ArrayList<>();
		
		list = mapper.followList(memberId);
		
		return list;
	}
}
