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
var horVerJoinSpace=10;

var stepHorConnDivHeight=2;
var stepVerConnDivWidth=2;
var stepVerConnDivHeight=20;
var stepDivWidth=200;
var stepDivHeight=45;

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

var sweetToT2HorDivWidth;
var sweetToT2HorDivMarginLeft;
var sweetToT2HorDivMarginTop;

var t2StateTextSpanWidth;
var t2StateTextSpanMarginLeft;
var t2StateTextSpanMarginTop;

var sweetToT2VerDivWidth;
var sweetToT2VerDivHeight;
var sweetToT2VerDivMarginLeft;
var sweetToT2VerDivMarginTop;

var traInDivMarginLeft;
var traInDivMarginTop;

var traOutDivMarginLeft;
var traOutDivMarginTop;

var t2ToTraVerConn1DivMarginLeft;
var t2ToTraVerConn1DivMarginTop;

var t2ToTraVerConn2DivMarginLeft;
var t2ToTraVerConn2DivMarginTop;

var t2ToTraHorConn1DivWidth;

var t2ToTraHorConn2DivMarginLeft;
var t2ToTraHorConn2DivMarginTop;

var traToT3VerConn1DivMarginTop;

var traToT3HorConn1DivMarginTop;
var traToT3HorConn2DivMarginTop;

var traToT3HorDivWidth;
var traToT3HorDivMarginLeft;
var traToT3HorDivMarginTop;

var traToT3VerDivWidth;
var traToT3VerDivMarginLeft;
var traToT3VerDivMarginTop;
var traToT3VerDivHeight;

var t3StateTextSpanWidth;
var t3StateTextSpanMarginLeft;
var t3StateTextSpanMarginTop;

var freDivMarginLeft;
var freDivMarginTop;
var freDivWidth;
var freDivHeight;

var freToT4HorDivWidth;
var freToT4HorDivMarginLeft;
var freToT4HorDivMarginTop;

var t4StateTextSpanWidth;
var t4StateTextSpanMarginLeft;
var t4StateTextSpanMarginTop;

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
	
	initT2StateLeftHorDiv();
	
	initT2StateTextSpan();
	
	initT2StateLeftVerDiv();
	
	initT2StateLeftSpan();
	
	initT2ToTraVerDiv();
	
	initT2ToTraHorConnDiv();
	
	initTraInDiv();
	
	initTraOutDiv();
	
	initT2ToTraVerConnDiv();
	
	editT2ToTraHorConnDiv();
	
	editT2ToTraVerDiv();
	
	initTraToT3VerConnDiv();
	
	initTraToT3HorConnDiv();
	
	initT3StateLeftHorDiv();
	
	initT3StateTextSpan();
	
	initT3StateLeftVerDiv();
	
	initT3StateLeftSpan();
	
	initT3ToFreVerDiv();
	
	initFreDiv();
	
	initT4StateLeftHorDiv();
	
	initT4StateTextSpan();
	
	initT4StateLeftVerDiv();
	
	initT4StateLeftSpan();
	
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
	
	rootToT1VerDivWidth=convertPxToNum(rootToT1VerDiv.css("width"),defaultScale);
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
	
	t1TextSpanMarginLeft=convertPxToNum(t1TextSpan.css("margin-left"),defaultScale);
}

//T1State左边的竖线2
function initT1ToSweetVerDiv(){
	t1ToSweetVerDiv=$("#up_div #t1_to_sweet_ver_div");
	t1ToSweetVerDiv.css("margin-left",rootToT1VerDivMarginLeft+"px");
}

//SweetDiv
function initSweetDiv(){
	var sweetDiv=$("#up_div #sweet_div");
	sweetDiv.css("width",stepDivWidth+"px");
	sweetDiv.css("height",stepDivHeight+"px");
	sweetDiv.css("margin-left",convertPxToNum("600px",changeScale)+"px");
	sweetDiv.css("margin-top",convertPxToNum("700px",changeScale)+"px");

	sweetDivMarginLeft=convertPxToNum(sweetDiv.css("margin-left"),defaultScale);
	sweetDivMarginTop=convertPxToNum(sweetDiv.css("margin-top"),defaultScale);
	sweetDivWidth=convertPxToNum(sweetDiv.css("width"),defaultScale);
	sweetDivHeight=convertPxToNum(sweetDiv.css("height"),defaultScale);
}

