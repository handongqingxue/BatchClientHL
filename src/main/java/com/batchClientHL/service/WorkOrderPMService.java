package com.batchClientHL.service;

import java.util.List;

import com.batchClientHL.entity.*;

public interface WorkOrderPMService {

	int addFromRecPM(String workOrderID, String recipeID, List<WorkOrderPM> workOrderPMMesList);
}
