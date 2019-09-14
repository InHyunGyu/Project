package com.debugking.www.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.debugking.www.dto.MemberInfo;
@Repository
public class VoiceListRepository {
	@Autowired
	SqlSession session;
	
	//VoiceList 불러오기
	public List<MemberInfo> GetVoiceList() {
		VoiceListMapper mapper = session.getMapper(VoiceListMapper.class);
		List<MemberInfo> result = mapper.GetVoiceList();
		return result;
	}

}
