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
public class VideoListRepository {

	
	@Autowired
	SqlSession session;
	
	//VideoList 불러오기
		public List<MemberInfo> GetVideoList() {
			VideoListMapper mapper = session.getMapper(VideoListMapper.class);
			List<MemberInfo> result = mapper.GetVideoList();
			return result;
		}

		public int getVideoCount(String searchItem, String searchWord) {
			VideoListMapper mapper = session.getMapper(VideoListMapper.class);
			Map<String, Object> map = new HashMap<>();
			map.put("searchItem", searchItem);
			map.put("searchWord", searchWord);
			
			int total = mapper.getVideoCount(map);
			return total;
		}

		public List<Posts> selectAll(String searchItem, String searchWord, int startRecord, int countPerPage) {
			List<Posts> list;
			RowBounds rb = new RowBounds(startRecord, countPerPage);
			
			VideoListMapper mapper = session.getMapper(VideoListMapper.class);
			Map<String, String> map = new HashMap<>();
			map.put("searchItem", searchItem);
			map.put("searchWord", searchWord);
			list = mapper.selectAll(map, rb);
			
			
			return list;
		}

		public List<Posts> selectWeek(String searchItem, String searchWord, int startRecord, int countPerPage) {
			
			List<Posts> list;
            RowBounds rb = new RowBounds(startRecord, countPerPage);
			
            VideoListMapper mapper = session.getMapper(VideoListMapper.class);
            Map<String, String> map = new HashMap<>();
			map.put("searchItem", searchItem);
			map.put("searchWord", searchWord);
			list = mapper.selectWeek(map, rb);
			
			return list;
		}

		public List<Posts> selectMonth(String searchItem, String searchWord, int startRecord, int countPerPage) {


			List<Posts> list;
            RowBounds rb = new RowBounds(startRecord, countPerPage);
			
            VideoListMapper mapper = session.getMapper(VideoListMapper.class);
            Map<String, String> map = new HashMap<>();
			map.put("searchItem", searchItem);
			map.put("searchWord", searchWord);
			list = mapper.selectMonth(map, rb);
			
			return list;
			
		}
		
	
	
	
	
}
