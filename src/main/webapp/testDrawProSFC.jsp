<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String basePath=request.getScheme()+"://"+request.getServerName()+":"
		+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="<%=basePath %>js/jquery-3.3.1.js"></script>
<script type="text/javascript">
var path='<%=basePath %>';

var initialStepInt=Number('${requestScope.initialStep}');
var regularStepInt=Number('${requestScope.regularStep}');
var transitionInt=Number('${requestScope.transition}');
var terminalStepInt=Number('${requestScope.terminalStep}');
var linkInt=Number('${requestScope.link}');
var andDivergenceInt=Number('${requestScope.andDivergence}');
var andConvergenceInt=Number('${requestScope.andConvergence}');

var initialStepText='${requestScope.initialStepText}';
var regularStepText='${requestScope.regularStepText}';
var transitionText='${requestScope.transitionText}';
var terminalStepText='${requestScope.terminalStepText}';
var linkText='${requestScope.linkText}';
var andDivergenceText='${requestScope.andDivergenceText}';
var andConvergenceText='${requestScope.andConvergenceText}';

var singleTSpaceSign='${requestScope.singleTSpaceSign}';
var tSign='${requestScope.tSign}';

var drawSFCMap;
var defaultScale=1;//默认缩放比例
var changeScale=0.3;//设置的缩放比例

var initStepDivWidth=100;//起始步序框宽度
var initStepDivHeight=50;//起始步序框高度
var initStepDivMarginLeft;//起始步序框浏览器距离左边像素
var initStepDivMarginTop;//起始步序框浏览器距离上方像素

var stepDivWidth=200;//步序框宽度
var stepDivHeight=45;//步序框高度

var traCrossHorDivWidth=40;//状态变更十字架横线宽度
var traCrossHorDivHeight=2;//状态变更十字架横线高度

var traCrossVerDivWidth=2;//状态变更十字架竖线宽度
var traCrossVerDivHeight=40;//状态变更十字架竖线高度

var terTextSpanMarginTopSpace=-10;//状态字样距离上方的空隙
var tTextSpanMarginLeftSpace=-30;
var tTextSpanMarginTopSpace=-15;

var linkDivWidth=2;//连接线宽度

var terDivWidth=40;
var terDivHeight=2;

var terStepDivWidth=40;
var terStepDivHeight=2;

var andDivHorDivStartSpace=-10;
var andDivHorDivEndSpace=10;
var andDivHorDivUpSpace=-10;

var andConvHorDivStartSpace=-10;
var andConvHorDivEndSpace=10;
var andConvHorDivUpSpace=-10;

var initialStep;//初始步序对象
var regularStepList;//常规步序对象集合
var transitionList;//状态改变步序对象集合
var terminalStep;//终点步序对象

var createID=116;
//var procedureID=createID;
//var procedureID=createID+"tCLS_SWEETCREAM_UP:1";
var procedureID=createID+"tCLS_SWEETCREAM_UP:1tCLS_SWEETCREAM_OP:1";
$(function(){
	getDrawProSFCData();
});

function getDrawProSFCData(){
	$.post(path+"batch/getDrawProSFCData",
		{procedureID:procedureID},//CLS_FRENCHVANILLA  CLS_SWEETCREAM_UP  CLS_SWEETCREAM_OP
		function(result){
			drawSFCMap=result.drawSFCMap;
			console.log(initialStepText)
			drawInitialStep();
			drawRegularStep();
			drawTransition();
			drawTerminalStep();
			drawLink();
			drawAndDivergence();
			drawAndConvergence();
			
			setInterval(function(){
				initStepListStatus();
				getStepListStatus();
			},"2000")
		}
	,"json");
}

function initStepListStatus(){
	$.post(path+"batch/initStepListStatus",
		{createID:createID},
		function(result){
			
		}
	,"json");
}

