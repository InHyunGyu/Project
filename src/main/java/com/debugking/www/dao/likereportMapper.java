package com.debugking.www.dao;

import java.util.List;
import java.util.Map;

import com.debugking.www.dto.Posts;
import com.debugking.www.dto.likereport;

public interface likereportMapper {

	List<likereport> selectList(Map check);

	int insertLR(Map check);

}
