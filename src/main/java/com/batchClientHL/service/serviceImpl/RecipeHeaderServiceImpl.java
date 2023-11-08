package com.batchClientHL.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.batchClientHL.entity.*;
import com.batchClientHL.dao.*;
import com.batchClientHL.service.*;

@Service
public class RecipeHeaderServiceImpl implements RecipeHeaderService {

	@Autowired
	RecipeHeaderMapper recipeHeaderDao;

	@Override
	public int addFromList(List<RecipeHeader> rhList) {
		// TODO Auto-generated method stub
		return recipeHeaderDao.addFromList(rhList);
	}
}
