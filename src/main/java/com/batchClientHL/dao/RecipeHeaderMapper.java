package com.batchClientHL.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.batchClientHL.entity.*;

public interface RecipeHeaderMapper {

	int addFromList(@Param("rhList") List<RecipeHeader> rhList);

}
