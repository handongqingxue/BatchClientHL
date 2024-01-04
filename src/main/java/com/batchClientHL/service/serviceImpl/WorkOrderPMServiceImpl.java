package com.batchClientHL.service.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.batchClientHL.entity.*;
import com.batchClientHL.dao.*;
import com.batchClientHL.service.*;

@Service
public class WorkOrderPMServiceImpl implements WorkOrderPMService {
	
	@Autowired
	RecipePMMapper recipePMDao;
	@Autowired
	WorkOrderPMMapper workOrderPMDao;

	@Override
	public int addFromRecPM(String workOrderID, String recipeID, List<WorkOrderPM> workOrderPMMesList) {
		// TODO Auto-generated method stub
		int count=0;
		List<RecipePM> rPMList=recipePMDao.getListByRecipeID(recipeID);

		List<WorkOrderPM> woPMList=new ArrayList<>();
		WorkOrderPM woPM=null;
		for(int i=0;i<rPMList.size();i++) {
			RecipePM rPM = rPMList.get(i);
			String pMCodeTmp = rPM.getPMCode();
			woPM=new WorkOrderPM();
			woPM.setPMCode(pMCodeTmp);
			woPM.setPMName(rPM.getPMName());
			woPM.setLot(rPM.getLot());
			woPM.setDosage(rPM.getDosage());
			woPM.setUnit(rPM.getUnit());
			woPM.setHLimit(rPM.getHLimit());
			woPM.setLLimit(rPM.getLLimit());
			woPM.setPMType(rPM.getPMType());
			woPM.setWorkOrderID(workOrderID);
			woPM.setCName(rPM.getCName());
			if(workOrderPMMesList!=null)
				woPM.setCNameMes(getCNameMes(pMCodeTmp,workOrderPMMesList));
			
			woPMList.add(woPM);
		}
		
		count=workOrderPMDao.addFromList(woPMList);
		
		return count;
	}
	
	public String getCNameMes(String pMCode, List<WorkOrderPM> workOrderPMMesList) {
		String cNameMes=null;
		for (int i = 0; i < workOrderPMMesList.size(); i++) {
			WorkOrderPM workOrderPMMes = workOrderPMMesList.get(i);
			String pMCodeMes = workOrderPMMes.getPMCode();
			if(pMCode.equals(pMCodeMes)) {
				cNameMes=workOrderPMMes.getCNameMes();
				break;
			}
		}
		return cNameMes;
	}
}
