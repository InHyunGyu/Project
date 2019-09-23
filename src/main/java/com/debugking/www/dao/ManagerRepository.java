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
public class ManagerRepository {
	@Autowired
	SqlSession session;
	//ALL 페이징 하기
		public int getVoiceCount(String searchItem) {
			ManagerMapper mapper = session.getMapper(ManagerMapper.class);
			Map<String, Object> map = new HashMap<>();
			map.put("searchItem", searchItem);
			
			int total = mapper.getVoiceCount(map);
			return total;
		}
		public List<Posts> selectAll(String searchItem, int startRecord, int countPerPage) {
			List<Posts> list;
			RowBounds rb = new RowBounds(startRecord, countPerPage);
			
			ManagerMapper mapper = session.getMapper(ManagerMapper.class);
			Map<String, String> map = new HashMap<>();
			map.put("searchItem", searchItem);
			list = mapper.selectAll(map, rb);
			return list;
		}
		
	public int move(Map hm) {
		ManagerMapper mapper = session.getMapper(ManagerMapper.class);
		System.out.println(hm);
		int result= mapper.move(hm);
		
		if(result==0){
			return 0;
		}
		else{
			return 1;
		}
	}
	public int deleted(Map hm) {
		ManagerMapper mapper = session.getMapper(ManagerMapper.class);
		System.out.println("레포지토리 딜리트"+hm);
		int result= mapper.deleted(hm);
		
		if(result==0){
			return 0;
		}
		else{
			return 1;
		}
	}
	public int getMemberInfoCount(String memberLevel) {
		ManagerMapper mapper = session.getMapper(ManagerMapper.class);
		Map<String, Object> map = new HashMap<>();
		map.put("memberLevel", memberLevel);
		
		int total = mapper.getMemberInfoCount(map);
		return total;
	}
	public List<MemberInfo> selectMemberInfoAll(String memberLevel, int startRecord, int countPerPage) {
		List<MemberInfo> list;
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		ManagerMapper mapper = session.getMapper(ManagerMapper.class);
		Map<String, String> map = new HashMap<>();
		map.put("memberLevel", memberLevel);
		list = mapper.selectMemberInfoAll(map, rb);
		return list;
	}

}
