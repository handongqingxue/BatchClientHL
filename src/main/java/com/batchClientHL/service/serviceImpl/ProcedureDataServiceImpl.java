package com.batchClientHL.service.serviceImpl;

import java.util.List;

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
}
