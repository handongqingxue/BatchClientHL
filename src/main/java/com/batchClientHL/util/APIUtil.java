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
	public static final String CREATE_ID_BATCH_STEP_DATA_LIST="CreateIDBatchStepDataList";
	
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
			else if(CREATE_ID_BATCH_STEP_DATA_LIST.equals(itemName)) {
				List<StepListStatus> stepListStatusList=convertItemDataToStepListStatusList(itemData);
				jsonMap.put("status", "ok");
				jsonMap.put("stepListStatusList", stepListStatusList);
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
		String[] itemsArr = itemData.split(BatchView.DOUBLE_CRLF_SPACE_SIGN);
		for (int i = 0; i < itemsArr.length; i++) {
			String items = itemsArr[i];
			String[] itemArr = items.split(BatchView.DOUBLE_T_SPACE_SIGN);
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
		
		int SVRSignalStartLoc=procData.indexOf(BatchView.SINGLE_CRLF_SPACE_SIGN);
		Integer SVRSignal=Integer.valueOf(procData.substring(0, SVRSignalStartLoc));
		String dataList=procData.substring(SVRSignalStartLoc+2, procData.length());
		String[] dataArr = dataList.split(BatchView.DOUBLE_CRLF_SPACE_SIGN);
		String recpAbstr = dataArr[0];
		String recpDesc = dataArr[1];
		String recpID = dataArr[2];
		String recpCode = dataArr[3];
		String recpVersion = dataArr[4];
		String recpAuthor = dataArr[5];
		String recpDate = dataArr[6];
		String docDim = dataArr[7];
		String[] docDimArr = docDim.split(BatchView.DOUBLE_T_SPACE_SIGN);
		Integer Xdim=Integer.valueOf(docDimArr[0]);
		Integer Ydim=Integer.valueOf(docDimArr[1]);
		String areaName = dataArr[8];
		String procCellList = dataArr[9];
		String boundUnit = dataArr[10];
		
		StringBuilder recipeElemListSB=new StringBuilder();
		for (int i = 11; i < dataArr.length; i++) {
			recipeElemListSB.append(dataArr[i]);
			recipeElemListSB.append(BatchView.SINGLE_CRLF_SPACE_SIGN);
		}
		String recipeElemList = recipeElemListSB.toString();
		String[] recipeElemArr = recipeElemList.split(BatchView.DOUBLE_CRLF_SPACE_SIGN);
		for (int i = 0; i < recipeElemArr.length; i++) {
			String recipeElem=recipeElemArr[i];
			
			int nextTStartLoc=getLocBySpaceSign(recipeElem,BatchView.SINGLE_T_SPACE_SIGN);
			String elemTypeStr=substringByEndLoc(recipeElem,nextTStartLoc);
			Integer elemType=Integer.valueOf(elemTypeStr);
			System.out.println("elemType==="+elemType);
			String otherAttrs = getOtherAttrsStr(nextTStartLoc,BatchView.SINGLE_T_SPACE_SIGN,recipeElem);
			System.out.println("otherAttrs==="+otherAttrs);
			switch (elemType) {
			case ProcedureData.PARENT_STEP:
				nextTStartLoc=getLocBySpaceSign(otherAttrs,BatchView.SINGLE_T_SPACE_SIGN);
				String elemIDPar = substringByEndLoc(otherAttrs,nextTStartLoc);
				System.out.println("elemIDPar==="+elemIDPar);
				otherAttrs = getOtherAttrsStr(nextTStartLoc,BatchView.SINGLE_T_SPACE_SIGN,otherAttrs);
				System.out.println("otherAttrs==="+otherAttrs);
				
				nextTStartLoc=getLocBySpaceSign(otherAttrs,BatchView.SINGLE_T_SPACE_SIGN);
				String recipeLinkPar = substringByEndLoc(otherAttrs,nextTStartLoc);
				System.out.println("recipeLinkPar==="+recipeLinkPar);
				otherAttrs = getOtherAttrsStr(nextTStartLoc,BatchView.SINGLE_T_SPACE_SIGN,otherAttrs);
				System.out.println("otherAttrs==="+otherAttrs);
				
				procedureData=new ProcedureData();
				procedureData.setRecpID(recpID);
				procedureData.setElemType(elemType);
				procedureData.setElemID(elemIDPar);;
				procedureData.setRecipeLink(recipeLinkPar);
				
				//String parmList=recipeElemAttrArr[3];
				//procedureData.setParmList(parmList);
				
				procedureDataList.add(procedureData);
				break;
			case ProcedureData.INITIAL_STEP:
			case ProcedureData.TERMINAL_STEP:
				String[] otherAttrsArrIni = otherAttrs.split(BatchView.DOUBLE_T_SPACE_SIGN);
				String elemIDIni=otherAttrsArrIni[0];
				Integer drawXCordIni=Integer.valueOf(otherAttrsArrIni[1]);
				Integer drawYCordIni=Integer.valueOf(otherAttrsArrIni[2]);

				procedureData=new ProcedureData();
				procedureData.setRecpID(recpID);
				procedureData.setElemType(elemType);
				procedureData.setElemID(elemIDIni);
				procedureData.setDrawXCord(drawXCordIni);
				procedureData.setDrawYCord(drawYCordIni);
				
				procedureDataList.add(procedureData);
				break;
			case ProcedureData.REGULAR_STEP:
				nextTStartLoc=getLocBySpaceSign(otherAttrs,BatchView.SINGLE_T_SPACE_SIGN);
				String elemIDReg = substringByEndLoc(otherAttrs,nextTStartLoc);
				System.out.println("elemIDReg==="+elemIDReg);
				otherAttrs = getOtherAttrsStr(nextTStartLoc,BatchView.SINGLE_T_SPACE_SIGN,otherAttrs);
				System.out.println("otherAttrs==="+otherAttrs);
				
				nextTStartLoc=getLocBySpaceSign(otherAttrs,BatchView.SINGLE_T_SPACE_SIGN);
				Integer drawXCordReg=Integer.valueOf(substringByEndLoc(otherAttrs,nextTStartLoc));
				System.out.println("drawXCordReg==="+drawXCordReg);
				otherAttrs = getOtherAttrsStr(nextTStartLoc,BatchView.SINGLE_T_SPACE_SIGN,otherAttrs);
				System.out.println("otherAttrs==="+otherAttrs);
				
				nextTStartLoc=getLocBySpaceSign(otherAttrs,BatchView.SINGLE_T_SPACE_SIGN);
				Integer drawYCordReg=Integer.valueOf(substringByEndLoc(otherAttrs,nextTStartLoc));
				System.out.println("drawYCordReg==="+drawYCordReg);
				otherAttrs = getOtherAttrsStr(nextTStartLoc,BatchView.SINGLE_T_SPACE_SIGN,otherAttrs);
				System.out.println("otherAttrs==="+otherAttrs);
				
				nextTStartLoc=getLocBySpaceSign(otherAttrs,BatchView.SINGLE_T_SPACE_SIGN);
				String stepNameReg=substringByEndLoc(otherAttrs,nextTStartLoc);
				System.out.println("stepNameReg==="+stepNameReg);

				procedureData=new ProcedureData();
				procedureData.setRecpID(recpID);
				procedureData.setElemType(elemType);
				procedureData.setElemID(elemIDReg);
				procedureData.setDrawXCord(drawXCordReg);
				procedureData.setDrawYCord(drawYCordReg);
				procedureData.setElemName(stepNameReg);
				
				procedureDataList.add(procedureData);
				break;
			case ProcedureData.TRANSITION:
				String[] otherAttrsArrTra = otherAttrs.split(BatchView.DOUBLE_T_SPACE_SIGN);
				String elemIDTra=otherAttrsArrTra[0];
				Integer drawXCordTra=Integer.valueOf(otherAttrsArrTra[1]);
				Integer drawYCordTra=Integer.valueOf(otherAttrsArrTra[2]);
				String conditionExpressionTra=otherAttrsArrTra[3];

				procedureData=new ProcedureData();
				procedureData.setRecpID(recpID);
				procedureData.setElemType(elemType);
				procedureData.setElemID(elemIDTra);
				procedureData.setDrawXCord(drawXCordTra);
				procedureData.setDrawYCord(drawYCordTra);
				procedureData.setConditionExp(conditionExpressionTra);
				
				procedureDataList.add(procedureData);
				break;
			case ProcedureData.LINK:
				String[] otherAttrsArrLink = otherAttrs.split(BatchView.DOUBLE_T_SPACE_SIGN);
				String elemIDLink=otherAttrsArrLink[0];
				String prevElemIDLink=otherAttrsArrLink[1];
				String nextElemIDLink=otherAttrsArrLink[2];

				procedureData=new ProcedureData();
				procedureData.setRecpID(recpID);
				procedureData.setElemType(elemType);
				procedureData.setElemID(elemIDLink);
				procedureData.setPrevElemID(prevElemIDLink);
				procedureData.setNextElemID(nextElemIDLink);
				
				procedureDataList.add(procedureData);
				break;
			case ProcedureData.OR_DIVERGENCE:
			case ProcedureData.AND_DIVERGENCE:
				nextTStartLoc=getLocBySpaceSign(otherAttrs,BatchView.SINGLE_T_SPACE_SIGN);
				String elemIDDiv = substringByEndLoc(otherAttrs,nextTStartLoc);
				System.out.println("elemIDDiv==="+elemIDDiv);
				otherAttrs = getOtherAttrsStr(nextTStartLoc,BatchView.SINGLE_T_SPACE_SIGN,otherAttrs);
				System.out.println("otherAttrs==="+otherAttrs);
				
				nextTStartLoc=getLocBySpaceSign(otherAttrs,BatchView.SINGLE_T_SPACE_SIGN);
				String prevElemIDListDiv=substringByEndLoc(otherAttrs,nextTStartLoc);
				System.out.println("prevElemIDListDiv==="+prevElemIDListDiv);
				String nextElemIDListDiv = getOtherAttrsStr(nextTStartLoc,BatchView.SINGLE_T_SPACE_SIGN,otherAttrs).replaceAll(BatchView.SINGLE_T_SPACE_SIGN, BatchView.DOUBLE_T_SPACE_SIGN);
				System.out.println("nextElemIDListDiv==="+nextElemIDListDiv);
				
				procedureData=new ProcedureData();
				procedureData.setRecpID(recpID);
				procedureData.setElemType(elemType);
				procedureData.setElemID(elemIDDiv);
				procedureData.setPrevElemIDList(prevElemIDListDiv);
				procedureData.setNextElemIDList(nextElemIDListDiv);
				
				procedureDataList.add(procedureData);
				break;
			case ProcedureData.OR_CONVERGENCE:
			case ProcedureData.AND_CONVERGENCE:
				nextTStartLoc=getLocBySpaceSign(otherAttrs,BatchView.SINGLE_T_SPACE_SIGN);
				String elemIDCon = substringByEndLoc(otherAttrs,nextTStartLoc);
				System.out.println("elemIDCon==="+elemIDCon);
				otherAttrs = getOtherAttrsStr(nextTStartLoc,BatchView.SINGLE_T_SPACE_SIGN,otherAttrs);
				System.out.println("otherAttrs==="+otherAttrs);
				
				nextTStartLoc=getLocBySpaceSign(otherAttrs,BatchView.SINGLE_T_SPACE_SIGN);
				String nextElemIDListCon=substringByEndLoc(otherAttrs,nextTStartLoc);
				System.out.println("nextElemIDListCon==="+nextElemIDListCon);
				String prevElemIDListCon = getOtherAttrsStr(nextTStartLoc,BatchView.SINGLE_T_SPACE_SIGN,otherAttrs).replaceAll(BatchView.SINGLE_T_SPACE_SIGN, BatchView.DOUBLE_T_SPACE_SIGN);
				System.out.println("prevElemIDListCon==="+prevElemIDListCon);
				
				procedureData=new ProcedureData();
				procedureData.setRecpID(recpID);
				procedureData.setElemType(elemType);
				procedureData.setElemID(elemIDCon);
				procedureData.setNextElemIDList(nextElemIDListCon);
				procedureData.setPrevElemIDList(prevElemIDListCon);
				
				procedureDataList.add(procedureData);
				break;
			}
		}
		
		
		return procedureDataList;
	}
	
	public static List<StepListStatus> convertItemDataToStepListStatusList(String itemData){
		
		List<StepListStatus> stepListStatusList=new ArrayList<StepListStatus>();
		
		StepListStatus stepListStatus=null;
		
		String[] itemArr = itemData.split(BatchView.DOUBLE_CRLF_SPACE_SIGN);
		for (String item : itemArr) {
			int parmTLoc = getLocBySpaceSign(item,"$PARM"+BatchView.SINGLE_T_SPACE_SIGN);
			String preAttrsStr = substringByEndLoc(item,parmTLoc);
			String[] preAttrArr = preAttrsStr.split(BatchView.DOUBLE_T_SPACE_SIGN);
			String elemID = preAttrArr[0];
			String elemName = preAttrArr[1];
			int sP88Type = Integer.valueOf(preAttrArr[2]);
			String keyPName = preAttrArr[3];
			String keyValue = preAttrArr[4];
			String state = preAttrArr[5];
			String mode = preAttrArr[6];
			String unitName = preAttrArr[7];
			String control = preAttrArr[8];
			String index = preAttrArr[9];
			int paused = Integer.valueOf(preAttrArr[10]);
			String msg = preAttrArr[11];
			String rqst = preAttrArr[12];
			String fail = preAttrArr[13];
			
			System.out.println("elemID="+elemID);
			System.out.println("elemName="+elemName);
			System.out.println("sP88Type="+sP88Type);
			System.out.println("keyPName="+keyPName);
			System.out.println("keyValue="+keyValue);
			System.out.println("state="+state);
			System.out.println("mode="+mode);
			System.out.println("unitName="+unitName);
			System.out.println("control="+control);
			System.out.println("index="+index);
			System.out.println("paused="+paused);
			System.out.println("msg="+msg);
			System.out.println("rqst="+rqst);
			System.out.println("fail="+fail);
			
			String otherAttrsStr = getOtherAttrsStr(parmTLoc,"$PARM"+BatchView.DOUBLE_T_SPACE_SIGN,item);
			int tEndLoc = getLocBySpaceSign(otherAttrsStr,BatchView.SINGLE_T_SPACE_SIGN+"$END");
			String parmListStr = substringByEndLoc(otherAttrsStr,tEndLoc);
			System.out.println("parmListStr="+parmListStr);

			int reportTLoc = getLocBySpaceSign(otherAttrsStr,"$REPORT"+BatchView.SINGLE_T_SPACE_SIGN);
			otherAttrsStr = getOtherAttrsStr(reportTLoc,"$REPORT"+BatchView.DOUBLE_T_SPACE_SIGN,otherAttrsStr);
			tEndLoc = getLocBySpaceSign(otherAttrsStr,BatchView.SINGLE_T_SPACE_SIGN+"$END");
			String reportListStr = substringByEndLoc(otherAttrsStr,tEndLoc);
			System.out.println("reportListStr="+reportListStr);
			
			otherAttrsStr=getOtherAttrsStr(tEndLoc,BatchView.SINGLE_T_SPACE_SIGN+"$END",otherAttrsStr);
			int lastTSpaceSignLoc = getLocBySpaceSign(otherAttrsStr,BatchView.SINGLE_T_SPACE_SIGN);
			String nextAttrsStr = getOtherAttrsStr(lastTSpaceSignLoc,BatchView.SINGLE_T_SPACE_SIGN,otherAttrsStr);
			System.out.println("nextAttrsStr="+nextAttrsStr);
			String[] nextAttrArr = nextAttrsStr.split(BatchView.DOUBLE_T_SPACE_SIGN);
			System.out.println("nextAttrArrLength="+nextAttrArr.length);
			String ownerID = nextAttrArr[0];
			String ownerName = nextAttrArr[1];
			String cmdMask = nextAttrArr[2];
			
			System.out.println("ownerID="+ownerID);
			System.out.println("ownerName="+ownerName);
			System.out.println("cmdMask="+cmdMask);
			
			stepListStatus=new StepListStatus();
			stepListStatus.setElemID(elemID);
			stepListStatus.setElemName(elemName);
			stepListStatus.setSP88Type(sP88Type);
			stepListStatus.setKeyPName(keyPName);
			stepListStatus.setKeyValue(keyValue);
			stepListStatus.setState(state);
			stepListStatus.setMode(mode);
			stepListStatus.setUnitName(unitName);
			stepListStatus.setControl(control);
			stepListStatus.setIndex(index);
			stepListStatus.setPaused(paused);
			stepListStatus.setMsg(msg);
			stepListStatus.setRqst(rqst);
			stepListStatus.setFail(fail);
			stepListStatus.setParmList(parmListStr);
			stepListStatus.setRepParmList(parmListStr);
			stepListStatus.setOwnerID(ownerID);
			stepListStatus.setOwnerName(ownerName);
			
			stepListStatusList.add(stepListStatus);
		}
		
		return stepListStatusList;
	}
	
	/**
	 * 获取字符串里分隔符位置
	 * @param str
	 * @param spaceSign
	 * @return
	 */
	public static int getLocBySpaceSign(String str, String spaceSign) {
		return str.indexOf(spaceSign);
	}
	
	/**
	 * 截取结束位置之前的字符串
	 * @param str
	 * @param endLoc
	 * @return
	 */
	public static String substringByEndLoc(String str, int endLoc) {
		return str.substring(0, endLoc);
	}
	
	/**
	 * 截取分隔符后面剩余的字符串
	 * @param startLoc
	 * @param spaceSign
	 * @param attrsStr
	 * @return
	 */
	public static String getOtherAttrsStr(int startLoc, String spaceSign,String attrsStr) {
		return attrsStr.substring(startLoc+spaceSign.length(), attrsStr.length());
	}
}
