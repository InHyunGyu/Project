package com.debugking.www.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.debugking.www.dto.MemberInfo;
import com.debugking.www.dto.Posts;

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

	public int getVoiceCount(String searchItem, String searchWord) {
		VoiceListMapper mapper = session.getMapper(VoiceListMapper.class);
		Map<String, Object> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchWord", searchWord);
		
		int total = mapper.getVoiceCount(map);
		return total;
	}

	public List<Posts> selectAll(String searchItem, String searchWord, int startRecord, int countPerPage) {
		List<Posts> list;
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		VoiceListMapper mapper = session.getMapper(VoiceListMapper.class);
		Map<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchWord", searchWord);
		list = mapper.selectAll(map, rb);
		return list;
	}
	
	



}
