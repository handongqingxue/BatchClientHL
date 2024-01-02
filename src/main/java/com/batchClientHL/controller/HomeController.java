package com.batchClientHL.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.batchClientHL.entity.*;
import com.batchClientHL.service.*;

@Controller
@RequestMapping("/home")
public class HomeController {

	@Autowired
	private RecipeHeaderService recipeHeaderService;
	@Autowired
	private RecipePMService recipePMService;
	public static final String MODULE_NAME="home";
	
	@RequestMapping(value="/recipeManager")
	public String goRecipeManager(HttpServletRequest request) {

		return MODULE_NAME+"/recipeManager";
	}
	
	@RequestMapping(value="/getRecipeHeaderList")
	@ResponseBody
	public Map<String, Object> getRecipeHeaderList(){

		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		List<RecipeHeader> recipeHeaderList=recipeHeaderService.getList();
		
		if(recipeHeaderList.size()==0) {
			jsonMap.put("status", "no");
			jsonMap.put("message", "暂无配方信息！");
		}
		else {
			jsonMap.put("status", "ok");
			jsonMap.put("recipeHeaderList", recipeHeaderList);
		}
		
		return jsonMap;
	}
	
	@RequestMapping(value="/getRecipePMListByRecipeID")
	@ResponseBody
	public Map<String, Object> getRecipePMListByRecipeID(String recipeID){

		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		List<RecipePM> recipePMList=recipePMService.getListByRecipeID(recipeID);
		
		if(recipePMList.size()==0) {
			jsonMap.put("status", "no");
			jsonMap.put("message", "暂无配方参数信息！");
		}
		else {
			jsonMap.put("status", "ok");
			jsonMap.put("recipePMList", recipePMList);
		}
		
		return jsonMap;
	}
}
