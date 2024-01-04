package com.batchClientHL.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.batchClientHL.entity.*;

public interface RecipeHeaderMapper {

	int addFromList(@Param("rhList") List<RecipeHeader> rhList);

	List<RecipeHeader> getList();

	/**
	 * 根据配方id查询配方头表信息
	 * @param recipeID
	 * @return
	 */
	RecipeHeader getByRecipeID(@Param("recipeID") String recipeID);

}