//设置从T1到sweet框垂直线的高和距离上方的像素
function editT1StateLeftVerDiv(){
	t1ToSweetVerDiv.css("height",sweetDivMarginTop-rootToT1HorDivMarginTop+"px");//用sweet框距离上方的像素-从root框到T1框的水平线距离上方的像素
	t1ToSweetVerDiv.css("margin-top",rootToT1HorDivMarginTop+"px");
}

//T2状态左边的横线
function initT2StateLeftHorDiv(){
	var sweetToT2HorDiv=$("#up_div #sweet_to_t2_hor_div");
	
	var sweetToT2HorDivWidth=horDivWidth;
	sweetToT2HorDivMarginLeft=convertPxToNum("800px",changeScale);
	sweetToT2HorDivMarginTop=convertPxToNum("980px",changeScale);
	
	sweetToT2HorDiv.css("width",sweetToT2HorDivWidth+"px");
	sweetToT2HorDiv.css("margin-left",sweetToT2HorDivMarginLeft+"px");
	sweetToT2HorDiv.css("margin-top",sweetToT2HorDivMarginTop+"px");
	
	sweetToT2HorDivWidth=convertPxToNum(sweetToT2HorDiv.css("width"),1);
	sweetToT2HorDivMarginLeft=convertPxToNum(sweetToT2HorDiv.css("margin-left"),defaultScale);
	sweetToT2HorDivMarginTop=convertPxToNum(sweetToT2HorDiv.css("margin-top"),defaultScale);
}

//T2状态
function initT2StateTextSpan(){
	var t2StateTextSpan=$("#up_div #t2_state_text_span");
	t2StateTextSpan.css("margin-left",rootToT1HorDivMarginLeft+horDivWidth+"px");
	t2StateTextSpan.css("margin-top",sweetToT2HorDivMarginTop-10+"px");
	
	t2StateTextSpanWidth=convertPxToNum(t2StateTextSpan.css("width"),defaultScale);
	t2StateTextSpanMarginLeft=convertPxToNum(t2StateTextSpan.css("margin-left"),defaultScale);
	t2StateTextSpanMarginTop=convertPxToNum(t2StateTextSpan.css("margin-top"),defaultScale);
}

//T2状态左边的竖线
function initT2StateLeftVerDiv(){
	var sweetToT2VerDiv=$("#up_div #sweet_to_t2_ver_div");
	
	sweetToT2VerDivWidth=convertPxToNum(sweetToT2VerDiv.css("width"),defaultScale);
	sweetToT2VerDivMarginLeft=rootToT1VerDivMarginLeft;
	sweetToT2VerDivMarginTop=changeByScale(sweetDivMarginTop+sweetDivHeight+4,defaultScale);
	sweetToT2VerDivHeight=sweetToT2HorDivMarginTop-sweetDivMarginTop-sweetDivHeight;
	
	sweetToT2VerDiv.css("margin-left",sweetToT2VerDivMarginLeft+"px");
	sweetToT2VerDiv.css("margin-top",sweetToT2VerDivMarginTop+"px");
	sweetToT2VerDiv.css("height",sweetToT2VerDivHeight-4+"px");
}

//T2状态左边的T2
function initT2StateLeftSpan(){
	var t2TextSpan=$("#up_div #t2_text_span");
	t2TextSpan.css("margin-left",t1TextSpanMarginLeft+"px");
	t2TextSpan.css("margin-top",t2StateTextSpanMarginTop-15+"px");
}

function initT2ToTraVerDiv(){
	var t2ToTraVerDiv=$("#up_div #t2_to_tra_ver_div");
	t2ToTraVerDiv.css("width",stepVerConnDivWidth+"px");
	
}

