package com.debugking.www.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.debugking.www.dto.MemberInfo;
import com.debugking.www.dto.Pointslog;

@Repository
public class PointslogRepository {
	@Autowired
	SqlSession session;
	
	//로그등록하기
	public int insertpointslog(Pointslog pointlog) {
		PointslogMapper mapper = session.getMapper(PointslogMapper.class);
		System.out.println("PONINT LOG"+pointlog);
		int result = mapper.insertpointslog(pointlog);
		return result;
	}
	
	//로그 업데이트
	public int updatepointslog(Pointslog pointlog) {
		PointslogMapper mapper = session.getMapper(PointslogMapper.class);
		int result = mapper.updatepointslog(pointlog);
		return result;
	}
}
