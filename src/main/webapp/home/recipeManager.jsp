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
.top_div .nav_div{
	width: 800px;
	height: 50px;
	margin-left:10px;
	background-color: #0f0;
}
.top_div .nav_div .item_div{
	height: 50px;
	line-height: 50px;
	color:#fff;
}
.top_div .nav_div .home_nav_div{
	width: 100px;
	background-color: red;
}
.top_div .nav_div .home_nav_div img{
	margin-top: 10px;
	margin-left:10px;
	position: absolute;
}
.top_div .nav_div .home_nav_div span{
	margin-left: 45px;
}
.top_div .nav_div .recipe_nav_div{
	width: 150px;
	margin-top:-50px;
	margin-left:100px;
	background-color: green;
}
.top_div .nav_div .recipe_nav_div img{
	margin-top: 10px;
	margin-left:10px;
	position: absolute;
}
.top_div .nav_div .recipe_nav_div span{
	margin-left: 45px;
}
.top_div .nav_div .sign_nav_div{
	width: 150px;
	margin-top:-50px;
	margin-left:250px;
	background-color: red;
}
.top_div .nav_div .sign_nav_div img{
	margin-top: 15px;
	margin-left:10px;
	position: absolute;
}
.top_div .nav_div .sign_nav_div span{
	margin-left: 45px;
}
.top_div .nav_div .batch_rec_nav_div{
	width: 180px;
	margin-top:-50px;
	margin-left:400px;
	background-color: green;
}
.top_div .nav_div .batch_rec_nav_div img{
	margin-top: 15px;
	margin-left:10px;
	position: absolute;
}
.top_div .nav_div .batch_rec_nav_div span{
	margin-left: 45px;
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
<div class="top_div" id="top_div">
	<div class="nav_div">
		<div class="item_div home_nav_div">
			<img alt="" src="<%=basePath%>/image/001.png">
			<span>首页</span>
		</div>
		<div class="item_div recipe_nav_div">
			<img alt="" src="<%=basePath%>/image/002.png">
			<span>Batch配方</span>
		</div>
		<div class="item_div sign_nav_div">
			<img alt="" src="<%=basePath%>/image/003.png">
			<span>电子签名</span>
		</div>
		<div class="item_div batch_rec_nav_div">
			<img alt="" src="<%=basePath%>/image/004.png">
			<span>电子批记录</span>
		</div>
		<div class="item_div sys_set_nav_div">
			<img alt="" src="<%=basePath%>/image/004.png">
			<span>系统设置</span>
		</div>
	</div>
</div>
<div class="left_div" id="left_div">
	<div class="batch_znzz_div">BATCH智能制造</div>
</div>
</body>
</html>