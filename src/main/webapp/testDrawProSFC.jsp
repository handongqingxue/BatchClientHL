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

var initialStepText='${requestScope.initialStepText}';
var regularStepText='${requestScope.regularStepText}';
var transitionText='${requestScope.transitionText}';
var terminalStepText='${requestScope.terminalStepText}';
var linkText='${requestScope.linkText}';

var drawSFCMap;
var defaultScale=1;
var changeScale=0.3;

var stepDivWidth=200;
var stepDivHeight=45;

var initStepDivWidth=100;
var initStepDivHeight=50;
var initStepDivMarginLeft;
var initStepDivMarginTop;

var traCrossHorDivWidth=40;
var traCrossHorDivHeight=2;

var linkDivWidth=2;

var initialStep;
var regularStepList;
var transitionList;
var terminalStep;

$(function(){
	getDrawProSFCData();
});

function getDrawProSFCData(){
	$.post(path+"batch/getDrawProSFCData",
		{recpID:"CLS_FRENCHVANILLA"},
		function(result){
			drawSFCMap=result.drawSFCMap;
			console.log(initialStepText)
			drawInitialStep();
			drawRegularStep();
			drawTransition();
			drawTerminalStep();
			drawLink();
		}
	,"json");
}

function drawInitialStep(){
	initialStep=drawSFCMap[initialStepText];
	var drawXCord=initialStep.drawXCord;
	var drawYCord=initialStep.drawYCord;
	initStepDivMarginLeft=drawXCord*changeScale;
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
				regularStepStr+="<div class=\"name_div\">";
					regularStepStr+=elemName;
				regularStepStr+="</div>";
				regularStepStr+="<div class=\"unitName_div\">";
					regularStepStr+="WP_FREEZER1";
				regularStepStr+="</div>";
		   regularStepStr+="</div>";
		contentDiv.append(regularStepStr);
	
		var regStepDiv=$("#reg_step_div"+elemID);
		
		var drawXCordScale=drawXCord*changeScale;
		var drawYCordScale=drawYCord*changeScale;
		
		regularStep.drawXCordScale=drawXCordScale;
		regularStep.drawYCordScale=drawYCordScale;
		
		regStepDiv.css("width",stepDivWidth+"px");
		regStepDiv.css("height",stepDivHeight+"px");
		regStepDiv.css("margin-left",drawXCordScale+"px");
		regStepDiv.css("margin-top",drawYCordScale+"px");
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
		traCrossHorDiv.css("width",traCrossHorDivWidth+"px");
		traCrossHorDiv.css("height",traCrossHorDivHeight+"px");
		traCrossHorDiv.css("margin-left",drawXCordScale+"px");
		traCrossHorDiv.css("margin-top",drawYCordScale+"px");
		
		transition.crossHorDivMarginLeft=drawXCordScale;
		transition.crossHorDivMarginTop=drawYCordScale;
		
		var traCrossVerDivStr="<div class=\"tra_cross_ver_div\" id=\"tra_cross_ver_div"+elemID+"\"></div>";
		contentDiv.append(traCrossVerDivStr);

		var traCrossVerDiv=$("#tra_cross_ver_div"+elemID);
		
		var crossVerDivMarginLeft=drawXCordScale+20;
		var crossVerDivMarginTop=drawYCordScale-20;
			
		traCrossVerDiv.css("margin-left",crossVerDivMarginLeft+"px");
		traCrossVerDiv.css("margin-top",crossVerDivMarginTop+"px");

		transition.crossVerDivMarginLeft=crossVerDivMarginLeft;
		transition.crossVerDivMarginTop=crossVerDivMarginTop;
		
		
		var transitionSpanStr="<span class=\"ter_text_span\" id=\"ter_text_span"+elemID+"\">";
				transitionSpanStr+=conditionExp;
		  transitionSpanStr+="</span>";
		contentDiv.append(transitionSpanStr);

		var terTextSpanMarginLeft=drawXCordScale+40;
		var terTextSpanMarginTop=drawYCordScale-10;
		
		var terTextSpan=$("#ter_text_span"+elemID);
		terTextSpan.css("margin-left",terTextSpanMarginLeft+"px");
		terTextSpan.css("margin-top",terTextSpanMarginTop+"px");
		
		transition.terTextSpanMarginLeft=terTextSpanMarginLeft;
		transition.terTextSpanMarginTop=terTextSpanMarginTop;
		
		
		var tTextSpanStr="<span class=\"t_text_span\" id=\"t_text_span"+elemID+"\">";
				tTextSpanStr+="T"+(i+1);
		   tTextSpanStr+="</span>";
		contentDiv.append(tTextSpanStr);

		var tTextSpanMarginLeft=initStepDivMarginLeft+initStepDivWidth/2-traCrossHorDivWidth/2-30;
		var tTextSpanMarginTop=terTextSpanMarginTop-15;
		
		var tTextSpan=$("#t_text_span"+elemID);
		tTextSpan.css("margin-left",tTextSpanMarginLeft+"px");
		tTextSpan.css("margin-top",tTextSpanMarginTop+"px");
		
		transition.tTextSpanMarginLeft=tTextSpanMarginLeft;
		transition.tTextSpanMarginTop=tTextSpanMarginTop;
	}
}

