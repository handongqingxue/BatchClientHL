package com.batchClientHL.service.serviceImpl;

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
		return stepListStatusDao.addFromList(slsList);
	}
}
