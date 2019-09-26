package com.debugking.www.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FollowRepository {
	@Autowired
	SqlSession session;

	public int followCount(String memberId) {
		FollowMapper mapper = session.getMapper(FollowMapper.class);
		
		int followCount = mapper.followCount(memberId);
		
		return followCount;
	}
}
