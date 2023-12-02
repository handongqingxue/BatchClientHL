package com.batchClientHL.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.batchClientHL.entity.*;

public interface StepListStatusMapper {

	int addFromList(@Param("slsList") List<StepListStatus> slsList);
}
