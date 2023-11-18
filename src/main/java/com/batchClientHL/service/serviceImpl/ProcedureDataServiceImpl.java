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
				initStepProData.setElemType(elemType);
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
				regStepProData.setElemType(elemType);
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
				traProData.setElemType(elemType);
				traProData.setElemID(elemID);
				traProData.setDrawXCord(proData.getDrawXCord());
				traProData.setDrawYCord(proData.getDrawYCord());
				traProData.setConditionExp(proData.getConditionExp());
				
				traProDataList.add(traProData);
				
				break;
			case ProcedureData.TERMINAL_STEP:
				ProcedureData terStepProData = new ProcedureData();
				terStepProData.setElemType(elemType);
				terStepProData.setElemID(elemID);
				terStepProData.setDrawXCord(proData.getDrawXCord());
				terStepProData.setDrawYCord(proData.getDrawYCord());
				
				drawSFCMap.put(ProcedureData.TERMINAL_STEP_TEXT, terStepProData);
				break;
			case ProcedureData.LINK:
				List<ProcedureData> linkProDataList=null;
				Object linkProDataListObj = drawSFCMap.get(ProcedureData.LINK_TEXT);
				if(linkProDataListObj==null) {
					linkProDataList = new ArrayList<ProcedureData>();
					drawSFCMap.put(ProcedureData.LINK_TEXT, linkProDataList);
				}
				else {
					linkProDataList = (List<ProcedureData>)linkProDataListObj;
				}
				
				ProcedureData linkProData = new ProcedureData();
				linkProData.setElemType(elemType);
				linkProData.setElemID(elemID);
				linkProData.setPrevElemID(proData.getPrevElemID());
				linkProData.setNextElemID(proData.getNextElemID());
				
				linkProDataList.add(linkProData);
				
				break;
			case ProcedureData.AND_DIVERGENCE:
				List<ProcedureData> andDivProDataList=null;
				Object andDivProDataListObj = drawSFCMap.get(ProcedureData.AND_DIVERGENCE_TEXT);
				if(andDivProDataListObj==null) {
					andDivProDataList = new ArrayList<ProcedureData>();
					drawSFCMap.put(ProcedureData.AND_DIVERGENCE_TEXT, andDivProDataList);
				}
				else {
					andDivProDataList = (List<ProcedureData>)andDivProDataListObj;
				}
				
				ProcedureData andDivProData = new ProcedureData();
				andDivProData.setElemType(elemType);
				andDivProData.setElemID(elemID);
				andDivProData.setPrevElemIDList(proData.getPrevElemIDList());
				andDivProData.setNextElemIDList(proData.getNextElemIDList());
				
				andDivProDataList.add(andDivProData);
				
				break;
			case ProcedureData.AND_CONVERGENCE:
				List<ProcedureData> andConvProDataList=null;
				Object andConvProDataListObj = drawSFCMap.get(ProcedureData.AND_CONVERGENCE_TEXT);
				if(andConvProDataListObj==null) {
					andConvProDataList = new ArrayList<ProcedureData>();
					drawSFCMap.put(ProcedureData.AND_CONVERGENCE_TEXT, andConvProDataList);
				}
				else {
					andConvProDataList = (List<ProcedureData>)andConvProDataListObj;
				}
				
				ProcedureData andConvProData = new ProcedureData();
				andConvProData.setElemType(elemType);
				andConvProData.setElemID(elemID);
				andConvProData.setPrevElemIDList(proData.getPrevElemIDList());
				andConvProData.setNextElemIDList(proData.getNextElemIDList());
				
				andConvProDataList.add(andConvProData);
				
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
