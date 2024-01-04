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
	initSideDiv();
	initRecipeHeaderDiv();
	getRecipeHeaderList();
});

function initRecipeHeaderDiv(){
	var leftDivHeight=leftDiv.height();
	var recipeHeaderListDiv=$("#recipe_header_list_div");
	var recipeHeaderListDivHeight=leftDivHeight-100;
	recipeHeaderListDiv.height(recipeHeaderListDivHeight);
	recipeHeaderListDiv.css("margin-top",-leftDivHeight+topDivHeight+20+"px");
	
	var recipeHeaderDetailDiv=$("#recipe_header_detail_div");
	recipeHeaderDetailDiv.height(recipeHeaderListDivHeight);
	recipeHeaderDetailDiv.css("margin-top",-recipeHeaderListDivHeight+"px");
	var recipeHeaderListDivMarginLeft=recipeHeaderListDiv.css("margin-left");
	recipeHeaderListDivMarginLeft=parseInt(recipeHeaderListDivMarginLeft.substring(0,recipeHeaderListDivMarginLeft.length-2));
	var recipeHeaderDetailDivMarginLeft=recipeHeaderListDivMarginLeft+recipeHeaderListDiv.width()+30;
	recipeHeaderDetailDiv.css("margin-left",recipeHeaderDetailDivMarginLeft+"px");
	recipeHeaderDetailDiv.width(docWidth-recipeHeaderDetailDivMarginLeft-30);
}