function initT2ToTraHorConnDiv(){
	var t2ToTraHorConn1Div=$("#up_div #t2_to_tra_hor_conn1_div");
	t2ToTraHorConn1Div.css("height",stepHorConnDivHeight+"px");
	
	var t2ToTraHorConn2Div=$("#up_div #t2_to_tra_hor_conn2_div");
	t2ToTraHorConn2Div.css("height",stepHorConnDivHeight+"px");
}

function initTraInDiv(){
	var traInDiv=$("#up_div #tra_in_div");
	traInDiv.css("width",stepDivWidth+"px");
	traInDiv.css("height",stepDivHeight+"px");
	
	traInDivMarginLeft=convertPxToNum("200px",changeScale);
	traInDivMarginTop=convertPxToNum("1300px",changeScale);
	
	traInDiv.css("margin-left",traInDivMarginLeft+"px");
	traInDiv.css("margin-top",traInDivMarginTop+"px");
}

function initTraOutDiv(){
	var traOutDiv=$("#up_div #tra_out_div");
	traOutDiv.css("width",stepDivWidth+"px");
	traOutDiv.css("height",stepDivHeight+"px");
	
	traOutDivMarginLeft=convertPxToNum("1000px",changeScale);
	traOutDivMarginTop=convertPxToNum("1300px",changeScale);
	
	traOutDiv.css("margin-left",traOutDivMarginLeft+"px");
	traOutDiv.css("margin-top",traOutDivMarginTop+"px");
}

function initT2ToTraVerConnDiv(){
	var t2ToTraVerConn1Div=$("#up_div #t2_to_tra_ver_conn1_div");
	t2ToTraVerConn1Div.css("width",stepVerConnDivWidth+"px");
	t2ToTraVerConn1Div.css("height",stepVerConnDivHeight+"px");
	
	t2ToTraVerConn1DivMarginLeft=traInDivMarginLeft+stepDivWidth/2;
	t2ToTraVerConn1DivMarginTop=traInDivMarginTop-stepVerConnDivHeight;
	
	t2ToTraVerConn1Div.css("margin-left",t2ToTraVerConn1DivMarginLeft+"px");
	t2ToTraVerConn1Div.css("margin-top",t2ToTraVerConn1DivMarginTop+"px");
	
	var t2ToTraVerConn2Div=$("#up_div #t2_to_tra_ver_conn2_div");
	t2ToTraVerConn2Div.css("width",stepVerConnDivWidth+"px");
	t2ToTraVerConn2Div.css("height",stepVerConnDivHeight+"px");
	
	t2ToTraVerConn2DivMarginLeft=traOutDivMarginLeft+stepDivWidth/2;
	t2ToTraVerConn2DivMarginTop=traOutDivMarginTop-stepVerConnDivHeight;
	
	t2ToTraVerConn2Div.css("margin-left",t2ToTraVerConn2DivMarginLeft+"px");
	t2ToTraVerConn2Div.css("margin-top",t2ToTraVerConn2DivMarginTop+"px");
}

function editT2ToTraHorConnDiv(){
	var t2ToTraHorConn1Div=$("#up_div #t2_to_tra_hor_conn1_div");
	
	t2ToTraHorConn1DivWidth=t2ToTraVerConn2DivMarginLeft-t2ToTraVerConn1DivMarginLeft+horVerJoinSpace*2;
	t2ToTraHorConn1DivMarginLeft=t2ToTraVerConn1DivMarginLeft-horVerJoinSpace;
	
	t2ToTraHorConn1Div.css("width",t2ToTraHorConn1DivWidth+"px");
	t2ToTraHorConn1Div.css("height",stepHorConnDivHeight+"px");
	t2ToTraHorConn1Div.css("margin-left",t2ToTraHorConn1DivMarginLeft+"px");
	t2ToTraHorConn1Div.css("margin-top",t2ToTraVerConn1DivMarginTop+"px");
	
	var t2ToTraHorConn2Div=$("#up_div #t2_to_tra_hor_conn2_div");
	
	t2ToTraHorConn2DivMarginLeft=t2ToTraHorConn1DivMarginLeft;
	t2ToTraHorConn2DivMarginTop=t2ToTraVerConn1DivMarginTop-horVerJoinSpace;
	
	t2ToTraHorConn2Div.css("width",t2ToTraHorConn1DivWidth+"px");
	t2ToTraHorConn2Div.css("height",stepHorConnDivHeight+"px");
	t2ToTraHorConn2Div.css("margin-left",t2ToTraHorConn2DivMarginLeft+"px");
	t2ToTraHorConn2Div.css("margin-top",t2ToTraHorConn2DivMarginTop+"px");
}

