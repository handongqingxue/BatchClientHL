package com.batchClientHL.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.batchClientHL.entity.*;

public interface RecipeHeaderService {

	int addFromList(List<RecipeHeader> rhList);

	List<RecipeHeader> getList();
}