function getRecipeHeaderList(){
	$.post(homePath+"getRecipeHeaderList",
		function(result){
			var listDataDiv=$("#recipe_header_list_div #list_data_div");
			listDataDiv.empty();
			if(result.status=="ok"){
				var recipeHeaderList=result.recipeHeaderList;
				for(var i=0;i<recipeHeaderList.length;i++){
					var recipeHeader=recipeHeaderList[i];
					var itemStr="<div class=\"item_div\" onmouseover=\"changeDivBgColor(this,true);\" onmouseout=\"changeDivBgColor(this,false);\" onclick=\"getParamList(this,'"+recipeHeader.id+"','"+recipeHeader.recipeID+"','"+recipeHeader.productCode+"','"+recipeHeader.productNameCName+"','"+recipeHeader.productDscCName+"','"+recipeHeader.authorCName+"');\">";
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

function getParamList(o,id,recipeID,productCode,productNameCName,productDscCName,authorCName){
	clearRecipeDetail();
	$("#recipeID_hid").val(recipeID);
	$("#product_code_val_span").text(productCode);
	$("#product_name_val_span").text(productNameCName);
	$("#product_dsc_val_span").text(productDscCName);
	$("#author_val_span").text(authorCName);
	loadParamListTab(recipeID);
}

function clearRecipeDetail(){
	$("#recipeID_hid").val("");
	$("#product_code_val_span").text("");
	$("#product_name_val_span").text("");
	$("#product_dsc_val_span").text("");
	$("#author_val_span").text("");
}

function loadParamListTab(recipeID){
	var paramListTab=$("#param_list_tab");
	paramListTab.find(".cont_tr").remove();
	paramListTab.find(".no_data_tr").remove();
	$.post(homePath+"getRecipePMListByRecipeID",
		{recipeID:recipeID},
		function(result){
			if(result.status=="ok"){
				var recipePMList=result.recipePMList;
				for(var i=0;i<recipePMList.length;i++){
					var recipePM=recipePMList[i];
					var appendStr="<tr class=\"cont_tr\">";
							appendStr+="<td>"+recipePM.cname+"</td>";
							appendStr+="<td>"+recipePM.dosage+"</td>";
							appendStr+="<td>90</td>";
							appendStr+="<td>116</td>";
							appendStr+="<td>"+recipePM.unit+"</td>";
						appendStr+="</tr>";
					paramListTab.append(appendStr);
				}
			}
			else
				paramListTab.append("<tr class=\"no_data_tr\"><td class=\"no_data_td\" colspan=\"5\">"+result.message+"</td></tr>");
		}
	,"json");
}

function handCreateWO(){
	var recipeID=$("#recipeID_hid").val();
	$.post(homePath+"handCreateWO",
		{recipeID:recipeID},
		function(result){
			alert(result.state);
		}
	,"json");
}
</script>
<style type="text/css">
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
.recipe_header_detail_div{
	/*
	background-color: #0f0;
	*/
}
.recipe_header_detail_div .detail_div{
	width: 1000px;
	height: 80px;
	/*
	background-color: #00f;
	*/
}
.recipe_header_detail_div .detail_div .key_span{
	position: absolute;
}
.recipe_header_detail_div .detail_div .product_name_key_span{
	margin-top: 10px;
	margin-left: 30px;
}
.recipe_header_detail_div .detail_div .product_code_key_span{
	margin-top: 10px;
	margin-left: 330px;
}
.recipe_header_detail_div .detail_div .author_key_span{
	margin-top: 10px;
	margin-left: 630px;
}
.recipe_header_detail_div .detail_div .product_dsc_key_span{
	margin-top: 50px;
	margin-left: 30px;
}
.recipe_header_detail_div .detail_div .val_span{
	color: #347CAF;
	position: absolute;
}
.recipe_header_detail_div .detail_div .product_name_val_span{
	margin-top: 10px;
	margin-left: 130px;
}
.recipe_header_detail_div .detail_div .product_code_val_span{
	margin-top: 10px;
	margin-left: 430px;
}
.recipe_header_detail_div .detail_div .author_val_span{
	margin-top: 10px;
	margin-left: 730px;
}
.recipe_header_detail_div .detail_div .product_dsc_val_span{
	margin-top: 50px;
	margin-left: 130px;
}
.recipe_header_detail_div .create_wo_but_div{
	width: 100px;
	height: 40px;
	line-height: 40px;
	margin-top:-120px;
	color: #347CAF;
	text-align:center;
	background-color: #f7df07;
	border-radius:5px;
	cursor:pointer;
	float: right; 
}
.recipe_header_detail_div .param_list_tab{
	width: 100%;
	margin-top:30px; 
	border: #eee solid 1px;
}
.recipe_header_detail_div .param_list_tab .tit_tr{
	height: 40px;
}
.recipe_header_detail_div .param_list_tab .tit_tr td{
	font-weight:bold;
	padding-left: 15px;
	border: #eee solid 1px;
}
.recipe_header_detail_div .param_list_tab .cont_tr{
	height: 50px;
}
.recipe_header_detail_div .param_list_tab .cont_tr td{
	padding-left: 15px;
	border: #eee solid 1px;
}
.recipe_header_detail_div .param_list_tab .no_data_td{
	height: 50px;
	text-align:center;
}
</style>
<title>配方管理</title>
</head>
<body>
<%@include file="../../inc/side.jsp"%>
<div class="recipe_header_list_div" id="recipe_header_list_div">
	<div class="title_div">
		<div class="name_div">配方名称</div>
		<div class="version_div">版本号</div>
	</div>
	<div class="list_data_div" id="list_data_div">
	</div>
</div>
<div class="recipe_header_detail_div" id="recipe_header_detail_div">
	<div class="detail_div">
		<input type="hidden" id="recipeID_hid"/>
		<span class="key_span product_name_key_span">产品名称</span>
		<span class="val_span product_name_val_span" id="product_name_val_span"></span>
		<span class="key_span product_code_key_span">产品编码</span>
		<span class="val_span product_code_val_span" id="product_code_val_span"></span>
		<span class="key_span author_key_span">设计者</span>
		<span class="val_span author_val_span" id="author_val_span"></span>
		<span class="key_span product_dsc_key_span">配方描述</span>
		<span class="val_span product_dsc_val_span" id="product_dsc_val_span"></span>
	</div>
	<div class="create_wo_but_div" onclick="handCreateWO()">创建工单</div>
	<table class="param_list_tab" id="param_list_tab" cellspacing="0">
		<tr class="tit_tr">
			<td>参数名称</td>
			<td>参数值</td>
			<td>参数下限</td>
			<td>参数上限</td>
			<td>单位</td>
		</tr>
		<tr class="cont_tr">
			<td>嬲</td>
			<td>100</td>
			<td>90</td>
			<td>116</td>
			<td>kg</td>
		</tr>
	</table>
</div>
</body>
</html>