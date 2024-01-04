package com.batchClientHL.dao;

import org.apache.ibatis.annotations.Param;

import com.batchClientHL.entity.*;

public interface WorkOrderMapper {

	int add(WorkOrder wo);

	String getMaxFormulaIdNumByFormulaIdDate(@Param("formulaIdDate") String formulaIdDate);
}
