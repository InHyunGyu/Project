package com.debugking.www.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.debugking.www.dto.MemberInfo;
import com.debugking.www.dto.Posts;

public interface VoiceListMapper {

	public List<MemberInfo> GetVoiceList(); // VoiceList 불러오기
	public int getNoticeCount();
	public List<Posts> selectNoticeAll();
	
	public int getVoiceCount(Map<String, Object> map); //갯수불러오기 > 페이지 노 타메니
	public int getNoticeCount(Map<String, Object> map);
	
	public int getVoiceWeekCount(Map<String, Object> map);
	public int getVoiceMonthCount(Map<String, Object>map);
	

	public List<Posts> selectAll(Map<String, String> map, RowBounds rb); // 전체 선택하기 
	public List<Posts> selectNoticeAll(Map<String, String> map, RowBounds rb);
	


	public int writing(Posts post); //글쓰기

	public int getVoiceNewCount(Map<String, Object> map);

	public List<Posts> selectNewAll(Map<String, String> map, RowBounds rb);

	public Posts selectPostOne(int postNo); //POSTS 하나만 검색하기
	
	
	public List<Posts>selectWeek(Map<String,String>map,RowBounds rb); //주간
	
	public List<Posts>selectMonth(Map<String,String>map,RowBounds rb); //월간


}