function getStepListStatus(){
	$.post(path+"batch/getStepListStatus",
		{createID:createID},
		function(result){
			if(result.message=="ok"){
				var stepListStatusList=result.stepListStatusList;
				for(var i=0;i<stepListStatusList.length;i++){
					var stepListStatus=stepListStatusList[i];
					var slsSp88Type=stepListStatus.sp88Type;
					var slsState=stepListStatus.state;
					var slsElemID=stepListStatus.elemID;
					var slsUnitName=stepListStatus.unitName;
					var slsState=stepListStatus.state;
					var slsMode=stepListStatus.mode;
					//console.log("ElemID="+slsElemID);
					for(var j=0;j<regularStepList.length;j++){
						var regularStep=regularStepList[j];
						if(slsElemID==regularStep.elemID){
							//console.log(stepListStatus);
							//console.log("ElemID111="+stepListStatus.elemID+",SP88Type="+slsSp88Type);
							var regStepDiv=$("#up_div #content_div #reg_step_div"+slsElemID);
							var nameDiv=regStepDiv.find("#name_div"+slsElemID);
							if(slsSp88Type==2){
								var unitNameDiv=regStepDiv.find("#unitName_div"+slsElemID);
								unitNameDiv.css("display","block");
								unitNameDiv.text(slsUnitName);
								if(slsState==" "){
									regStepDiv.find("#state_div"+slsElemID).find("#state_span").text("");
									regStepDiv.find("#state_div"+slsElemID).find("#mode_span").text("");

									regStepDiv.css("background-color","#fff");
									nameDiv.css("color","#000");
									unitNameDiv.css("color","#000");
								}
								else if(slsState=="RUNNING"||
										slsState=="RESTART"){
									regStepDiv.find("#state_div"+slsElemID).find("#state_span").text(slsState);
									regStepDiv.find("#state_div"+slsElemID).find("#mode_span").text(slsMode);

									regStepDiv.css("background-color","#46A758");
									nameDiv.css("color","#fff");
									unitNameDiv.css("color","#fff");
								}
								else if(slsState=="HOLDING"){
									regStepDiv.find("#state_div"+slsElemID).find("#state_span").text(slsState);
									regStepDiv.find("#state_div"+slsElemID).find("#mode_span").text(slsMode);

									regStepDiv.css("background-color","yellow");
									nameDiv.css("color","#fff");
									unitNameDiv.css("color","#fff");
								}
								else if(slsState=="HELD"){
									regStepDiv.find("#state_div"+slsElemID).find("#state_span").text(slsState);
									regStepDiv.find("#state_div"+slsElemID).find("#mode_span").text(slsMode);

									regStepDiv.css("background-color","#84853E");
									nameDiv.css("color","#fff");
									unitNameDiv.css("color","#fff");
								}
							}
							if(slsSp88Type==3){
								if(slsState==" "){
									regStepDiv.find("#state_div"+slsElemID).find("#state_span").text("");
									regStepDiv.find("#state_div"+slsElemID).find("#mode_span").text("");

									regStepDiv.css("background-color","#fff");
									nameDiv.css("color","#000");
								}
								else if(slsState=="RUNNING"||
										slsState=="RESTART"){
									regStepDiv.find("#state_div"+slsElemID).find("#state_span").text(slsState);
									regStepDiv.find("#state_div"+slsElemID).find("#mode_span").text(slsMode);

									regStepDiv.css("background-color","#46A758");
									nameDiv.css("color","#fff");
								}
								else if(slsState=="HOLDING"){
									regStepDiv.find("#state_div"+slsElemID).find("#state_span").text(slsState);
									regStepDiv.find("#state_div"+slsElemID).find("#mode_span").text(slsMode);

									regStepDiv.css("background-color","yellow");
									nameDiv.css("color","#fff");
								}
								else if(slsState=="HELD"){
									regStepDiv.find("#state_div"+slsElemID).find("#state_span").text(slsState);
									regStepDiv.find("#state_div"+slsElemID).find("#mode_span").text(slsMode);

									regStepDiv.css("background-color","#84853E");
									nameDiv.css("color","#fff");
								}
							}
							else if(slsSp88Type==4){
								var keyValueDiv=regStepDiv.find("#keyValue_div"+slsElemID);
								keyValueDiv.css("display","block");
								keyValueDiv.text(stepListStatus.keyValue);
								if(slsState==" "){
									regStepDiv.find("#state_div"+slsElemID).find("#state_span").text("");
									regStepDiv.find("#state_div"+slsElemID).find("#mode_span").text("");

									regStepDiv.css("background-color","#fff");
									nameDiv.css("color","#000");
									keyValueDiv.css("color","#000");
								}
								else if(slsState=="RUNNING"||
										slsState=="RESTART"){
									regStepDiv.find("#state_div"+slsElemID).find("#state_span").text(slsState);
									regStepDiv.find("#state_div"+slsElemID).find("#mode_span").text(slsMode);
									
									regStepDiv.css("background-color","#46A758");
									nameDiv.css("color","#fff");
									keyValueDiv.css("color","#fff");
								}
								else if(slsState=="HOLDING"){
									regStepDiv.find("#state_div"+slsElemID).find("#state_span").text(slsState);
									regStepDiv.find("#state_div"+slsElemID).find("#mode_span").text(slsMode);
									
									regStepDiv.css("background-color","yellow");
									nameDiv.css("color","#fff");
									keyValueDiv.css("color","#fff");
								}
								else if(slsState=="HELD"){
									regStepDiv.find("#state_div"+slsElemID).find("#state_span").text(slsState);
									regStepDiv.find("#state_div"+slsElemID).find("#mode_span").text(slsMode);
									
									regStepDiv.css("background-color","#84853E");
									nameDiv.css("color","#fff");
									keyValueDiv.css("color","#fff");
								}
								else if(slsState=="COMPLETE"){
									regStepDiv.find("#state_div"+slsElemID).find("#state_span").text(slsState);
									regStepDiv.find("#state_div"+slsElemID).find("#mode_span").text(slsMode);
									
									regStepDiv.css("background-color","#676A71");
									nameDiv.css("color","#fff");
									keyValueDiv.css("color","#fff");
								}
							}
						}
					}
				}
			}
		}
	,"json");
}

