package com.debugking.www.dao;

import java.util.ArrayList;

import com.debugking.www.dto.Follower;
import com.debugking.www.dto.MemberInfo;

public interface FollowMapper {

	public int followCount(String memberId);

	public ArrayList<MemberInfo> follower(String memberId);

	public ArrayList<MemberInfo> following(String memberId);

	public void insert(Follower follow);

}
