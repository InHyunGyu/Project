package com.debugking.www.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.debugking.www.dto.Posts;
import com.debugking.www.dto.Replies;

public interface ListMapper {

	public int writing(Posts post);

	public Posts selectOne(int postNo);

	public int replyCount(int postNo);

	public int replyInsert(Replies reply);

	public ArrayList<Replies> replyList(int postNo);

	public void replyDel(int replyNo);

	public int replyUp(Replies reply);

	public int postLike(int postNo);

	public int reported(int postNo);

	public int postView(int postNo);

	public ArrayList<Posts> selectList(String memberId);

	public int postCount(String memberId);

	public ArrayList<Posts> memberPost(String memberId, RowBounds rb);

	public ArrayList<String> postLikeList(int postNo);

}
