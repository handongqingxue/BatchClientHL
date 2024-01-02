package com.batchClientHL.service;

import java.util.List;

import com.batchClientHL.entity.*;

public interface RecipePMService {
	
	List<RecipePM> getListByRecipeID(String recipeID);
}
