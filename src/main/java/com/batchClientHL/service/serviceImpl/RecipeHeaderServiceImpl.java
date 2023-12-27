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
	@Autowired
	TrTableMapper trTableDao;

	@Override
	public int addFromList(List<RecipeHeader> rhList) {
		// TODO Auto-generated method stub
		return recipeHeaderDao.addFromList(rhList);
	}

	@Override
	public List<RecipeHeader> getList() {
		// TODO Auto-generated method stub
		List<RecipeHeader> recipeHeaderList = recipeHeaderDao.getList();
		List<TrTable> trTableList=trTableDao.getList();
		for (RecipeHeader recipeHeader : recipeHeaderList) {
			String rHRecipeID = recipeHeader.getRecipeID();
			for (TrTable trTable : trTableList) {
				String eName = trTable.getEName();
				if(rHRecipeID.equals(eName)) {
					String cName = trTable.getCName();
					recipeHeader.setRecipeIDCName(cName);
					break;
				}
			}
		}
		return recipeHeaderList;
	}
}