//绘制初始步序图
function drawInitialStep(){
	initialStep=drawSFCMap[initialStepText];
	var drawXCord=initialStep.drawXCord;//batch端的x坐标
	var drawYCord=initialStep.drawYCord;
	initStepDivMarginLeft=drawXCord*changeScale;//按比例转换后在浏览器里的x坐标
	initStepDivMarginTop=drawYCord*changeScale;
	
	var contentDiv=$("#up_div #content_div");
	var initialStepStr="<div class=\"init_out_div\" id=\"init_step_div\">";
			initialStepStr+="<div class=\"init_in_div\"></div>";
	   initialStepStr+="</div>";
		initialStepStr+="";
	contentDiv.append(initialStepStr);
	
	var initStepDiv=$("#init_step_div");
	initStepDiv.css("width",convertNumToPx(initStepDivWidth));
	initStepDiv.css("height",convertNumToPx(initStepDivHeight));
	initStepDiv.css("margin-left",initStepDivMarginLeft);
	initStepDiv.css("margin-top",initStepDivMarginTop);
}

//绘制常规步序图
function drawRegularStep(){
	regularStepList=drawSFCMap[regularStepText];
	var contentDiv=$("#up_div #content_div");
	for(var i=0;i<regularStepList.length;i++){
		var regularStep=regularStepList[i];
		var elemID=regularStep.elemID;
		var elemName=regularStep.elemName;
		var drawXCord=regularStep.drawXCord;
		var drawYCord=regularStep.drawYCord;
		
		var regularStepStr="<div class=\"reg_step_div\" id=\"reg_step_div"+elemID+"\">";
				regularStepStr+="<div class=\"name_div\" id=\"name_div"+elemID+"\">";
					regularStepStr+=elemName;
				regularStepStr+="</div>";
				regularStepStr+="<div class=\"unitName_div\" id=\"unitName_div"+elemID+"\">";
					//regularStepStr+="WP_FREEZER1";
				regularStepStr+="</div>";
				regularStepStr+="<div class=\"keyValue_div\" id=\"keyValue_div"+elemID+"\">";
					//regularStepStr+="200 KG";
				regularStepStr+="</div>";
				regularStepStr+="<div class=\"state_div\" id=\"state_div"+elemID+"\">";
					regularStepStr+="<span id=\"state_span\"></span>";
					regularStepStr+="<span id=\"mode_span\"></span>";
			regularStepStr+="</div>";
		   regularStepStr+="</div>";
		contentDiv.append(regularStepStr);
	
		var regStepDiv=$("#reg_step_div"+elemID);
		
		var drawXCordScale=drawXCord*changeScale;
		var drawYCordScale=drawYCord*changeScale;
		
		regularStep.drawXCordScale=drawXCordScale;
		regularStep.drawYCordScale=drawYCordScale;
		
		regStepDiv.css("width",convertNumToPx(stepDivWidth));
		regStepDiv.css("height",convertNumToPx(stepDivHeight));
		regStepDiv.css("margin-left",convertNumToPx(drawXCordScale));
		regStepDiv.css("margin-top",convertNumToPx(drawYCordScale));
	}
	
}

