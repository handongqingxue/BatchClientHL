package com.batchClientHL.service.serviceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.batchClientHL.entity.*;
import com.batchClientHL.dao.*;
import com.batchClientHL.service.*;

@Service
public class ProcedureDataServiceImpl implements ProcedureDataService {

	@Autowired
	ProcedureDataMapper procedureDataDao;

	@Override
	public int addFromList(List<ProcedureData> pdList) {
		// TODO Auto-generated method stub
		return procedureDataDao.addFromList(pdList);
	}

	@Override
	public Map<String, Object> getDrawSFCMapByRecpID(String recpID) {
		// TODO Auto-generated method stub
		Map<String, Object> drawSFCMap=new HashMap<String, Object>();
		
		List<ProcedureData> proDataList=procedureDataDao.getListByRecpID(recpID);
		for (ProcedureData proData : proDataList) {
			Integer elemType = proData.getElemType();
			String elemID = proData.getElemID();
			switch (elemType) {
			case ProcedureData.INITIAL_STEP:
				ProcedureData initStepProData = new ProcedureData();
				initStepProData.setElemID(elemID);
				initStepProData.setDrawXCord(proData.getDrawXCord());
				initStepProData.setDrawYCord(proData.getDrawYCord());
				
				drawSFCMap.put(ProcedureData.INITIAL_STEP_TEXT, initStepProData);
				break;
			case ProcedureData.REGULAR_STEP:
				List<ProcedureData> regStepProDataList=null;
				Object regStepProDataListObj = drawSFCMap.get(ProcedureData.REGULAR_STEP_TEXT);
				if(regStepProDataListObj==null) {
					regStepProDataList = new ArrayList<ProcedureData>();
					drawSFCMap.put(ProcedureData.REGULAR_STEP_TEXT, regStepProDataList);
				}
				else {
					regStepProDataList = (List<ProcedureData>)regStepProDataListObj;
				}
				
				ProcedureData regStepProData = new ProcedureData();
				regStepProData.setElemID(elemID);
				regStepProData.setDrawXCord(proData.getDrawXCord());
				regStepProData.setDrawYCord(proData.getDrawYCord());
				regStepProData.setElemName(proData.getElemName());
				
				regStepProDataList.add(regStepProData);
				break;
			case ProcedureData.TRANSITION:
				List<ProcedureData> traProDataList=null;
				Object traProDataListObj = drawSFCMap.get(ProcedureData.TRANSITION_TEXT);
				if(traProDataListObj==null) {
					traProDataList = new ArrayList<ProcedureData>();
					drawSFCMap.put(ProcedureData.TRANSITION_TEXT, traProDataList);
				}
				else {
					traProDataList = (List<ProcedureData>)traProDataListObj;
				}
				
				ProcedureData traProData = new ProcedureData();
				traProData.setElemID(elemID);
				traProData.setDrawXCord(proData.getDrawXCord());
				traProData.setDrawYCord(proData.getDrawYCord());
				traProData.setConditionExp(proData.getConditionExp());
				
				traProDataList.add(traProData);
				
				break;
			case ProcedureData.TERMINAL_STEP:
				ProcedureData terStepProData = new ProcedureData();
				terStepProData.setElemID(elemID);
				terStepProData.setDrawXCord(proData.getDrawXCord());
				terStepProData.setDrawYCord(proData.getDrawYCord());
				
				drawSFCMap.put(ProcedureData.TERMINAL_STEP_TEXT, terStepProData);
				break;
				/*
			case value:
				
				break;
				*/
			}
		}
		return drawSFCMap;
	}
}