function editT2ToTraVerDiv(){
	var t2ToTraVerDiv=$("#up_div #t2_to_tra_ver_div");
	
	t2ToTraVerDiv.css("height",t2ToTraHorConn2DivMarginTop-sweetToT2VerDivMarginTop+"px");
	t2ToTraVerDiv.css("margin-left",sweetToT2VerDivMarginLeft+"px");
	t2ToTraVerDiv.css("margin-top",sweetToT2VerDivMarginTop+"px");
}

function initTraToT3VerConnDiv(){
	var traToT3VerConn1Div=$("#up_div #tra_to_t3_ver_conn1_div");
	traToT3VerConn1Div.css("width",stepVerConnDivWidth+"px");
	traToT3VerConn1Div.css("height",stepVerConnDivHeight+"px");
	
	traToT3VerConn1DivMarginTop=traInDivMarginTop+stepDivHeight+stepHorConnDivHeight;
	
	traToT3VerConn1Div.css("margin-left",t2ToTraVerConn1DivMarginLeft+"px");
	traToT3VerConn1Div.css("margin-top",traToT3VerConn1DivMarginTop+"px");
	
	var traToT3VerConn2Div=$("#up_div #tra_to_t3_ver_conn2_div");
	traToT3VerConn2Div.css("width",stepVerConnDivWidth+"px");
	traToT3VerConn2Div.css("height",stepVerConnDivHeight+"px");
	
	traToT3VerConn2Div.css("margin-left",t2ToTraVerConn2DivMarginLeft+"px");
	traToT3VerConn2Div.css("margin-top",traToT3VerConn1DivMarginTop+"px");
	
}

function initTraToT3HorConnDiv(){
	var traToT3HorConn1Div=$("#up_div #tra_to_t3_hor_conn1_div");
	traToT3HorConn1Div.css("height",stepHorConnDivHeight+"px");
	
	traToT3HorConn1DivMarginTop=traToT3VerConn1DivMarginTop+stepVerConnDivHeight;
	traToT3HorConn2DivMarginTop=traToT3HorConn1DivMarginTop+horVerJoinSpace;
	
	traToT3HorConn1Div.css("width",t2ToTraHorConn1DivWidth+"px");
	traToT3HorConn1Div.css("height",stepHorConnDivHeight+"px");
	traToT3HorConn1Div.css("margin-left",t2ToTraHorConn1DivMarginLeft+"px");
	traToT3HorConn1Div.css("margin-top",traToT3HorConn1DivMarginTop+"px");
	
	var traToT3HorConn2Div=$("#up_div #tra_to_t3_hor_conn2_div");
	traToT3HorConn2Div.css("width",t2ToTraHorConn1DivWidth+"px");
	traToT3HorConn2Div.css("height",stepHorConnDivHeight+"px");
	traToT3HorConn2Div.css("margin-left",t2ToTraHorConn1DivMarginLeft+"px");
	traToT3HorConn2Div.css("margin-top",traToT3HorConn2DivMarginTop+"px");
}

