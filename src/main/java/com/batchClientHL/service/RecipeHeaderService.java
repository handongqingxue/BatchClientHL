package com.batchClientHL.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.batchClientHL.entity.*;

public interface RecipeHeaderService {

	int addFromList(List<RecipeHeader> rhList);

	List<RecipeHeader> getList();

	/**
	 * 根据配方id查询配方头表信息（即使一个产品有两个配方，配方id是唯一的，就通过配方id查询了）
	 * @param recipeID
	 * @return
	 */
	RecipeHeader getByRecipeID(String recipeID);
}
