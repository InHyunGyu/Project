package com.debugking.www.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.debugking.www.dto.Levels;

@Repository
public class LevelsRepository {
	@Autowired
	SqlSession session;
	
	public void insertlevel(Levels level) {
		LevelsMapper mapper = session.getMapper(LevelsMapper.class);
		mapper.insertlevel(level);
		
	}

}
