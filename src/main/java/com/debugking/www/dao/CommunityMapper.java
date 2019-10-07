package com.debugking.www.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.debugking.www.dto.Posts;

public interface CommunityMapper {

	public int getBoardCount(Map<String, String> map);

	public ArrayList<Posts> selectAll(Map<String, String> map, RowBounds rb);

	public Posts selectOne(int postNo);

	public int update(Posts post);

	public int postDelete(int postNo);

	public int commuNoCount();

	public List<Posts> commuNoList();

}
