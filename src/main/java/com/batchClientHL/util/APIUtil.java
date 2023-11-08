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
}
