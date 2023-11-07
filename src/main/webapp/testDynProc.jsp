<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath=request.getScheme()+"://"+request.getServerName()+":"
		+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=basePath %>js/jquery-3.3.1.js"></script>
<script type="text/javascript">
var path='<%=basePath %>';
var defaultScale=1;
var changeScale=0.3;
var horDivWidth=40;

var rootOutDivMarginLeft;
var rootOutDivMarginTop;
var rootOutDivWidth;
var rootOutDivHeight;

var rootToT1HorDivMarginLeft;
var rootToT1HorDivMarginTop;

var t1StateTextSpanWidth;
var t1StateTextSpanMarginLeft;
var t1StateTextSpanMarginTop;

var rootToT1VerDivWidth;
var rootToT1VerDivMarginLeft;
var rootToT1VerDivMarginTop;
var rootToT1VerDivHeight;

var t1TextSpanMarginLeft;

var t1ToSweetVerDiv;

var sweetDivMarginLeft;
var sweetDivMarginTop;
var sweetDivWidth;
var sweetDivHeight;

$(function(){
	initUpDivLoc();
});

//初始化顺序:UP框、状态左边的横线、状态、状态左边的竖线1、状态左边的T、状态左边的竖线2
function initUpDivLoc(){
	var rootOutDiv=$("#up_div #root_out_div");
	rootOutDiv.css("width",convertPxToNum("100px",defaultScale));
	rootOutDiv.css("height",convertPxToNum("50px",defaultScale));
	rootOutDiv.css("margin-left",convertPxToNum("700px",changeScale));
	rootOutDiv.css("margin-top",convertPxToNum("100px",changeScale));
	
	rootOutDivMarginLeft=convertPxToNum(rootOutDiv.css("margin-left"),defaultScale);
	rootOutDivMarginTop=convertPxToNum(rootOutDiv.css("margin-top"),defaultScale);
	rootOutDivWidth=convertPxToNum(rootOutDiv.css("width"),defaultScale);
	rootOutDivHeight=convertPxToNum(rootOutDiv.css("height"),defaultScale);
	
	initT1StateLeftHorDiv();//T1状态左边的横线
	
	initT1StateTextSpan();
	
	initT1StateLeftVerDiv();
	
	initT1StateLeftSpan();
	
	initT1ToSweetVerDiv();
	
	initSweetDiv();

	editT1StateLeftVerDiv();
	
	
	
	
	
	
	
	//T2状态左边的横线-start
	var sweetToT2HorDiv=$("#up_div #sweet_to_t2_hor_div");
	var sweetToT2HorDivWidth=horDivWidth;
	sweetToT2HorDiv.css("width",sweetToT2HorDivWidth+"px");
	sweetToT2HorDiv.css("margin-left",convertPxToNum("800px",changeScale)+"px");
	sweetToT2HorDiv.css("margin-top",convertPxToNum("980px",changeScale)+"px");
	
	var sweetToT2HorDivWidth=convertPxToNum(sweetToT2HorDiv.css("width"),1);
	var sweetToT2HorDivMarginLeft=convertPxToNum(sweetToT2HorDiv.css("margin-left"),1);
	var sweetToT2HorDivMarginTop=convertPxToNum(sweetToT2HorDiv.css("margin-top"),1);
	//T2状态左边的横线-end
	
	//T2状态-start
	var t2StateTextSpan=$("#up_div #t2_state_text_span");
	t2StateTextSpan.css("margin-left",rootToT1HorDivMarginLeft+horDivWidth+"px");
	t2StateTextSpan.css("margin-top",sweetToT2HorDivMarginTop-10+"px");
	
	var t2StateTextSpanWidth=convertPxToNum(t2StateTextSpan.css("width"),defaultScale);
	var t2StateTextSpanMarginLeft=convertPxToNum(t2StateTextSpan.css("margin-left"),defaultScale);
	var t2StateTextSpanMarginTop=convertPxToNum(t2StateTextSpan.css("margin-top"),defaultScale);
	//T2状态-end
	
	//T2状态左边的竖线-start
	var sweetToT2VerDiv=$("#up_div #sweet_to_t2_ver_div");
	var sweetToT2VerDivWidth=convertPxToNum(sweetToT2VerDiv.css("width"),1);
	var sweetToT2VerDivMarginLeft=rootToT1VerDivMarginLeft;
	var sweetToT2VerDivMarginTop=changeByScale(sweetDivMarginTop+sweetDivHeight+4,defaultScale);
	var sweetToT2VerDivHeight=sweetToT2HorDivMarginTop-sweetDivMarginTop-sweetDivHeight;
	
	sweetToT2VerDiv.css("margin-left",sweetToT2VerDivMarginLeft+"px");
	sweetToT2VerDiv.css("margin-top",sweetToT2VerDivMarginTop+"px");
	sweetToT2VerDiv.css("height",sweetToT2VerDivHeight-4+"px");
	//T2状态左边的竖线-end
	
	//T2状态左边的T2-start
	var t2TextSpan=$("#up_div #t2_text_span");
	t2TextSpan.css("margin-left",t1TextSpanMarginLeft+"px");
	t2TextSpan.css("margin-top",t2StateTextSpanMarginTop-15+"px");
	//T2状态左边的T2-end
	
	
	//alert(sweetDivMarginLeft+sweetDivWidth/2-sweetToT2HorDivWidth/2-30+"px")
}

