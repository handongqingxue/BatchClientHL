package com.batchClientHL.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.json.JSONException;
import org.json.JSONObject;

import com.batchClientHL.entity.*;
import com.thingworx.sdk.batch.BatchComBridge;

public class APIUtil {

	public static final String ITEM_RESULT="item";
	public static final String LIST_RESULT="list";
	
	public static final String SUCCESS="success";
	public static final boolean SUCCESS_TRUE=true;
	public static final boolean SUCCESS_FALSE=false;
	
	public static final String STATE="state";
	/**
	 * 001正常状态(001正常 002数据格式有误 003数据不完整)
	 */
	public static final String STATE_001="001";
	/**
	 * 002数据格式有误状态(001正常 002数据格式有误 003数据不完整)
	 */
	public static final String STATE_002="002";
	/**
	 * 003数据不完整状态(001正常 002数据格式有误 003数据不完整)
	 */
	public static final String STATE_003="003";
	
	public static final String MSG="msg";
	/**
	 * 正常
	 */
	public static final String MSG_NORMAL="正常";
	/**
	 * 数据格式有误
	 */
	public static final String MSG_DATA_FORMAT_ERROR="数据格式有误";
	
	public static final String MESSAGE="message";
	public static final String MESSAGE_OK="ok";
	
	public static final String RECIPE_LIST="RecipeList";
	public static final String PROCEDURE_ID_DATA="ProcedureIDData";
	
	public static String getItemVal(String key, int rowNumber) throws JSONException {
		//val = BLKey_x("key",rowNumber);
		String resultJOStr = getItem(key+rowNumber);
		JSONObject resultJO = new JSONObject(resultJOStr);
		String val = resultJO.getString("data");
		//val = val.substring(0, val.indexOf(Constant.END_SUCCESS));
		return val;
	}
	
	public static JSONObject getItemJO(String key, int rowNumber) throws JSONException {
		String resultJOStr = getItem(key+rowNumber);
		JSONObject resultJO = new JSONObject(resultJOStr);
		return resultJO;
	}
	
	public static JSONObject getItemJO(String key) throws JSONException {
		String resultJOStr = getItem(key);
		JSONObject resultJO = new JSONObject(resultJOStr);
		return resultJO;
	}
	