function drawTerminalStep(){
	terminalStep=drawSFCMap[terminalStepText];
	var contentDiv=$("#up_div #content_div");
	var terStepStr="<div class=\"ter_step_div\" id=\"ter_step_div\">";
		terStepStr+="</div>";
	contentDiv.append(terStepStr);
	
	var terStepDiv=$("#ter_step_div");
	
	var drawXCordScale=terminalStep.drawXCord*changeScale;
	var drawYCordScale=terminalStep.drawYCord*changeScale;
	
	terStepDiv.css("margin-left",drawXCordScale);
	terStepDiv.css("margin-top",drawYCordScale);
	
	terminalStep.drawXCordScale=drawXCordScale;
	terminalStep.drawYCordScale=drawYCordScale;
	
	terStepDiv.css("width",traCrossHorDivWidth+"px");
	terStepDiv.css("height",traCrossHorDivHeight+"px");
}

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

		if(prevElemType==initialStepInt&&nextElemType==transitionInt){
			var linkDivStr="<div class=\"link_div\" id=\"link_div"+elemID+"\">";
			contentDiv.append(linkDivStr);
			
			var linkDiv=$("#link_div"+elemID);
			
			var transition=getTraFromListByID(nextElemID);
			console.log(transition);
			var linkDivMarginLeft=initStepDivMarginLeft+initStepDivWidth/2;
			var linkDivMarginTop=initStepDivMarginTop+initStepDivHeight;
			var linkDivHeight=transition.crossVerDivMarginTop-linkDivMarginTop;
			
			link.height=linkDivHeight;
			link.marginLeft=linkDivMarginLeft;
			link.marginTop=linkDivMarginTop;

			linkDiv.css("width",linkDivWidth+"px");
			linkDiv.css("height",linkDivHeight+"px");
			linkDiv.css("margin-left",linkDivMarginLeft+"px");
			linkDiv.css("margin-top",linkDivMarginTop+"px");
		}
		else if(prevElemType==transitionInt&&nextElemType==regularStepInt){
			var linkDivStr="<div class=\"link_div\" id=\"link_div"+elemID+"\">";
			contentDiv.append(linkDivStr);
			
			var linkDiv=$("#link_div"+elemID);
				
			var transition=getTraFromListByID(prevElemID);
			var regularStep=getRegFromListByID(nextElemID);
			console.log(transition);
			console.log(regularStep);
			
			var linkDivMarginLeft=transition.crossVerDivMarginLeft;
			var linkDivMarginTop=transition.crossVerDivMarginTop+40;
			var linkDivHeight=regularStep.drawYCordScale-linkDivMarginTop;
			
			linkDiv.css("width",linkDivWidth+"px");
			linkDiv.css("height",linkDivHeight+"px");
			linkDiv.css("margin-left",linkDivMarginLeft+"px");
			linkDiv.css("margin-top",linkDivMarginTop+"px");
		}
		else if(prevElemType==regularStepInt&&nextElemType==transitionInt){
			var linkDivStr="<div class=\"link_div\" id=\"link_div"+elemID+"\">";
			contentDiv.append(linkDivStr);
			
			var linkDiv=$("#link_div"+elemID);

			var regularStep=getRegFromListByID(prevElemID);
			var transition=getTraFromListByID(nextElemID);

			var linkDivMarginLeft=transition.crossHorDivMarginLeft+traCrossHorDivWidth/2;
			var linkDivMarginTop=regularStep.drawYCordScale+stepDivHeight;
			var linkDivHeight=transition.crossVerDivMarginTop-regularStep.drawYCordScale-stepDivHeight;
			
			linkDiv.css("width",linkDivWidth+"px");
			linkDiv.css("height",linkDivHeight+"px");
			linkDiv.css("margin-left",linkDivMarginLeft+"px");
			linkDiv.css("margin-top",linkDivMarginTop+"px");
		}
		else if(prevElemType==transitionInt&&nextElemType==terminalStepInt){
			var linkDivStr="<div class=\"link_div\" id=\"link_div"+elemID+"\">";
			contentDiv.append(linkDivStr);
			
			var linkDiv=$("#link_div"+elemID);
			
			var transition=getTraFromListByID(prevElemID);
			
			var linkDivMarginLeft=terminalStep.drawXCordScale+traCrossHorDivWidth/2;
			alert(traCrossHorDivWidth)
			var linkDivMarginTop=transition.crossVerDivMarginTop+40;
			var linkDivHeight=terminalStep.drawYCordScale-linkDivMarginTop;
			
			linkDiv.css("width",linkDivWidth+"px");
			linkDiv.css("height",linkDivHeight+"px");
			linkDiv.css("margin-left",linkDivMarginLeft+"px");
			linkDiv.css("margin-top",linkDivMarginTop+"px");
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
	width: 30px;
	height: 2px;
	background-color: #000;
	position: absolute;
}
.up_div .t_text_span,
.up_div .ter_text_span{
	position: absolute;
}
.up_div .link_div,
.up_div .tra_cross_hor_div{
	background-color: #000;
	position: absolute;
}
.up_div .tra_cross_ver_div{
	width: 2px;
	height:40px;
	background-color: #000;
	position: absolute;
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