//T3状态左边的横线
function initT3StateLeftHorDiv(){
	var traToT3HorDiv=$("#up_div #tra_to_t3_hor_div");
	
	var traToT3HorDivWidth=horDivWidth;
	traToT3HorDivMarginLeft=convertPxToNum("800px",changeScale);
	traToT3HorDivMarginTop=convertPxToNum("1700px",changeScale);
	
	traToT3HorDiv.css("width",traToT3HorDivWidth+"px");
	traToT3HorDiv.css("margin-left",traToT3HorDivMarginLeft+"px");
	traToT3HorDiv.css("margin-top",traToT3HorDivMarginTop+"px");
	
	traToT3HorDivWidth=convertPxToNum(traToT3HorDiv.css("width"),1);
	traToT3HorDivMarginLeft=convertPxToNum(traToT3HorDiv.css("margin-left"),defaultScale);
	traToT3HorDivMarginTop=convertPxToNum(traToT3HorDiv.css("margin-top"),defaultScale);
}

//T3状态
function initT3StateTextSpan(){
	var t3StateTextSpan=$("#up_div #t3_state_text_span");
	t3StateTextSpan.css("margin-left",rootToT1HorDivMarginLeft+horDivWidth+"px");
	t3StateTextSpan.css("margin-top",traToT3HorDivMarginTop-10+"px");
	
	t3StateTextSpanWidth=convertPxToNum(t3StateTextSpan.css("width"),defaultScale);
	t3StateTextSpanMarginLeft=convertPxToNum(t3StateTextSpan.css("margin-left"),defaultScale);
	t3StateTextSpanMarginTop=convertPxToNum(t3StateTextSpan.css("margin-top"),defaultScale);
}

//T3状态左边的竖线
function initT3StateLeftVerDiv(){
	var traToT3VerDiv=$("#up_div #tra_to_t3_ver_div");
	
	traToT3VerDivWidth=convertPxToNum(traToT3VerDiv.css("width"),defaultScale);
	traToT3VerDivMarginLeft=rootToT1VerDivMarginLeft;
	traToT3VerDivMarginTop=changeByScale(traInDivMarginTop+stepDivHeight+4,defaultScale);
	traToT3VerDivHeight=traToT3HorDivMarginTop-traToT3HorConn2DivMarginTop;
	
	traToT3VerDiv.css("margin-left",traToT3VerDivMarginLeft+"px");
	traToT3VerDiv.css("margin-top",traToT3HorDivMarginTop-traToT3VerDivHeight+"px");
	traToT3VerDiv.css("height",traToT3VerDivHeight-4+"px");
}

//T3状态左边的T3
function initT3StateLeftSpan(){
	var t3TextSpan=$("#up_div #t3_text_span");
	t3TextSpan.css("margin-left",t1TextSpanMarginLeft+"px");
	t3TextSpan.css("margin-top",t3StateTextSpanMarginTop-15+"px");
}

function initT3ToFreVerDiv(){
	var t3ToFreVerDiv=$("#up_div #t3_to_fre_ver_div");
	t3ToFreVerDiv.css("width",stepVerConnDivWidth+"px");
}

//FreDiv
function initFreDiv(){
	var freDiv=$("#up_div #fre_div");
	freDiv.css("width",stepDivWidth+"px");
	freDiv.css("height",stepDivHeight+"px");
	freDiv.css("margin-left",convertPxToNum("600px",changeScale)+"px");
	freDiv.css("margin-top",convertPxToNum("1900px",changeScale)+"px");

	freDivMarginLeft=convertPxToNum(freDiv.css("margin-left"),defaultScale);
	freDivMarginTop=convertPxToNum(freDiv.css("margin-top"),defaultScale);
	freDivWidth=convertPxToNum(freDiv.css("width"),defaultScale);
	freDivHeight=convertPxToNum(freDiv.css("height"),defaultScale);
}

