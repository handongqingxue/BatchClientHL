package com.batchClientHL.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.batchClientHL.entity.*;

public interface WorkOrderPMMapper {

	int addFromList(@Param("woPMList") List<WorkOrderPM> woPMList);
}
