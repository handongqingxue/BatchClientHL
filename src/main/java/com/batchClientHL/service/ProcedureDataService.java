package com.batchClientHL.service;

import java.util.List;
import java.util.Map;

import com.batchClientHL.entity.*;

public interface ProcedureDataService {

	int addFromList(List<ProcedureData> pdList);

	Map<String, Object> getDrawSFCMapByRecpID(String recpID);
}
