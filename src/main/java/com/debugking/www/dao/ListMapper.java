package com.debugking.www.dao;

import java.util.ArrayList;

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

}
