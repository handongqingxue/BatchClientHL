package com.batchClientHL.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.batchClientHL.entity.*;

public interface StepListStatusMapper {

	int addFromList(@Param("slsList") List<StepListStatus> slsList);

	int editFromList(@Param("slsList") List<StepListStatus> slsList);

	List<String> getExistElemIDList(@Param("createID") String createID, @Param("elemIDList") List<String> elemIDList);

	List<StepListStatus> getByCreateID(@Param("createID") String createID);
}
