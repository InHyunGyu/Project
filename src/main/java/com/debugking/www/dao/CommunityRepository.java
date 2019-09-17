package com.debugking.www.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.javassist.expr.NewArray;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.debugking.www.dto.Posts;

@Repository
public class CommunityRepository {

	@Autowired
	SqlSession session;
	
	public int insert(Posts vo) {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
	
		int result = mapper.insert(vo);
		
		return result;
	}

	public int getBoardCount(String searchItem, String searchWord) {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		
		Map<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchWord", searchWord);
		
		int result = mapper.getBoardCount(map);
		
		return 0;
	}

	public ArrayList<Posts> selectAll(String searchItem, String searchWord, String postType, int startRecord, int countPerPage) {
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

}