function drawTransition(){
	transitionList=drawSFCMap[transitionText];
	var contentDiv=$("#up_div #content_div");
	for(var i=0;i<transitionList.length;i++){
		var transition=transitionList[i];
		var elemID=transition.elemID;
		var conditionExp=transition.conditionExp;
		var drawXCord=transition.drawXCord;
		var drawYCord=transition.drawYCord;
		var drawXCordScale=drawXCord*changeScale;
		var drawYCordScale=drawYCord*changeScale;
		
		var traCrossHorDivStr="<div class=\"tra_cross_hor_div\" id=\"tra_cross_hor_div"+elemID+"\"></div>";
		contentDiv.append(traCrossHorDivStr);

		var traCrossHorDiv=$("#tra_cross_hor_div"+elemID);
		traCrossHorDiv.css("width",convertNumToPx(traCrossHorDivWidth));
		traCrossHorDiv.css("height",convertNumToPx(traCrossHorDivHeight));
		traCrossHorDiv.css("margin-left",convertNumToPx(drawXCordScale));//坐标不是以英文字符为准，是以横线坐标为准
		traCrossHorDiv.css("margin-top",convertNumToPx(drawYCordScale));
		
		transition.crossHorDivMarginLeft=drawXCordScale;
		transition.crossHorDivMarginTop=drawYCordScale;
		
		var traCrossVerDivStr="<div class=\"tra_cross_ver_div\" id=\"tra_cross_ver_div"+elemID+"\"></div>";
		contentDiv.append(traCrossVerDivStr);

		var traCrossVerDiv=$("#tra_cross_ver_div"+elemID);
		
		var crossVerDivMarginLeft=drawXCordScale+traCrossHorDivWidth/2;
		var crossVerDivMarginTop=drawYCordScale-traCrossVerDivHeight/2;

		traCrossVerDiv.css("width",convertNumToPx(traCrossVerDivWidth));
		traCrossVerDiv.css("height",convertNumToPx(traCrossVerDivHeight));
		traCrossVerDiv.css("margin-left",convertNumToPx(crossVerDivMarginLeft));
		traCrossVerDiv.css("margin-top",convertNumToPx(crossVerDivMarginTop));

		transition.crossVerDivMarginLeft=crossVerDivMarginLeft;
		transition.crossVerDivMarginTop=crossVerDivMarginTop;
		
		
		var transitionSpanStr="<span class=\"ter_text_span\" id=\"ter_text_span"+elemID+"\">";
				transitionSpanStr+=conditionExp;
		  transitionSpanStr+="</span>";
		contentDiv.append(transitionSpanStr);

		var terTextSpanMarginLeft=drawXCordScale+traCrossHorDivWidth;//字体在横线右边显示
		var terTextSpanMarginTop=drawYCordScale+terTextSpanMarginTopSpace;//文字稍微往上一点
		
		var terTextSpan=$("#ter_text_span"+elemID);
		terTextSpan.css("margin-left",convertNumToPx(terTextSpanMarginLeft));
		terTextSpan.css("margin-top",convertNumToPx(terTextSpanMarginTop));
		
		transition.terTextSpanMarginLeft=terTextSpanMarginLeft;
		transition.terTextSpanMarginTop=terTextSpanMarginTop;
		
		
		var tTextSpanStr="<span class=\"t_text_span\" id=\"t_text_span"+elemID+"\">";
				tTextSpanStr+="T"+(i+1);
		   tTextSpanStr+="</span>";
		contentDiv.append(tTextSpanStr);

		var tTextSpanMarginLeft=initStepDivMarginLeft+initStepDivWidth/2-traCrossHorDivWidth/2+tTextSpanMarginLeftSpace;//初始步序左边距离+初始步序框宽度的一半-横线宽度的一半+左边距离的空隙
		var tTextSpanMarginTop=terTextSpanMarginTop+tTextSpanMarginTopSpace;
		
		var tTextSpan=$("#t_text_span"+elemID);
		tTextSpan.css("margin-left",convertNumToPx(tTextSpanMarginLeft));
		tTextSpan.css("margin-top",convertNumToPx(tTextSpanMarginTop));
		
		transition.tTextSpanMarginLeft=tTextSpanMarginLeft;
		transition.tTextSpanMarginTop=tTextSpanMarginTop;
	}
}

//绘制终点步序图
function drawTerminalStep(){
	terminalStep=drawSFCMap[terminalStepText];
	
	var drawXCordScale=terminalStep.drawXCord*changeScale;
	var drawYCordScale=terminalStep.drawYCord*changeScale;
	
	terminalStep.drawXCordScale=drawXCordScale;
	terminalStep.drawYCordScale=drawYCordScale;
	
	var contentDiv=$("#up_div #content_div");
	var marginLeftSpace=0;
	var marginTopSpace=0;
	for (var i = 1; i <= 5; i++) {
		var terStepStr="<div class=\"ter_step_div\" id=\"ter_step_div"+i+"\">";
			terStepStr+="</div>";
		contentDiv.append(terStepStr);
		
		var terStepDiv=$("#ter_step_div"+i);
		
		terStepDiv.css("width",convertNumToPx(terStepDivWidth-marginLeftSpace*2));
		terStepDiv.css("height",convertNumToPx(terStepDivHeight));
		
		terStepDiv.css("margin-left",drawXCordScale+marginLeftSpace);
		terStepDiv.css("margin-top",drawYCordScale+marginTopSpace);
		
		marginLeftSpace+=4;
		marginTopSpace+=5;
	}
}

