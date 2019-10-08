package com.debugking.www.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.debugking.www.dto.Posts;
import com.debugking.www.dto.likereport;

@Repository
public class likereportRepository {
	@Autowired
	SqlSession session;

	public List<likereport> selectList(int postNo,String checkType) {
		likereportMapper mapper = session.getMapper(likereportMapper.class);
		Map check = new HashMap();
		
		check.put("postNo", postNo);
		check.put("checkType", checkType);
		
		List<likereport> result = mapper.selectList(check);
		return result;
	}

	public int viewinsertLR(String memberId, int postNo, String checkType) {
		likereportMapper mapper = session.getMapper(likereportMapper.class);
		Map check = new HashMap();
		
		check.put("postNo", postNo);
		check.put("memberId", memberId);
		check.put("checkType", checkType);
		
		int result = mapper.insertLR(check);
		return result;
		
	}
}
