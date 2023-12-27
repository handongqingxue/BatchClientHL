<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
var homePath=path+'home/';
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

	var leftDivHeight=leftDiv.height();
	var recipeHeaderListDiv=$("#recipe_header_list_div");
	recipeHeaderListDiv.height(leftDivHeight-100);
	recipeHeaderListDiv.css("margin-top",-leftDivHeight+topDivHeight+20+"px");
	
	getRecipeHeaderList();
});

function getRecipeHeaderList(){
	$.post(homePath+"getRecipeHeaderList",
		function(result){
			var listDataDiv=$("#recipe_header_list_div #list_data_div");
			listDataDiv.empty();
			if(result.status=="ok"){
				var recipeHeaderList=result.recipeHeaderList;
				for(var i=0;i<recipeHeaderList.length;i++){
					var recipeHeader=recipeHeaderList[i];
					var itemStr="<div class=\"item_div\" onmouseover=\"changeDivBgColor(this,true);\" onmouseout=\"changeDivBgColor(this,false);\" onclick=\"getParamList(this,'"+recipeHeader.id+"','"+recipeHeader.productNameCName+"');\">";
							itemStr+="<div class=\"name_div\">"+recipeHeader.recipeIDCName+"</div>";
							itemStr+="<div class=\"version_div\">"+recipeHeader.version+"</div>";
						itemStr+="</div>";
						
					listDataDiv.append(itemStr);
				}
			}
		}
	,"json");
}

function changeDivBgColor(o,flag){
	var color;
	var bgColor;
	if(flag){
		color="#fff";
		bgColor="#4095E5"
	}
	else{
		color="#000";
		bgColor="#fff"
	}
	$(o).css("color",color);
	$(o).css("background-color",bgColor);
}

function getParamList(o,id,productNameCName){
	alert(productNameCName);
}
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
	width: 900px;
	height: 50px;
	margin-left:10px;
}
.top_div .nav_div a,
.left_div .nav_div a{
	text-decoration: none;
}
.top_div .nav_div .item_div{
	height: 50px;
	line-height: 50px;
	color:#fff;
}
.top_div .nav_div .selected{
	background-color: #f00;
}
.top_div .nav_div .home_nav_div{
	width: 100px;
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
}
.top_div .nav_div .batch_rec_nav_div img{
	margin-top: 15px;
	margin-left:10px;
	position: absolute;
}
.top_div .nav_div .batch_rec_nav_div span{
	margin-left: 45px;
}
.top_div .nav_div .sys_set_nav_div{
	width: 150px;
	margin-top:-50px;
	margin-left:580px;
}
.top_div .nav_div .sys_set_nav_div img{
	margin-top: 15px;
	margin-left:10px;
	position: absolute;
}
.top_div .nav_div .sys_set_nav_div span{
	margin-left: 45px;
}
.top_div .nav_div .warn_nav_div{
	width: 150px;
	margin-top:-50px;
	margin-left:730px;
}
.top_div .nav_div .warn_nav_div img{
	margin-top: 15px;
	margin-left:10px;
	position: absolute;
}
.top_div .nav_div .warn_nav_div span{
	margin-left: 45px;
}

.left_div{
	width: 200px;
	background-color: #EFEFEF;
}
.left_div .batch_znzz_div{
	width: 199px;
	height: 50px;
	line-height: 50px;
	color:#fff;
	text-align:center;
	background-color: #347CAF;
}
.left_div .nav_div{
	width: 199px;
}
.left_div .nav_div .item_div{
	width: 199px;
	height: 50px;
	line-height: 50px;
	color:#000;
}
.left_div .nav_div .selected{
	color:#fff;
	background-color: #f00;
}
.left_div .nav_div .item_div img{
	margin-top: 15px;
	margin-left:10px;
	position: absolute;
}
.left_div .nav_div .item_div span{
	margin-left: 40px;
}

.recipe_header_list_div{
	width: 350px;
	height: 500px;
	margin-left:250px;
	border: #eee solid 1px;
}
.recipe_header_list_div .title_div{
	width: 100%;
	height: 40px;
	line-height: 40px;
	background-color: #EFEFEF;
}
.recipe_header_list_div .title_div .name_div{
	width: 62%;
	height: 40px;
	padding-left: 8%;
}
.recipe_header_list_div .title_div .version_div{
	width: 30%;
	height: 40px;
	margin-top: -40px;
	text-align:center;
	float: right;
}
.recipe_header_list_div .list_data_div{
	width: 100%;
}
.recipe_header_list_div .list_data_div .item_div{
	width: 100%;
	height: 40px;
	line-height: 40px;
	cursor: pointer;
}
.recipe_header_list_div .list_data_div .item_div .name_div{
	width: 62%;
	height: 40px;
	padding-left: 8%;
}
.recipe_header_list_div .list_data_div .item_div .version_div{
	width: 30%;
	height: 40px;
	margin-top: -40px;
	text-align:center;
	float: right;
}
</style>
<title>配方管理</title>
</head>
<body>
<div class="top_div" id="top_div">
	<div class="nav_div">
		<a href="<%=basePath%>home/recipeManager?firstNav=1&secondNav=1">
			<div class="item_div home_nav_div${param.firstNav eq 1?' selected':'' }">
				<img alt="" src="<%=basePath%>/image/001.png">
				<span>首页</span>
			</div>
		</a>
		<a href="">
			<div class="item_div recipe_nav_div${param.firstNav eq 2?' selected':'' }">
				<img alt="" src="<%=basePath%>/image/002.png">
				<span>Batch配方</span>
			</div>
		</a>
		<a href="">
			<div class="item_div sign_nav_div${param.firstNav eq 3?' selected':'' }">
				<img alt="" src="<%=basePath%>/image/003.png">
				<span>电子签名</span>
			</div>
		</a>
		<a href="">
			<div class="item_div batch_rec_nav_div${param.firstNav eq 4?' selected':'' }">
				<img alt="" src="<%=basePath%>/image/004.png">
				<span>电子批记录</span>
			</div>
		</a>
		<a href="">
			<div class="item_div sys_set_nav_div${param.firstNav eq 5?' selected':'' }">
				<img alt="" src="<%=basePath%>/image/005.png">
				<span>系统设置</span>
			</div>
		</a>
		<a href="">
			<div class="item_div warn_nav_div${param.firstNav eq 6?' selected':'' }">
				<img alt="" src="<%=basePath%>/image/006.png">
				<span>报警诊断</span>
			</div>
		</a>
	</div>
</div>
<div class="left_div" id="left_div">
	<div class="batch_znzz_div">BATCH智能制造</div>
	<div class="nav_div">
		<c:choose>
			<c:when test="${param.firstNav eq 1 }">
			<a href="<%=basePath%>home/recipeManager?firstNav=1&secondNav=1">
				<div class="item_div recipe_mana_nav_div${param.secondNav eq 1?' selected':'' }">
					<img alt="" src="<%=basePath%>/image/007.png">
					<span>配方管理</span>
				</div>
			</a>
			<div class="item_div">
				<img alt="" src="<%=basePath%>/image/008.png">
				<span>工单管理</span>
			</div>
			<div class="item_div">
				<img alt="" src="<%=basePath%>/image/009.png">
				<span>工单生产</span>
			</div>
			</c:when>
		</c:choose>
	</div>
</div>
<div class="recipe_header_list_div" id="recipe_header_list_div">
	<div class="title_div">
		<div class="name_div">配方名称</div>
		<div class="version_div">版本号</div>
	</div>
	<div class="list_data_div" id="list_data_div">
	</div>
</div>
</body>
</html>