//绘制连接线
function drawLink(){
	var linkList=drawSFCMap[linkText];
	for(var i=0;i<linkList.length;i++){
		var link=linkList[i];
		var elemID=link.elemID;
		var prevElemID=link.prevElemID;
		var nextElemID=link.nextElemID;
		//console.log("elemID="+elemID+",prevElemID="+prevElemID+",nextElemID="+nextElemID);
		var prevElem=getElemByID(prevElemID);
		var nextElem=getElemByID(nextElemID);
		var prevElemType=prevElem.elemType;
		var nextElemType=nextElem.elemType;
		//console.log("prevElemType="+prevElemType+",nextElemType="+nextElemType);

		var contentDiv=$("#up_div #content_div");

		if(prevElemType==initialStepInt&&nextElemType==transitionInt){//上一个元素是初始化步序、下一个元素是状态变更的情况
			var linkDivStr="<div class=\"link_div\" id=\"link_div"+elemID+"\">";
			contentDiv.append(linkDivStr);
			
			var linkDiv=$("#link_div"+elemID);
			
			var transition=getTraFromListByID(nextElemID);
			console.log(transition);
			var linkDivMarginLeft=initStepDivMarginLeft+initStepDivWidth/2;
			var linkDivMarginTop=initStepDivMarginTop+initStepDivHeight;
			var linkDivHeight=transition.crossVerDivMarginTop-linkDivMarginTop;//下一个元素的十字架竖线距离上方的像素-连接线距离上方的像素
			
			link.height=linkDivHeight;
			link.marginLeft=linkDivMarginLeft;
			link.marginTop=linkDivMarginTop;

			linkDiv.css("width",convertNumToPx(linkDivWidth));
			linkDiv.css("height",convertNumToPx(linkDivHeight));
			linkDiv.css("margin-left",convertNumToPx(linkDivMarginLeft));
			linkDiv.css("margin-top",convertNumToPx(linkDivMarginTop));
		}
		else if(prevElemType==transitionInt&&nextElemType==regularStepInt){//上一个元素是状态变更、下一个元素是常规步序
			var linkDivStr="<div class=\"link_div\" id=\"link_div"+elemID+"\">";
			contentDiv.append(linkDivStr);
			
			var linkDiv=$("#link_div"+elemID);
				
			var transition=getTraFromListByID(prevElemID);
			var regularStep=getRegFromListByID(nextElemID);
			console.log(transition);
			console.log(regularStep);
			
			var linkDivMarginLeft=transition.crossVerDivMarginLeft;
			var linkDivMarginTop=transition.crossVerDivMarginTop+traCrossVerDivHeight;//状态变更的十字架竖线距离上方的像素+十字架竖线的高度
			var linkDivHeight=regularStep.drawYCordScale-linkDivMarginTop;
			
			linkDiv.css("width",convertNumToPx(linkDivWidth));
			linkDiv.css("height",convertNumToPx(linkDivHeight));
			linkDiv.css("margin-left",convertNumToPx(linkDivMarginLeft));
			linkDiv.css("margin-top",convertNumToPx(linkDivMarginTop));
		}
		else if(prevElemType==regularStepInt&&nextElemType==transitionInt){//上一个元素是常规步序、下一个元素是状态变更
			var linkDivStr="<div class=\"link_div\" id=\"link_div"+elemID+"\">";
			contentDiv.append(linkDivStr);
			
			var linkDiv=$("#link_div"+elemID);

			var regularStep=getRegFromListByID(prevElemID);
			var transition=getTraFromListByID(nextElemID);

			var linkDivMarginLeft=transition.crossHorDivMarginLeft+traCrossHorDivWidth/2;//状态变更横线距离左边的像素+横线一半的长度
			var linkDivMarginTop=regularStep.drawYCordScale+stepDivHeight;//常规步序距离上方的像素+步序框的高度
			var linkDivHeight=transition.crossVerDivMarginTop-linkDivMarginTop;
			
			linkDiv.css("width",convertNumToPx(linkDivWidth));
			linkDiv.css("height",convertNumToPx(linkDivHeight));
			linkDiv.css("margin-left",convertNumToPx(linkDivMarginLeft));
			linkDiv.css("margin-top",convertNumToPx(linkDivMarginTop));
		}
		else if(prevElemType==transitionInt&&nextElemType==terminalStepInt){//上一个元素是状态变更、下一个元素是终点步序
			var linkDivStr="<div class=\"link_div\" id=\"link_div"+elemID+"\">";
			contentDiv.append(linkDivStr);
			
			var linkDiv=$("#link_div"+elemID);
			
			var transition=getTraFromListByID(prevElemID);
			
			var linkDivMarginLeft=terminalStep.drawXCordScale+terStepDivWidth/2;
			var linkDivMarginTop=transition.crossVerDivMarginTop+traCrossVerDivHeight;
			var linkDivHeight=terminalStep.drawYCordScale-linkDivMarginTop;
			
			linkDiv.css("width",convertNumToPx(linkDivWidth));
			linkDiv.css("height",convertNumToPx(linkDivHeight));
			linkDiv.css("margin-left",convertNumToPx(linkDivMarginLeft));
			linkDiv.css("margin-top",convertNumToPx(linkDivMarginTop));
		}
	}
}

