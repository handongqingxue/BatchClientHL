package com.batchClientHL.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.batchClientHL.entity.RecipeHeader;
import com.batchClientHL.util.*;

@Controller
@RequestMapping("/batch")
public class BatchController {

	public static final String MODULE_NAME="batch";
	
	@RequestMapping(value="/initRecipeHeader")
	@ResponseBody
	public Map<String, Object> initRecipeHeader() {

		Map<String, Object> jsonMap = new HashMap<String, Object>();

		try {
			JSONObject recipeListJO = APIUtil.getItemJO("RecipeList");
			String recipeListData = recipeListJO.getString("data");
			Map<String, Object> resultMap = APIUtil.convertItemDataToEntity(APIUtil.RECIPE_LIST,recipeListData);
			List<RecipeHeader> recipeHeaderList = (List<RecipeHeader>)resultMap.get("recipeHeaderList");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			jsonMap.put("message", "no");
			jsonMap.put("info", "添加配方信息失败");
		}
		finally {
			return jsonMap;
		}
	}
}
