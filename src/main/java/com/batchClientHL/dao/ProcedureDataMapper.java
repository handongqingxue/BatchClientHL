package com.batchClientHL.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.batchClientHL.entity.*;

public interface ProcedureDataMapper {

	int addFromList(@Param("pdList") List<ProcedureData> pdList);

	List<ProcedureData> getListByProcedureID(@Param("procedureID") String procedureID);

	int getCountByProcedureID(@Param("procedureID") String procedureID);
}
