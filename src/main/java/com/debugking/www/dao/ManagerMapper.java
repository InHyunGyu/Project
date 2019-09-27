package com.debugking.www.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.debugking.www.dto.MemberInfo;
import com.debugking.www.dto.Posts;

public interface ManagerMapper {

	public int move(Map hm);	//게시글 move
	public int deleted(Map hm);	//게시글 delete
	public int change(Map hm);	//게시글 change
	
	public int getVoiceCount(Map<String, Object> map);
	public List<Posts> selectAll(Map<String, String> map, RowBounds rb);

	

	public int getMemberInfoCount(Map<String, Object> map); //멤버 수 구하기.
	public List<MemberInfo> selectMemberInfoAll(Map<String, String> map, RowBounds rb);

	
}