//T1状态左边的横线
function initT1StateLeftHorDiv(){
	var rootToT1HorDiv=$("#up_div #root_to_t1_hor_div");
	rootToT1HorDiv.css("width",horDivWidth+"px");
	rootToT1HorDiv.css("margin-left",convertPxToNum("800px",changeScale)+"px");
	rootToT1HorDiv.css("margin-top",convertPxToNum("400px",changeScale)+"px");
	
	rootToT1HorDivMarginLeft=convertPxToNum(rootToT1HorDiv.css("margin-left"),defaultScale);
	rootToT1HorDivMarginTop=convertPxToNum(rootToT1HorDiv.css("margin-top"),defaultScale);
}

//T1State
function initT1StateTextSpan(){
	var t1StateTextSpan=$("#up_div #t1_true_text_span");
	t1StateTextSpan.css("margin-left",rootToT1HorDivMarginLeft+horDivWidth+"px");
	t1StateTextSpan.css("margin-top",rootToT1HorDivMarginTop-10+"px");
	
	t1StateTextSpanWidth=convertPxToNum(t1StateTextSpan.css("width"),defaultScale);
	t1StateTextSpanMarginLeft=convertPxToNum(t1StateTextSpan.css("margin-left"),defaultScale);
	t1StateTextSpanMarginTop=convertPxToNum(t1StateTextSpan.css("margin-top"),defaultScale);
}

//T1State左边的竖线1
function initT1StateLeftVerDiv(){
	var rootToT1VerDiv=$("#up_div #root_to_t1_ver_div");
	
	rootToT1VerDivWidth=convertPxToNum(rootToT1VerDiv.css("width"),1);
	rootToT1VerDivMarginLeft=changeByScale(t1StateTextSpanMarginLeft-t1StateTextSpanWidth/2,defaultScale);
	rootToT1VerDivMarginTop=changeByScale(rootOutDivMarginTop+rootOutDivHeight+4,defaultScale);
	rootToT1VerDivHeight=rootToT1HorDivMarginTop-rootOutDivMarginTop-rootOutDivHeight;
	
	rootToT1VerDiv.css("margin-left",rootToT1VerDivMarginLeft+"px");
	rootToT1VerDiv.css("margin-top",rootToT1VerDivMarginTop+"px");
	rootToT1VerDiv.css("height",rootToT1VerDivHeight-4+"px");
}

//T1State左边的Span
function initT1StateLeftSpan(){
	var t1TextSpan=$("#up_div #t1_text_span");
	t1TextSpan.css("margin-left",rootOutDivMarginLeft+rootOutDivWidth/2-horDivWidth/2-30+"px");
	t1TextSpan.css("margin-top",t1StateTextSpanMarginTop-15+"px");
	
	t1TextSpanMarginLeft=convertPxToNum(t1TextSpan.css("margin-left"),1);
}

