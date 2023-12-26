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
$(function(){
	var docHeight=$(document).height();
	var bodyDiv=$("body");
	var leftDiv=$("#left_div");
	var topDiv=$("#top_div");
	
	var bodyDivWidth=bodyDiv.width();
	var bodyDivHeight=bodyDiv.height();
	var leftDivWidth=leftDiv.width();
	var topDivHeight=topDiv.height();
	
	topDiv.width(bodyDivWidth-leftDivWidth);
	topDiv.css("margin-left",leftDivWidth+"px");
	leftDiv.height(docHeight);
	leftDiv.css("margin-top",-topDivHeight+"px");
});
</script>
<style type="text/css">
body{
	margin: 0;
}
.top_div{
	width: 100%;
	height: 50px;
	background-color: #347CAF;
}
.left_div{
	width: 200px;
	background-color: #EFEFEF;
}
.batch_znzz_div{
	width: 199px;
	height: 50px;
	line-height: 50px;
	color:#fff;
	text-align:center;
	background-color: #347CAF;
}
</style>
<title>配方管理</title>
</head>
<body>
<div class="top_div" id="top_div"></div>
<div class="left_div" id="left_div">
	<div class="batch_znzz_div">BATCH智能制造</div>
</div>
</body>
</html>