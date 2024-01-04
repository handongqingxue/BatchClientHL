package com.batchClientHL.service.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.batchClientHL.entity.*;
import com.batchClientHL.dao.*;
import com.batchClientHL.service.*;

@Service
public class WorkOrderServiceImpl implements WorkOrderService {

	@Autowired
	WorkOrderMapper workOrderDao;
	@Autowired
	RecipeHeaderMapper recipeHeaderDao;
	private SimpleDateFormat formulaIdSDF = new SimpleDateFormat("yyyyMMdd");

	@Override
	public int add(WorkOrder wo) {
		// TODO Auto-generated method stub
		return workOrderDao.add(wo);
	}
	
	@Override
	public String createFormulaIdByDateYMD(String identifier) {
		// TODO Auto-generated method stub
		String identifierPre = "";
		if(!StringUtils.isEmpty(identifier)) {
			identifierPre=identifier.substring(0, 3);
		}
		String formulaIdDate = identifierPre+"_BATCH"+formulaIdSDF.format(new Date());
		String countStr = workOrderDao.getMaxFormulaIdNumByFormulaIdDate(formulaIdDate);
		System.out.println("countStr==="+countStr);
		Integer count;
		if(StringUtils.isEmpty(countStr)) {
			count=0;
		}
		else
			count=Integer.valueOf(countStr);
		
		String formulaIdXhStr=null;
		int formulaIdXh=count+1;
		if(formulaIdXh<10)
			formulaIdXhStr="00"+formulaIdXh;
		else if(formulaIdXh<100)
			formulaIdXhStr="0"+formulaIdXh;
		return formulaIdDate+formulaIdXhStr;
	}
}