//绘制发散线
function drawAndDivergence(){
	var andDivergenceList=drawSFCMap[andDivergenceText];
	if(andDivergenceList!=undefined){
		for(var i=0;i<andDivergenceList.length;i++){
			var andDivergence=andDivergenceList[i];
			var elemType=andDivergence.elemType;
			var elemID=andDivergence.elemID;
			
			var prevElemIDListStr=andDivergence.prevElemIDList;
			var prevElemIDListArr=prevElemIDListStr.split(tSign);
			var prevElemIDListArrLength=prevElemIDListArr.length;
			
			var nextElemIDListStr=andDivergence.nextElemIDList;
			var nextElemIDListArr=nextElemIDListStr.split(tSign);
			var nextElemIDListArrLength=nextElemIDListArr.length;
			//console.log("elemType="+elemType+",elemID="+elemID+",prevElemIDListStr="+prevElemIDListStr+",nextElemIDListStr="+nextElemIDListStr);
			
			var andDivergenceHorDiv1;
			var andDivergenceHorDiv2;
			var andDivergenceVerDiv;
			var prevElemCrossVerDivMarginTop;
			if(prevElemIDListArrLength==1){//在上一个节点元素是1个的情况下
				var contentDiv=$("#up_div #content_div");
				var andDivergenceVerDivStr="<div class=\"and_divergence_ver_div\" id=\"and_divergence_ver_div"+elemID+"\">";
				contentDiv.append(andDivergenceVerDivStr);
				
				andDivergenceVerDiv=$("#and_divergence_ver_div"+elemID);
				
				var prevElem=getTraFromListByID(prevElemIDListStr);
				//console.log(prevElem);
				prevElemCrossVerDivMarginTop=prevElem.crossVerDivMarginTop;
				var andDivergenceMarginTop=prevElemCrossVerDivMarginTop+traCrossVerDivHeight;
				var andDivergenceMarginLeft=prevElem.crossHorDivMarginLeft+traCrossHorDivWidth/2;
				
				andDivergenceVerDiv.css("width",convertNumToPx(linkDivWidth));
				andDivergenceVerDiv.css("margin-top",convertNumToPx(andDivergenceMarginTop));
				andDivergenceVerDiv.css("margin-left",convertNumToPx(andDivergenceMarginLeft));
				
				andDivergence.marginTop=andDivergenceMarginTop;
				andDivergence.marginLeft=andDivergenceMarginLeft;
	
				var andDivergenceHorDiv1Str="<div class=\"and_divergence_hor_div\" id=\"and_divergence_hor_div1"+elemID+"\">";
				contentDiv.append(andDivergenceHorDiv1Str);
				
				andDivergenceHorDiv1=$("#and_divergence_hor_div1"+elemID);
				andDivergenceHorDiv1.css("height",convertNumToPx(traCrossHorDivHeight));
	
				var andDivergenceHorDiv2Str="<div class=\"and_divergence_hor_div\" id=\"and_divergence_hor_div2"+elemID+"\">";
				contentDiv.append(andDivergenceHorDiv2Str);
				
				andDivergenceHorDiv2=$("#and_divergence_hor_div2"+elemID);
				andDivergenceHorDiv2.css("height",convertNumToPx(traCrossHorDivHeight));
			}
			
			
			var andDivergenceHorDivWidthStartX;
			var andDivergenceHorDivWidthEndX;
			var andDivergenceHorDivMarginLeft;
			var andDivergenceHorDivMarginTop;
			for (var j = 0; j < nextElemIDListArrLength; j++) {
				var nextElemID=nextElemIDListArr[j];
				//console.log(nextElemID);
				var nextReg=getRegFromListByID(nextElemID);
				//console.log(nextReg);
				
				var nextLinkDivMarginTop=nextReg.drawYCordScale-traCrossVerDivHeight/2;
				var nextLinkDivMarginLeft=nextReg.drawXCordScale+stepDivWidth/2;
	
				var contentDiv=$("#up_div #content_div");
				var nextLinkDivStr="<div class=\"next_link_div\" id=\"next_link_div"+nextElemID+"\">";
				contentDiv.append(nextLinkDivStr);
				
				var nextLinkDiv=$("#next_link_div"+nextElemID);
				
				nextLinkDiv.css("width",convertNumToPx(linkDivWidth));
				nextLinkDiv.css("height",convertNumToPx(traCrossVerDivHeight/2));
				nextLinkDiv.css("margin-top",convertNumToPx(nextLinkDivMarginTop));
				nextLinkDiv.css("margin-left",convertNumToPx(nextLinkDivMarginLeft));
	
				if(j==0){
					andDivergenceHorDivWidthStartX=nextLinkDivMarginLeft;
					andDivergenceHorDivMarginLeft=nextLinkDivMarginLeft;;
					andDivergenceHorDivMarginTop=nextLinkDivMarginTop;
	
				}
				else if(j==nextElemIDListArrLength-1){
					andDivergenceHorDivWidthEndX=nextLinkDivMarginLeft;
				}
			}
			
			if(prevElemIDListArrLength==1){
				andDivergenceHorDiv1.css("width",convertNumToPx(andDivergenceHorDivWidthEndX-andDivergenceHorDivWidthStartX+andDivHorDivEndSpace*2));
				andDivergenceHorDiv1.css("margin-left",convertNumToPx(andDivergenceHorDivMarginLeft+andDivHorDivStartSpace));
				andDivergenceHorDiv1.css("margin-top",convertNumToPx(andDivergenceHorDivMarginTop));
				
				andDivergenceHorDiv2.css("width",convertNumToPx(andDivergenceHorDivWidthEndX-andDivergenceHorDivWidthStartX+andDivHorDivEndSpace*2));
				andDivergenceHorDiv2.css("margin-left",convertNumToPx(andDivergenceHorDivMarginLeft+andDivHorDivStartSpace));
				andDivergenceHorDiv2.css("margin-top",convertNumToPx(andDivergenceHorDivMarginTop+andDivHorDivUpSpace));
				
				andDivergenceVerDiv.css("height",convertNumToPx(andDivergenceHorDivMarginTop-prevElemCrossVerDivMarginTop-traCrossVerDivHeight+andDivHorDivUpSpace));
			}
		}
	}
}

