package com.batchClientHL.service.serviceImpl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
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
			String recipeID = recipeHeader.getRecipeID();
			String productName=recipeHeader.getProductName();
			String author = recipeHeader.getAuthor();
			String productDsc = recipeHeader.getProductDsc();
			for (TrTable trTable : trTableList) {
				String eName = trTable.getEName();
				String cName = trTable.getCName();
				if(recipeID.equals(eName)) {
					recipeHeader.setRecipeIDCName(cName);
				}
				if(productName.equals(eName)) {
					recipeHeader.setProductNameCName(cName);
				}
				if(author.equals(eName)) {
					recipeHeader.setAuthorCName(cName);
				}
				if(productDsc.equals(eName)) {
					recipeHeader.setProductDscCName(cName);
				}
				
				String recipeIDCName = recipeHeader.getRecipeIDCName();
				String productNameCName = recipeHeader.getProductNameCName();
				String authorCName = recipeHeader.getAuthorCName();
				String productDscCName = recipeHeader.getProductDscCName();
				if(!StringUtils.isEmpty(recipeIDCName)&&
				   !StringUtils.isEmpty(productNameCName)&&
				   !StringUtils.isEmpty(authorCName)&&
				   !StringUtils.isEmpty(productDscCName)) {
					break;
				}
			}
		}
		return recipeHeaderList;
	}

	@Override
	public RecipeHeader getByRecipeID(String recipeID) {
		// TODO Auto-generated method stub
		return recipeHeaderDao.getByRecipeID(recipeID);
	}
}
