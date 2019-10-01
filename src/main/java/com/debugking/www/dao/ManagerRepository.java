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
	public int getPostCount(String searchItem) {
		ManagerMapper mapper = session.getMapper(ManagerMapper.class);
		Map<String, Object> map = new HashMap<>();
		map.put("searchItem", searchItem);
		
		int total = mapper.getPostCount(map);
		return total;
	}
	public List<Posts> selectPostAll(String searchItem, int startRecord, int countPerPage) {
		List<Posts> list;
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		ManagerMapper mapper = session.getMapper(ManagerMapper.class);
		Map<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		list = mapper.selectPostAll(map, rb);
		return list;
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
	//관리자_게시글이동
	public int move(Map hm) {
		System.out.println("3");
		ManagerMapper mapper = session.getMapper(ManagerMapper.class);
		int result= mapper.move(hm);
		
		if(result==0){
			return 0;
		}
		else{
			return 1;
		}
	}
	//관리자_글삭제
	public int deleted(Map hm) {
		ManagerMapper mapper = session.getMapper(ManagerMapper.class);
		int result= mapper.deleted(hm);
		
		if(result==0){
			return 0;
		}
		else{
			return 1;
		}
	}
	
	//관리자_회원등업변경
	public int change(Map hm) {
		ManagerMapper mapper = session.getMapper(ManagerMapper.class);
		int result= mapper.change(hm);
		
		if(result==0){
			return 0;
		}
		else{
			return 1;
		}
	}
	public int getNoticeCount() {
		ManagerMapper mapper = session.getMapper(ManagerMapper.class);
		int total = mapper.getNoticeCount();
		return total;
	}
	public List<Posts> selectNoticeAll(int startRecord, int countPerPage) {
		List<Posts> list;
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		ManagerMapper mapper = session.getMapper(ManagerMapper.class);
		list = mapper.selectNoticeAll(rb);
		return list;
	}
	//신고 글 출력
	public int getreportCount() {
		ManagerMapper mapper = session.getMapper(ManagerMapper.class);
		int total = mapper.getreportCount();
		return total;
	}
	public List<Posts> selectreportAll(int startRecord, int countPerPage) {
		List<Posts> list;
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		ManagerMapper mapper = session.getMapper(ManagerMapper.class);
		list = mapper.selectreportAll(rb);
		return list;
	}
	
	public int cancel(Map hm) {
		ManagerMapper mapper = session.getMapper(ManagerMapper.class);
		int result= mapper.cancel(hm);
		
		if(result==0){
			return 0;
		}
		else{
			return 1;
		}
	}
}