function drawAndConvergence(){
	var andConvergenceList=drawSFCMap[andConvergenceText];
	if(andConvergenceList!=undefined){
		for(var i=0;i<andConvergenceList.length;i++){
			var andConvergence=andConvergenceList[i];
			var elemType=andConvergence.elemType;
			var elemID=andConvergence.elemID;
			
			var nextElemIDListStr=andConvergence.nextElemIDList;
			var nextElemIDListArr=nextElemIDListStr.split(tSign);
			var nextElemIDListArrLength=nextElemIDListArr.length;
			
			var prevElemIDListStr=andConvergence.prevElemIDList;
			var prevElemIDListArr=prevElemIDListStr.split(tSign);
			var prevElemIDListArrLength=prevElemIDListArr.length;
			console.log("elemType="+elemType+",elemID="+elemID+",nextElemIDListStr="+nextElemIDListStr+",prevElemIDListStr="+prevElemIDListStr);
	
			var andConvergenceDiv;
			var andConvergenceHorDiv;
			var nextElemCrossVerDivMarginTop;
			var nextElem;
			if(nextElemIDListArrLength==1){
				var contentDiv=$("#up_div #content_div");
				var andConvergenceDivStr="<div class=\"and_convergence_div\" id=\"and_convergence_div"+elemID+"\">";
				contentDiv.append(andConvergenceDivStr);
				
				andConvergenceDiv=$("#and_convergence_div"+elemID);
				
				nextElem=getTraFromListByID(nextElemIDListStr);
				console.log(nextElem);
				var andConvergenceMarginLeft=nextElem.crossHorDivMarginLeft+traCrossHorDivWidth/2;
				
				andConvergenceDiv.css("width",convertNumToPx(linkDivWidth));
				andConvergenceDiv.css("margin-left",convertNumToPx(andConvergenceMarginLeft));
				
				andConvergence.marginLeft=andConvergenceMarginLeft;
			}
			
			var andConvergenceHorDivWidthStartX;
			var andConvergenceHorDivWidthEndX;
			var andConvergenceHorDivMarginLeft;
			var andConvergenceHorDivMarginTop;
	
			var andConvergenceHorDiv1Str="<div class=\"and_convergence_hor_div\" id=\"and_convergence_hor_div1"+elemID+"\">";
			contentDiv.append(andConvergenceHorDiv1Str);
			
			andConvergenceHorDiv1=$("#and_convergence_hor_div1"+elemID);
			andConvergenceHorDiv1.css("height",convertNumToPx(traCrossHorDivHeight));
	
			var andConvergenceHorDiv2Str="<div class=\"and_convergence_hor_div\" id=\"and_convergence_hor_div2"+elemID+"\">";
			contentDiv.append(andConvergenceHorDiv2Str);
			
			andConvergenceHorDiv2=$("#and_convergence_hor_div2"+elemID);
			andConvergenceHorDiv2.css("height",convertNumToPx(traCrossHorDivHeight));
			
			for (var j = 0; j < prevElemIDListArrLength; j++) {
				var prevElemID=prevElemIDListArr[j];
				console.log(prevElemID);
				var prevReg=getRegFromListByID(prevElemID);
				console.log(prevReg);
				
				var prevLinkDivMarginTop=prevReg.drawYCordScale+stepDivHeight;
				var prevLinkDivMarginLeft=prevReg.drawXCordScale+stepDivWidth/2;
	
				var contentDiv=$("#up_div #content_div");
				var prevLinkDivStr="<div class=\"prev_link_div\" id=\"prev_link_div"+prevElemID+"\">";
				contentDiv.append(prevLinkDivStr);
				
				var prevLinkDiv=$("#prev_link_div"+prevElemID);
				
				prevLinkDiv.css("width",convertNumToPx(linkDivWidth));
				prevLinkDiv.css("height",convertNumToPx(traCrossVerDivHeight/2));
				prevLinkDiv.css("margin-top",convertNumToPx(prevLinkDivMarginTop));
				prevLinkDiv.css("margin-left",convertNumToPx(prevLinkDivMarginLeft));
	
				if(j==0){
					andConvergenceHorDivWidthStartX=prevLinkDivMarginLeft;
					andConvergenceHorDivMarginLeft=prevLinkDivMarginLeft;
					andConvergenceHorDivMarginTop=prevLinkDivMarginTop+traCrossVerDivHeight/2;
	
				}
				else if(j==prevElemIDListArrLength-1){
					andConvergenceHorDivWidthEndX=prevLinkDivMarginLeft;
				}
			}
			
			if(nextElemIDListArrLength==1){
				var andConvergenceHorDiv2MarginTop=andConvergenceHorDivMarginTop-andConvHorDivUpSpace;
				andConvergenceHorDiv1.css("width",convertNumToPx(andConvergenceHorDivWidthEndX-andConvergenceHorDivWidthStartX+andConvHorDivEndSpace*2));
				andConvergenceHorDiv1.css("margin-left",convertNumToPx(andConvergenceHorDivMarginLeft+andDivHorDivStartSpace));
				andConvergenceHorDiv1.css("margin-top",convertNumToPx(andConvergenceHorDivMarginTop));
				
				andConvergenceHorDiv2.css("width",convertNumToPx(andConvergenceHorDivWidthEndX-andConvergenceHorDivWidthStartX+andConvHorDivEndSpace*2));
				andConvergenceHorDiv2.css("margin-left",convertNumToPx(andConvergenceHorDivMarginLeft+andConvHorDivStartSpace));
				andConvergenceHorDiv2.css("margin-top",convertNumToPx(andConvergenceHorDiv2MarginTop));
				
				andConvergenceDiv.css("margin-top",convertNumToPx(andConvergenceHorDiv2MarginTop));
				andConvergenceDiv.css("height",convertNumToPx(nextElem.crossVerDivMarginTop-andConvergenceHorDiv2MarginTop));
			}
		}
	}
}

