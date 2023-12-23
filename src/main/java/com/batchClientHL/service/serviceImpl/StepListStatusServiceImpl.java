package com.batchClientHL.service.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.batchClientHL.entity.*;
import com.batchClientHL.dao.*;
import com.batchClientHL.service.*;

@Service
public class StepListStatusServiceImpl implements StepListStatusService {

	@Autowired
	StepListStatusMapper stepListStatusDao;

	@Override
	public int addFromList(List<StepListStatus> slsList) {
		// TODO Auto-generated method stub
		int count=0;
		int insertCount=0;
		int updateCount=0;
		List<String> elemIDList=new ArrayList<String>();
		for (StepListStatus sls : slsList) {
			String elemID = sls.getElemID();
			elemIDList.add(elemID);
			
		}
		
		List<StepListStatus> slsInsertList=new ArrayList<StepListStatus>();
		List<StepListStatus> slsUpdateList=new ArrayList<StepListStatus>();
		List<String> existElemIDList=stepListStatusDao.getExistElemIDList(slsList.get(0).getCreateID(),elemIDList);
		for (StepListStatus sls : slsList) {
			boolean exist=false;
			String slsElemID = sls.getElemID();
			for (String existElemID : existElemIDList) {
				if(slsElemID.equals(existElemID)) {
					exist=true;
					break;
				}
			}
			if(exist) {
				slsUpdateList.add(sls);
			}
			else {
				slsInsertList.add(sls);
			}
		}
		if(slsInsertList.size()>0)
			insertCount=stepListStatusDao.addFromList(slsInsertList);
		if(slsUpdateList.size()>0)
			updateCount=stepListStatusDao.editFromList(slsUpdateList);
		count=insertCount+updateCount;
		return count;
	}

	@Override
	public List<StepListStatus> getByCreateID(String createID) {
		// TODO Auto-generated method stub
		return stepListStatusDao.getByCreateID(createID);
	}
}
