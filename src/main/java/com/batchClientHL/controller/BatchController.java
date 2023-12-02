package com.batchClientHL.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.batchClientHL.util.*;
import com.batchClientHL.entity.*;
import com.batchClientHL.service.*;

@Controller
@RequestMapping("/batch")
public class BatchController {

	public static final String MODULE_NAME="batch";
	@Autowired
	private RecipeHeaderService recipeHeaderService;
	@Autowired
	private ProcedureDataService procedureDataService;
	@Autowired
	private StepListStatusService stepListStatusService;
	
	@RequestMapping(value="/initRecipeHeader")
	@ResponseBody
	public Map<String, Object> initRecipeHeader() {

		Map<String, Object> jsonMap = new HashMap<String, Object>();

		try {
			JSONObject recipeListJO = APIUtil.getItemJO(APIUtil.RECIPE_LIST);
			String recipeListData = recipeListJO.getString("data");
			Map<String, Object> resultMap = APIUtil.convertItemDataToEntity(APIUtil.RECIPE_LIST,recipeListData);
			List<RecipeHeader> recipeHeaderList = (List<RecipeHeader>)resultMap.get("recipeHeaderList");
			recipeHeaderService.addFromList(recipeHeaderList);
			
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
	
	@RequestMapping(value="/initProcedureData")
	@ResponseBody
	public Map<String, Object> initProcedureData(String procedureID) {

		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		try {	
			procedureID=APIUtil.PROCEDURE_ID_DATA.replaceAll("ProcedureID", procedureID.replaceAll(BatchView.T_SIGN,BatchView.SINGLE_T_SPACE_SIGN));
			JSONObject procedureIDDataJO = APIUtil.getItemJO(procedureID);
			String procedureIDData = procedureIDDataJO.getString("data");
			Map<String, Object> resultMap = APIUtil.convertItemDataToEntity(APIUtil.PROCEDURE_ID_DATA,procedureIDData);
			List<ProcedureData> procedureDataList = (List<ProcedureData>)resultMap.get("procedureDataList");
			procedureDataService.addFromList(procedureDataList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			jsonMap.put("message", "no");
			jsonMap.put("info", "添加过程信息失败");
		}
		finally {
			return jsonMap;
		}
	}
	
	@RequestMapping(value="/initStepListStatus")
	@ResponseBody
	public Map<String, Object> initStepListStatus(String createID) {

		Map<String, Object> jsonMap = new HashMap<String, Object>();

		try {	
			createID=APIUtil.CREATE_ID_BATCH_STEP_DATA_LIST.replaceAll("CreateID", createID);
			JSONObject createIDBatchStepDataListJO = APIUtil.getItemJO(createID);
			String createIDBatchStepDataListStr = createIDBatchStepDataListJO.getString("data");
			Map<String, Object> resultMap = APIUtil.convertItemDataToEntity(APIUtil.CREATE_ID_BATCH_STEP_DATA_LIST,createIDBatchStepDataListStr);
			List<StepListStatus> stepListStatusList = (List<StepListStatus>)resultMap.get("stepListStatusList");
			if(stepListStatusList.size()==0) {
				jsonMap.put("message", "no");
				jsonMap.put("info", "暂无步序状态信息");
			}
			else {
				stepListStatusService.addFromList(stepListStatusList);

				jsonMap.put("message", "ok");
				jsonMap.put("info", "添加步序状态信息成功");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			jsonMap.put("message", "no");
			jsonMap.put("info", "添加步序状态信息失败");
		}
		finally {
			return jsonMap;
		}
	}
	
	@RequestMapping(value="/getDrawProSFCData")
	@ResponseBody
	public Map<String, Object> getDrawProSFCData(String recpID) {

		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		Map<String,Object> drawSFCMap=procedureDataService.getDrawSFCMapByRecpID(recpID);

		jsonMap.put("drawSFCMap", drawSFCMap);
		
		return jsonMap;
	}
}
