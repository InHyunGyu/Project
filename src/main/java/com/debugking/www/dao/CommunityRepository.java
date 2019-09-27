package com.debugking.www.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.debugking.www.dto.Posts;

@Repository
public class CommunityRepository {

	@Autowired
	SqlSession session;
	

	public int getPostCount(String searchItem, String searchWord) {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		
		Map<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchWord", searchWord);
		
		int result = mapper.getBoardCount(map);
		
		return result;
	}

	public ArrayList<Posts> selectAll(String postType, String searchItem, String searchWord, int startRecord, int countPerPage) {
		ArrayList<Posts> list = new ArrayList<>();
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		
		Map<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchWord", searchWord);
		map.put("postType", postType);
		
		list = mapper.selectAll(map, rb);
	
		return list;
	}

	public Posts selectOne(int postNo) {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		
		Posts post = mapper.selectOne(postNo);
		
		return post;
	}

	public int update(Posts post) {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		
		int result = mapper.update(post);
		
		return result;
	}

	public int postDelete(int postNo) {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		
		int result = mapper.postDelete(postNo);
		
		return result;
	}

}
