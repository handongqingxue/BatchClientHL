package com.batchClientHL.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
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
	@Autowired
	private WorkOrderService workOrderService;
	@Autowired
	private WorkOrderPMService workOrderPMService;
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private SimpleDateFormat woIdSDF = new SimpleDateFormat("yyyyMMddHHmmss");
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
	
	@RequestMapping(value="/handCreateWO")
	@ResponseBody
	public Map<String, Object> handCreateWO(String recipeID){

		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		try {
			RecipeHeader recipeHeader=recipeHeaderService.getByRecipeID(recipeID);
			String workOrderIDSGCJ = woIdSDF.format(new Date());
			String productCodeSGCJ = recipeHeader.getProductCode();
			String productNameSGCJ = recipeHeader.getProductName();
			String identifierSGCJ = recipeHeader.getIdentifier();
			String formulaIdSGCJ=workOrderService.createFormulaIdByDateYMD(identifierSGCJ);//这个执行配方id是手工创建工单时生成的
			String unitIDSGCJ = recipeHeader.getUnitID();
			
			WorkOrder woSGCJ=new WorkOrder();
			woSGCJ.setWorkOrderID(workOrderIDSGCJ);
			woSGCJ.setProductCode(productCodeSGCJ);
			woSGCJ.setProductName(productNameSGCJ);
			woSGCJ.setTotalOutput((float)0);
			woSGCJ.setRecipeID(recipeID);
			woSGCJ.setFormulaId(formulaIdSGCJ);
			woSGCJ.setCreateTime(sdf.format(new Date()));

			if(StringUtils.isEmpty(unitIDSGCJ))
				unitIDSGCJ = createUnitIDByIdentifier(recipeHeader.getIdentifier());
			woSGCJ.setUnitID(unitIDSGCJ);
			woSGCJ.setIdentifier(identifierSGCJ);
			woSGCJ.setCreateType(WorkOrder.HAND_CREATE);
			woSGCJ.setBatchCreated(WorkOrder.UN_CREATE);
			woSGCJ.setState(WorkOrder.WLQTWB);
			
			int addCount=workOrderService.add(woSGCJ);
			if(addCount>0) {
				workOrderPMService.addFromRecPM(workOrderIDSGCJ, recipeID, null);
				
				jsonMap.put("state","ok");
				jsonMap.put("message","创建成功！");
			}
			else {
				jsonMap.put("state","no");
				jsonMap.put("message","创建失败！");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			jsonMap.put("state","no");
			jsonMap.put("message","创建失败！");
		}
		finally {
			return jsonMap;
		}
	}
	
	/**
	 * 根据配方名创建UnitID
	 * @param identifier
	 * @return
	 */
	private String createUnitIDByIdentifier(String identifier) {
		String unitID=null;
		if(identifier.contains("51"))
			unitID="09";
		else if(identifier.contains("52"))
			unitID="10";
		else if(identifier.contains("61"))
			unitID="11";
		else if(identifier.contains("62"))
			unitID="12";
		return unitID;
	}
}
