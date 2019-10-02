package com.debugking.www.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.debugking.www.dto.MemberInfo;
import com.debugking.www.dto.Posts;

public interface VideoListMapper {

	
	public List<MemberInfo> GetVideoList(); // VoiceList 불러오기

	public int getVideoCount(Map<String, Object> map); //갯수불러오기 > 페이지 노 타메니

	public List<Posts> selectAll(Map<String, String> map, RowBounds rb); // 전체 선택하기 

	
	public List<Posts> selectWeek(Map<String, String> map, RowBounds rb); //주별

	public List<Posts> selectMonth(Map<String, String> map, RowBounds rb);
	
	
}