//T4状态左边的横线
function initT4StateLeftHorDiv(){
	var freToT4HorDiv=$("#up_div #fre_to_t4_hor_div");
	
	var freToT4HorDivWidth=horDivWidth;
	freToT4HorDivMarginLeft=convertPxToNum("800px",changeScale);
	freToT4HorDivMarginTop=convertPxToNum("2198px",changeScale);
	
	freToT4HorDiv.css("width",freToT4HorDivWidth+"px");
	freToT4HorDiv.css("margin-left",freToT4HorDivMarginLeft+"px");
	freToT4HorDiv.css("margin-top",freToT4HorDivMarginTop+"px");
	
	freToT4HorDivWidth=convertPxToNum(freToT4HorDiv.css("width"),1);
	freToT4HorDivMarginLeft=convertPxToNum(freToT4HorDiv.css("margin-left"),defaultScale);
	freToT4HorDivMarginTop=convertPxToNum(freToT4HorDiv.css("margin-top"),defaultScale);
}

//T4状态
function initT4StateTextSpan(){
	var t4StateTextSpan=$("#up_div #t4_state_text_span");
	t4StateTextSpan.css("margin-left",rootToT1HorDivMarginLeft+horDivWidth+"px");
	t4StateTextSpan.css("margin-top",freToT4HorDivMarginTop-10+"px");
	
	t4StateTextSpanWidth=convertPxToNum(t4StateTextSpan.css("width"),defaultScale);
	t4StateTextSpanMarginLeft=convertPxToNum(t4StateTextSpan.css("margin-left"),defaultScale);
	t4StateTextSpanMarginTop=convertPxToNum(t4StateTextSpan.css("margin-top"),defaultScale);
}

//T4状态左边的竖线
function initT4StateLeftVerDiv(){
	var freToT4VerDiv=$("#up_div #fre_to_t4_ver_div");
	
	freToT4VerDivWidth=convertPxToNum(freToT4VerDiv.css("width"),defaultScale);
	freToT4VerDivMarginLeft=rootToT1VerDivMarginLeft;
	freToT4VerDivMarginTop=changeByScale(traInDivMarginTop+stepDivHeight+4,defaultScale);
	freToT4VerDivHeight=freToT4HorDivMarginTop-freToT4HorConn2DivMarginTop;
	
	freToT4VerDiv.css("margin-left",freToT4VerDivMarginLeft+"px");
	freToT4VerDiv.css("margin-top",freToT4HorDivMarginTop-freToT4VerDivHeight+"px");
	freToT4VerDiv.css("height",freToT4VerDivHeight-4+"px");
}

//T4状态左边的T4
function initT4StateLeftSpan(){
	var t4TextSpan=$("#up_div #t4_text_span");
	t4TextSpan.css("margin-left",t1TextSpanMarginLeft+"px");
	t4TextSpan.css("margin-top",t4StateTextSpanMarginTop-15+"px");
}

//T4状态左边的竖线
function initT4StateLeftVerDiv(){
	var freToT4VerDiv=$("#up_div #fre_to_t4_ver_div");
	
	freToT4VerDivWidth=convertPxToNum(freToT4VerDiv.css("width"),defaultScale);
	freToT4VerDivMarginLeft=rootToT1VerDivMarginLeft;
	freToT4VerDivMarginTop=changeByScale(freDivMarginTop+freDivHeight+4,defaultScale);
	freToT4VerDivHeight=freToT4HorDivMarginTop-freDivMarginTop-freDivHeight;
	
	freToT4VerDiv.css("margin-left",freToT4VerDivMarginLeft+"px");
	freToT4VerDiv.css("margin-top",freToT4VerDivMarginTop+"px");
	freToT4VerDiv.css("height",freToT4VerDivHeight-4+"px");
}

function convertPxToNum(px,scale){
	return Number(px.substring(0,px.length-2)*scale);
}

function changeByScale(num,scale){
	return num*scale;
}

