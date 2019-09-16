package com.debugking.www.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.debugking.www.dto.Files;
import com.debugking.www.dto.MemberInfo;

public interface VoiceListMapper {

	public List<MemberInfo> GetVoiceList(); // VoiceList 불러오기

	public int getVoiceCount(Map<String, Object> map); //갯수불러오기 > 페이지 노 타메니

	public List<Files> selectAll(Map<String, String> map, RowBounds rb); // 전체 선택하기 
	

}
