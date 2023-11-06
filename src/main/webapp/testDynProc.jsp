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
$(function(){
	initUpDivLoc();
});

function initUpDivLoc(){
	var rootOutDiv=$("#up_div #root_out_div");
	rootOutDiv.css("width",convertPxToNum("100px",1));
	rootOutDiv.css("height",convertPxToNum("50px",1));
	rootOutDiv.css("margin-left",convertPxToNum("700px",changeScale));
	rootOutDiv.css("margin-top",convertPxToNum("100px",changeScale));
	
	var rootOutDivMarginLeft=convertPxToNum(rootOutDiv.css("margin-left"),defaultScale);
	var rootOutDivMarginTop=convertPxToNum(rootOutDiv.css("margin-top"),defaultScale);
	var rootOutDivWidth=convertPxToNum(rootOutDiv.css("width"),1);
	var rootOutDivHeight=convertPxToNum(rootOutDiv.css("height"),1);
	
	//true左边的横线-start
	var rootToT1HorDiv=$("#up_div #root_to_t1_hor_div");
	var rootToT1HorDivWidth=convertPxToNum("40px",1);
	rootToT1HorDiv.css("width",rootToT1HorDivWidth+"px");
	rootToT1HorDiv.css("margin-left",convertPxToNum("800px",changeScale)+"px");
	rootToT1HorDiv.css("margin-top",convertPxToNum("400px",changeScale)+"px");
	
	var rootToT1HorDivMarginLeft=convertPxToNum(rootToT1HorDiv.css("margin-left"),defaultScale);
	var rootToT1HorDivMarginTop=convertPxToNum(rootToT1HorDiv.css("margin-top"),defaultScale);
	//true左边的横线-end
	
	//true-start
	var t1TrueTextSpan=$("#up_div #t1_true_text_span");
	t1TrueTextSpan.css("margin-left",rootToT1HorDivMarginLeft+40+"px");
	t1TrueTextSpan.css("margin-top",rootToT1HorDivMarginTop-10+"px");
	
	var t1TrueTextSpanWidth=convertPxToNum(t1TrueTextSpan.css("width"),defaultScale);
	var t1TrueTextSpanMarginLeft=convertPxToNum(t1TrueTextSpan.css("margin-left"),defaultScale);
	var t1TrueTextSpanMarginTop=convertPxToNum(t1TrueTextSpan.css("margin-top"),defaultScale);
	//true-end
	
	//true左边的竖线-start
	var rootToT1Ver1Div=$("#up_div #root_to_t1_ver1_div");
	var rootToT1Ver1DivWidth=convertPxToNum(rootToT1Ver1Div.css("width"),1);
	var rootToT1Ver1DivMarginLeft=changeByScale(t1TrueTextSpanMarginLeft-t1TrueTextSpanWidth/2,defaultScale);
	var rootToT1Ver1DivMarginTop=changeByScale(rootOutDivMarginTop+rootOutDivHeight+4,defaultScale);
	var rootToT1Ver1DivHeight=rootToT1HorDivMarginTop-rootOutDivMarginTop-rootOutDivHeight;
	
	rootToT1Ver1Div.css("margin-left",rootToT1Ver1DivMarginLeft+"px");
	rootToT1Ver1Div.css("margin-top",rootToT1Ver1DivMarginTop+"px");
	rootToT1Ver1Div.css("height",rootToT1Ver1DivHeight-4+"px");
	alert(rootToT1HorDivMarginTop)
	//true左边的竖线-end

	var t1TextSpan=$("#up_div #t1_text_span");
	t1TextSpan.css("margin-left",rootOutDivMarginLeft+rootOutDivWidth/2-rootToT1HorDivWidth/2-30+"px");
	t1TextSpan.css("margin-top",t1TrueTextSpanMarginTop-15+"px");
	
	//alert(rootToT1HorDivWidth)
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
.up_div .t1_text_span{
	position: absolute;
}
.up_div .t1_true_text_span{
	position: absolute;
}
.up_div .root_to_t1_ver1_div{
	width: 2px;
	background-color: #000;
	position: absolute;
}
.up_div .root_to_t1_hor_div{
	height: 2px;
	background-color: #000;
	position: absolute;
}
.up_div .sweet_div{
	width: 200px;
	height: 45px;
	margin-left:600px;
	margin-top:700px;
	text-align:center;
	border: 2px solid #000;
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
		<div class="root_to_t1_ver1_div" id="root_to_t1_ver1_div"></div>
		<div class="sweet_div">
			<div class="name_div">
				CLS_SWEETCREAM_UP:1
			</div>
			<div class="unitName_div">
				WP_MIXER1
			</div>
		</div>
	</div>
</div>
</body>
</html>