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
var initialStepText='${requestScope.initialStepText}';
var regularStepText='${requestScope.regularStepText}';
var transitionText='${requestScope.transitionText}';
var terminalStepText='${requestScope.terminalStepText}';

var drawSFCMap;
var defaultScale=1;
var changeScale=0.3;

var stepDivWidth=200;
var stepDivHeight=45;
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
		}
	,"json");
}

function drawInitialStep(){
	var initialStep=drawSFCMap[initialStepText];
	var contentDiv=$("#up_div #content_div");
	var initialStepStr="<div class=\"init_out_div\" id=\"init_step_div\">";
			initialStepStr+="<div class=\"init_in_div\"></div>";
	   initialStepStr+="</div>";
		initialStepStr+="";
	contentDiv.append(initialStepStr);
	
	var initStepDiv=$("#init_step_div");
	initStepDiv.css("margin-left",initialStep.drawXCord*changeScale);
	initStepDiv.css("margin-top",initialStep.drawYCord*changeScale);
}

function drawRegularStep(){
	var regularStepList=drawSFCMap[regularStepText];
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
		regStepDiv.css("width",stepDivWidth+"px");
		regStepDiv.css("height",stepDivHeight+"px");
		regStepDiv.css("margin-left",drawXCord*changeScale+"px");
		regStepDiv.css("margin-top",drawYCord*changeScale+"px");
	}
	
}

function drawTransition(){
	var transitionList=drawSFCMap[transitionText];
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
		traCrossHorDiv.css("margin-left",drawXCordScale+"px");
		traCrossHorDiv.css("margin-top",drawYCordScale+"px");
		
		var traCrossVerDivStr="<div class=\"tra_cross_ver_div\" id=\"tra_cross_ver_div"+elemID+"\"></div>";
		contentDiv.append(traCrossVerDivStr);

		var traCrossVerDiv=$("#tra_cross_ver_div"+elemID);
		traCrossVerDiv.css("margin-left",drawXCordScale+20+"px");
		traCrossVerDiv.css("margin-top",drawYCordScale-20+"px");
		
		var transitionStr="<span class=\"ter_text_span\" id=\"ter_text_span"+elemID+"\">";
				transitionStr+=conditionExp;
			transitionStr+="</span>";
		contentDiv.append(transitionStr);

		var terTextSpan=$("#ter_text_span"+elemID);
		terTextSpan.css("margin-left",drawXCordScale+40+"px");
		terTextSpan.css("margin-top",drawYCordScale-10+"px");
	}
}

function drawTerminalStep(){
	var terminalStep=drawSFCMap[terminalStepText];
	var contentDiv=$("#up_div #content_div");
	var terStepStr="<div class=\"ter_step_div\" id=\"ter_step_div\">";
		terStepStr+="</div>";
	contentDiv.append(terStepStr);
	
	var terStepDiv=$("#ter_step_div");
	terStepDiv.css("margin-left",terminalStep.drawXCord*changeScale);
	terStepDiv.css("margin-top",terminalStep.drawYCord*changeScale);
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
.up_div .ter_text_span{
	position: absolute;
}
.up_div .tra_cross_hor_div{
	width:40px;
	height: 2px;
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