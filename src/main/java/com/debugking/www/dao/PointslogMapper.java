package com.debugking.www.dao;

import com.debugking.www.dto.MemberInfo;
import com.debugking.www.dto.Pointslog;

public interface PointslogMapper {

	int insertpointslog(Pointslog pointlog); //인설트

	int updatepointslog(Pointslog pointlog); //업데이트

}
