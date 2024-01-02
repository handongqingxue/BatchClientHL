package com.batchClientHL.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.batchClientHL.entity.*;
import com.batchClientHL.dao.*;
import com.batchClientHL.service.*;

@Service
public class RecipePMServiceImpl implements RecipePMService {

	@Autowired
	RecipePMMapper recipePMDao;
	
	@Override
	public List<RecipePM> getListByRecipeID(String recipeID) {
		// TODO Auto-generated method stub
		return recipePMDao.getListByRecipeID(recipeID);
	}

}