function getTraFromListByID(elemID){
	var got=false;
	var procedureData=null;
	for(var i=0;i<transitionList.length;i++){
		var transition=transitionList[i];
		if(transition.elemID==elemID){
			procedureData=transition;
			got=true;
			break;
		}
	}
	if(!got)
		procedureData={};
	return procedureData;
}

function getRegFromListByID(elemID){
	var got=false;
	var procedureData=null;
	for(var i=0;i<regularStepList.length;i++){
		var regularStep=regularStepList[i];
		if(regularStep.elemID==elemID){
			procedureData=regularStep;
			got=true;
			break;
		}
	}
	if(!got)
		procedureData={};
	return procedureData;
}

function getElemByID(elemID){
	var got=false;
	var procedureData=null;
	if(initialStep.elemID==elemID){
		procedureData=initialStep;
		console.log(procedureData);
		got=true;
	}
	if(!got){
		for(var i=0;i<transitionList.length;i++){
			var transition=transitionList[i];
			if(transition.elemID==elemID){
				procedureData=transition;
				//console.log(procedureData);
				got=true;
				break;
			}
		}
		if(!got){
			for(var i=0;i<regularStepList.length;i++){
				var regularStep=regularStepList[i];
				if(regularStep.elemID==elemID){
					procedureData=regularStep;
					console.log(procedureData);
					got=true;
					break;
				}
			}
		}
		if(!got){
			if(terminalStep.elemID==elemID){
				procedureData=terminalStep;
				console.log(procedureData);
				got=true;
			}
		}
	}
	
	if(!got)
		procedureData={};
	return procedureData;
}

function convertPxToNum(px,scale){
	return Number(px.substring(0,px.length-2)*scale);
}

function convertNumToPx(num){
	return num+"px";
}
</script>
<title>Insert title here</title>
<style type="text/css">
.up_div{
	width: 100%;
	margin: 100px auto;
	padding: 1px;
}
.up_div .tit_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	text-align: center;
}
.up_div .content_div{
	width: 100%;
	height: 1500px;
	border: 1px solid #000;
}
.up_div .init_out_div{
	width: 100px;
	height: 50px;
	border: 2px solid #000;
	position: absolute;
}
.up_div .init_in_div{
	width: 90px;
	height: 43px;
	margin-top:2px;
	margin-left:2px;
	border: 2px solid #000;
	position: absolute;
}
.up_div .reg_step_div{
	text-align:center;
	border: 2px solid #000;
	position: absolute;
}
.up_div .ter_step_div{
	height: 2px;
	background-color: #999;
	position: absolute;
}
.up_div .t_text_span,
.up_div .ter_text_span{
	position: absolute;
}
.up_div .link_div,
.up_div .tra_cross_hor_div,
.up_div .and_convergence_div,
.up_div .and_divergence_hor_div,
.up_div .and_divergence_ver_div,
.up_div .and_convergence_hor_div,
.up_div .prev_link_div,
.up_div .next_link_div{
	background-color: #000;
	position: absolute;
}
.up_div .tra_cross_ver_div{
	background-color: #000;
	position: absolute;
}

.reg_step_div .unitName_div,
..reg_step_div .keyValue_div{
	display: none;;
}
</style>
</head>
<body>
<div class="up_div" id="up_div">
	<div class="tit_div">UP流程图</div>
	<div class="content_div" id="content_div">
	</div>
</div>
</body>
</html>