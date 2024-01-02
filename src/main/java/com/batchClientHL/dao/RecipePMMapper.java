package com.batchClientHL.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.batchClientHL.entity.*;

public interface RecipePMMapper {

	List<RecipePM> getListByRecipeID(@Param("recipeID") String recipeID);
}
