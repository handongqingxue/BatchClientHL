package com.batchClientHL.service;

import com.batchClientHL.entity.*;

public interface WorkOrderService {

	int add(WorkOrder wo);

	String createFormulaIdByDateYMD(String identifier);
}
