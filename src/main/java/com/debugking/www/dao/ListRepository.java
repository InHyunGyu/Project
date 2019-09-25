package com.debugking.www.dao;


import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.debugking.www.dto.Posts;
import com.debugking.www.dto.Replies;

@Repository
public class ListRepository {

	@Autowired
	SqlSession session;
	
	//글쓰기
		public int writing(Posts post) {
			ListMapper mapper = session.getMapper(ListMapper.class);
			int result = mapper.writing(post);
			return result;
		}

		public Posts selectOne(int postNo) {
			ListMapper mapper = session.getMapper(ListMapper.class);
			
			Posts post = mapper.selectOne(postNo);
			
			return post;
		}

		public int replyInsert(String replyContent, int postNo, String memberId) {
			ListMapper mapper = session.getMapper(ListMapper.class);
			Replies reply = new Replies();
			
			reply.setMemberId(memberId);
			reply.setPostNo(postNo);
			reply.setReplyContent(replyContent);
			
			int result = mapper.replyInsert(reply);
			return result;
		}

		public ArrayList<Replies> replyList(int postNo) {
			ListMapper mapper = session.getMapper(ListMapper.class);
			ArrayList<Replies> list = new ArrayList<>();
			
			list = mapper.replyList(postNo);
			
			return list;
		}

		public int replyCount(int postNo) {
			ListMapper mapper = session.getMapper(ListMapper.class);
			
			int replyCount = mapper.replyCount(postNo);
			
			return replyCount;
		}

		public void replyDel(int replyNo) {
			ListMapper mapper = session.getMapper(ListMapper.class);
			
			mapper.replyDel(replyNo);
			
		}

		public void replyUp(Replies reply) {
			ListMapper mapper = session.getMapper(ListMapper.class);
			
			mapper.replyUp(reply);
		}

		public int postLike(int postNo) {
			ListMapper mapper = session.getMapper(ListMapper.class);
			int result = mapper.postLike(postNo);
			return result;
		}

		public int reported(int postNo) {
			ListMapper mapper = session.getMapper(ListMapper.class);
			int result = mapper.reported(postNo);
			return result;
		}

		public int postView(int postNo) {
			ListMapper mapper = session.getMapper(ListMapper.class);
			int result = mapper.postView(postNo);
			return result;
		}
		
}
