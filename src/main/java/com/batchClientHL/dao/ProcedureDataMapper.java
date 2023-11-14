package com.batchClientHL.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.batchClientHL.entity.*;

public interface ProcedureDataMapper {

	int addFromList(@Param("pdList") List<ProcedureData> pdList);

	List<ProcedureData> getListByRecpID(@Param("recpID") String recpID);
}