function initRecipeHeader(){
	$.post(path+"batch/initRecipeHeader",
		function(){
		
		}
	,"json");
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
.up_div .t2_text_span,
.up_div .t3_text_span,
.up_div .t4_text_span{
	position: absolute;
}
.up_div .t1_true_text_span,
.up_div .t2_state_text_span,
.up_div .t3_state_text_span,
.up_div .t4_state_text_span{
	position: absolute;
}
.up_div .root_to_t1_ver_div{
	width: 2px;
	background-color: #000;
	position: absolute;
}
.up_div .root_to_t1_hor_div,
.up_div .sweet_to_t2_hor_div,
.up_div .tra_to_t3_hor_div,
.up_div .fre_to_t4_hor_div{
	height: 2px;
	background-color: #000;
	position: absolute;
}
.up_div .t1_to_sweet_ver_div,
.up_div .sweet_to_t2_ver_div,
.up_div .t2_to_tra_ver_div,
.up_div .tra_to_t3_ver_div,
.up_div .t3_to_fre_ver_div,
.up_div .fre_to_t4_ver_div{
	width: 2px;
	background-color: #000;
	position: absolute;
}
.up_div .sweet_div,
.up_div .tra_in_div,
.up_div .tra_out_div,
.up_div .fre_div{
	text-align:center;
	border: 2px solid #000;
	position: absolute;
}
.up_div .t2_to_tra_hor_conn_div,
.up_div .t2_to_tra_ver_conn_div,
.up_div .tra_to_t3_ver_conn_div,
.up_div .tra_to_t3_hor_conn_div{
	background-color: #000;
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
		
		<div class="t2_to_tra_ver_div" id="t2_to_tra_ver_div"></div>
		
		<div class="t2_to_tra_hor_conn_div" id="t2_to_tra_hor_conn1_div"></div>
		<div class="t2_to_tra_hor_conn_div" id="t2_to_tra_hor_conn2_div"></div>
		
		<div class="t2_to_tra_ver_conn_div" id="t2_to_tra_ver_conn1_div"></div>
		<div class="t2_to_tra_ver_conn_div" id="t2_to_tra_ver_conn2_div"></div>
		
		<div class="tra_in_div" id="tra_in_div">
			<div class="name_div">
				CLS_TRANSFER_IN_UP:1
			</div>
			<div class="unitName_div">
				WP_FREEZER1
			</div>
		</div>
		
		<div class="tra_out_div" id="tra_out_div">
			<div class="name_div">
				CLS_TRANSFER_OUT_UP:1
			</div>
			<div class="unitName_div">
				WP_MIXER1
			</div>
		</div>
		
		<div class="tra_to_t3_ver_conn_div" id="tra_to_t3_ver_conn1_div"></div>
		<div class="tra_to_t3_ver_conn_div" id="tra_to_t3_ver_conn2_div"></div>
		
		<div class="tra_to_t3_hor_conn_div" id="tra_to_t3_hor_conn1_div"></div>
		<div class="tra_to_t3_hor_conn_div" id="tra_to_t3_hor_conn2_div"></div>
		
		<div class="tra_to_t3_hor_div" id="tra_to_t3_hor_div"></div>
		<span class="t3_text_span" id="t3_text_span">T3</span>
		<span class="t3_state_text_span" id="t3_state_text_span">CLS_TRANSFER_IN_UP:1.STATE = COMPLETE AND CLS_TRANSFER_OUT_UP:1.STATE = COMPLETE</span>
		<div class="tra_to_t3_ver_div" id="tra_to_t3_ver_div"></div>
		
		<div class="t3_to_fre_ver_div" id="t3_to_fre_ver_div"></div>
		
		<div class="fre_div" id="fre_div">
			<div class="name_div">
				CLS_FRENCHVANILLA_UP:1
			</div>
			<div class="unitName_div">
				WP_FREEZER1
			</div>
		</div>
		
		<div class="fre_to_t4_hor_div" id="fre_to_t4_hor_div"></div>
		<span class="t4_text_span" id="t4_text_span">T4</span>
		<span class="t4_state_text_span" id="t4_state_text_span">CLS_FRENCHVANILLA_UP:1.STATE = COMPLETE</span>
		<div class="fre_to_t4_ver_div" id="fre_to_t4_ver_div"></div>
	</div>
</div>
<div>
<input type="button" value="初始化配方" onclick="initRecipeHeader()"/>
</div>
</body>
</html>