//T1State左边的竖线2
function initT1ToSweetVerDiv(){
	t1ToSweetVerDiv=$("#up_div #t1_to_sweet_ver_div");
	t1ToSweetVerDiv.css("margin-left",rootToT1VerDivMarginLeft+"px");
}

//SweetDiv
function initSweetDiv(){
	var sweetDiv=$("#up_div #sweet_div");
	sweetDiv.css("margin-left",convertPxToNum("600px",changeScale)+"px");
	sweetDiv.css("margin-top",convertPxToNum("700px",changeScale)+"px");

	sweetDivMarginLeft=convertPxToNum(sweetDiv.css("margin-left"),1);
	sweetDivMarginTop=convertPxToNum(sweetDiv.css("margin-top"),1);
	sweetDivWidth=convertPxToNum(sweetDiv.css("width"),1);
	sweetDivHeight=convertPxToNum(sweetDiv.css("height"),1);
}

//设置从T1到sweet框垂直线的高和距离上方的像素
function editT1StateLeftVerDiv(){
	t1ToSweetVerDiv.css("height",sweetDivMarginTop-rootToT1HorDivMarginTop+"px");//用sweet框距离上方的像素-从root框到T1框的水平线距离上方的像素
	t1ToSweetVerDiv.css("margin-top",rootToT1HorDivMarginTop+"px");
}

function convertPxToNum(px,scale){
	return Number(px.substring(0,px.length-2)*scale);
}

function changeByScale(num,scale){
	return num*scale;
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
.up_div .root_out_div{
	border: 2px solid #000;
	position: absolute;
}
.up_div .root_in_div{
	width: 90px;
	height: 43px;
	margin-top:2px;
	margin-left:2px;
	border: 2px solid #000;
	position: absolute;
}
.up_div .t1_text_span,
.up_div .t2_text_span{
	position: absolute;
}
.up_div .t1_true_text_span,
.up_div .t2_state_text_span{
	position: absolute;
}
.up_div .root_to_t1_ver_div{
	width: 2px;
	background-color: #000;
	position: absolute;
}
.up_div .root_to_t1_hor_div,
.up_div .sweet_to_t2_hor_div{
	height: 2px;
	background-color: #000;
	position: absolute;
}
.up_div .t1_to_sweet_ver_div,
.up_div .sweet_to_t2_ver_div{
	width: 2px;
	background-color: #000;
	position: absolute;
}
.up_div .sweet_div{
	width: 200px;
	height: 45px;
	text-align:center;
	border: 2px solid #000;
	position: absolute;
}
</style>
</head>
<body>
<div class="up_div" id="up_div">
	<div class="tit_div">UP流程图</div>
	<div class="content_div">
		<div class="root_out_div" id="root_out_div">
			<div class="root_in_div">
			</div>
		</div>
		<div class="root_to_t1_hor_div" id="root_to_t1_hor_div"></div>
		<span class="t1_text_span" id="t1_text_span">T1</span>
		<span class="t1_true_text_span" id="t1_true_text_span">True</span>
		<div class="root_to_t1_ver_div" id="root_to_t1_ver_div"></div>
		<div class="t1_to_sweet_ver_div" id="t1_to_sweet_ver_div"></div>
		<div class="sweet_div" id="sweet_div">
			<div class="name_div">
				CLS_SWEETCREAM_UP:1
			</div>
			<div class="unitName_div">
				WP_MIXER1
			</div>
		</div>
		<div class="sweet_to_t2_hor_div" id="sweet_to_t2_hor_div"></div>
		<span class="t2_text_span" id="t2_text_span">T2</span>
		<span class="t2_state_text_span" id="t2_state_text_span">CLS_SWEETCREAM_UP:1.STATE = COMPLETE</span>
		<div class="sweet_to_t2_ver_div" id="sweet_to_t2_ver_div"></div>
		<div class="t2_to_tra_div" id="t2_to_tra_div"></div>
	</div>
</div>
</body>
</html>