	public static String getItem(String item) {
		//TODO ��Է���Ķ�̬����ʵʱ��������
		PlanResult plan=new PlanResult();
		String json=null;
		String result=null;
		try {
			System.out.println("item==="+item);
			result = BatchComBridge.getInstance().callGetItem(item);
			System.out.println("result==="+result);
			if(StringUtils.isEmpty(result)||
			   BatchView.CANT_PASS_IN_NULL_DISPATCH_OBJECT.equals(result)||
			   BatchView.CANT_MAP_NAME_TO_DISPID_GETITEM.equals(result)) {
				plan.setStatus(0);
				plan.setMsg(result);
				plan.setSuccess(APIUtil.SUCCESS_FALSE);
			}
			else {
				plan.setStatus(1);
				plan.setMsg("success");
				plan.setSuccess(APIUtil.SUCCESS_TRUE);
				plan.setData(result);
			}
			json=JsonUtil.getJsonFromObject(plan);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}
	
	public static Map<String, Object> convertItemDataToEntity(String itemName, String itemData) {

		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			if(RECIPE_LIST.equals(itemName)) {
				List<RecipeHeader> recipeHeaderList=convertItemDataToRecipeHeaderList(itemData);
				jsonMap.put("status", "ok");
				jsonMap.put("recipeHeaderList", recipeHeaderList);
			}
			else if(PROCEDURE_ID_DATA.equals(itemName)) {
				List<ProcedureData> procedureDataList=convertItemDataToProcedureDataList(itemData);
				jsonMap.put("status", "ok");
				jsonMap.put("procedureDataList", procedureDataList);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			jsonMap.put("status", "no");
			jsonMap.put("data", "转换失败");
		}
		finally {
			return jsonMap;
		}
	}
	
	public static List<RecipeHeader> convertItemDataToRecipeHeaderList(String itemData){
		
		List<RecipeHeader> recipeHeaderList=new ArrayList<RecipeHeader>();
		
		RecipeHeader recipeHeader=null;
		String[] itemsArr = itemData.split(BatchView.CRLF_SPACE_SIGN);
		for (int i = 0; i < itemsArr.length; i++) {
			String items = itemsArr[i];
			String[] itemArr = items.split(BatchView.T_SPACE_SIGN);
			String recipeID = itemArr[2];
			String recipeVersion = itemArr[6];
			String recipeVersTime = itemArr[7];
			String author = itemArr[8];
			String productCode = itemArr[5];
			String productName = itemArr[4];
			String recipeDesc = itemArr[3];
			
			recipeHeader=new RecipeHeader();
			recipeHeader.setRecipeID(recipeID);
			recipeHeader.setVersion(recipeVersion);
			recipeHeader.setCreatedDt(recipeVersTime);
			recipeHeader.setAuthor(author);
			recipeHeader.setProductCode(productCode);
			recipeHeader.setProductName(productName);
			recipeHeader.setProductDsc(recipeDesc);
			
			recipeHeaderList.add(recipeHeader);
		}
		
		return recipeHeaderList;
	}
	
	public static List<ProcedureData> convertItemDataToProcedureDataList(String procData){
		
		List<ProcedureData> procedureDataList=new ArrayList<ProcedureData>();
		
		ProcedureData procedureData=null;
		String[] procArr = procData.split(BatchView.CRLF_SPACE_SIGN);
		Integer SVRSignal=Integer.valueOf(procArr[0]);
		String dataList=procArr[1];
		String[] dataArr = dataList.split(BatchView.CRLF_SPACE_SIGN);
		String recpAbstr = dataArr[0];
		String recpDesc = dataArr[1];
		String recpID = dataArr[2];
		String recpCode = dataArr[3];
		String recpVersion = dataArr[4];
		String recpAuthor = dataArr[5];
		String recpDate = dataArr[6];
		String docDim = dataArr[7];
		String[] docDimArr = docDim.split(BatchView.T_SPACE_SIGN);
		Integer Xdim=Integer.valueOf(docDimArr[0]);
		Integer Ydim=Integer.valueOf(docDimArr[1]);
		String areaName = dataArr[8];
		String procCellList = dataArr[9];
		String boundUnit = dataArr[10];
		
		StringBuilder recipeElemListSB=new StringBuilder();
		for (int i = 11; i < docDimArr.length; i++) {
			recipeElemListSB.append(dataArr[i]);
		}
		String recipeElemList = recipeElemListSB.toString();
		String[] recipeElemArr = recipeElemList.split(BatchView.CRLF_SPACE_SIGN);
		for (int i = 0; i < recipeElemArr.length; i++) {
			String recipeElem = recipeElemArr[i];
			String[] recipeElemAttrArr = recipeElem.split(BatchView.T_SPACE_SIGN);
			Integer elemType=Integer.valueOf(recipeElemAttrArr[0]);
			String elemID=recipeElemAttrArr[1];
			String parmList=recipeElemAttrArr[3];
			
			procedureData=new ProcedureData();
			procedureData.setRecpID(recpID);
			procedureData.setElemID(elemID);
			procedureData.setElemType(elemType);
			procedureData.setParmList(parmList);
			
			switch (elemType) {
			case ProcedureData.PARENT_STEP:
				String recipeLink=recipeElemAttrArr[2];
				procedureData.setRecipeLink(recipeLink);
				break;
			case ProcedureData.INITIAL_STEP:
				Integer drawXCordIni=Integer.valueOf(recipeElemAttrArr[2]);
				Integer drawYCordIni=Integer.valueOf(recipeElemAttrArr[3]);
				
				procedureData.setRawXCord(drawXCordIni);
				procedureData.setRawYCord(drawYCordIni);
				break;
			case ProcedureData.TERMINAL_STEP:
				Integer drawXCordTer=Integer.valueOf(recipeElemAttrArr[2]);
				Integer drawYCordTer=Integer.valueOf(recipeElemAttrArr[3]);
				
				procedureData.setRawXCord(drawXCordTer);
				procedureData.setRawYCord(drawYCordTer);
				break;
			case ProcedureData.REGULAR_STEP:
				Integer drawXCordReg=Integer.valueOf(recipeElemAttrArr[2]);
				Integer drawYCordReg=Integer.valueOf(recipeElemAttrArr[3]);
				String stepName=recipeElemAttrArr[4];
				
				procedureData.setRawXCord(drawXCordReg);
				procedureData.setRawYCord(drawYCordReg);
				procedureData.setElemName(stepName);
				break;
			case ProcedureData.TRANSITION:
				Integer drawXCordTra=Integer.valueOf(recipeElemAttrArr[2]);
				Integer drawYCordTra=Integer.valueOf(recipeElemAttrArr[3]);
				String conditionExpression=recipeElemAttrArr[4];

				procedureData.setRawXCord(drawXCordTra);
				procedureData.setRawYCord(drawYCordTra);
				procedureData.setConditionExp(conditionExpression);
				break;
			case ProcedureData.LINK:
				Integer drawXCordLink=Integer.valueOf(recipeElemAttrArr[2]);
				Integer drawYCordLink=Integer.valueOf(recipeElemAttrArr[3]);

				procedureData.setRawXCord(drawXCordLink);
				procedureData.setRawYCord(drawYCordLink);
				break;
			case ProcedureData.OR_DIVERGENCE:
			case ProcedureData.AND_DIVERGENCE:
				String prevElemIDListDiv = recipeElemAttrArr[2];
				String nextElemIDListDiv = recipeElemAttrArr[3];
				
				procedureData.setPrevElemIDList(prevElemIDListDiv);
				procedureData.setNextElemIDList(nextElemIDListDiv);
				break;
			case ProcedureData.OR_CONVERGENCE:
			case ProcedureData.AND_CONVERGENCE:
				String nextElemIDListCon = recipeElemAttrArr[2];
				String prevElemIDListCon = recipeElemAttrArr[3];

				procedureData.setNextElemIDList(nextElemIDListCon);
				procedureData.setPrevElemIDList(prevElemIDListCon);
				break;
			}
			
			procedureDataList.add(procedureData);
		}
		
		
		return procedureDataList;
	}
}
