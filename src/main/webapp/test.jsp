<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
.root_out_div{
	width: 100px;
	height: 50px;
	margin-left:300px;
	border: 2px solid #000;
}
.root_in_div{
	width: 90px;
	height: 43px;
	margin-top:2px;
	margin-left:2px;
	border: 2px solid #000;
}
.root_to_sweet_hor_div,
.sweet_to_tra_hor_div{
	width:50px;
	height:2px;
	margin-top: 40px;
	margin-left: 325px;
	background-color: #000;
}
.root_to_sweet_ver_div,
.sweet_to_tra_ver_div{
	width:2px;
	height:100px;
	margin-top: -43px;
	margin-left: 350px;
	background-color: #000;
}
.t1_text_span,
.t2_text_span{
	margin-top: -75px;
	margin-left: 300px;
	position: absolute;
}
.t1_true_text_span,
.sweet_up1_state_text_span{
	margin-top: -70px;
	margin-left: 377px;
	position: absolute;
}
.sweet_div{
	width: 200px;
	height: 45px;
	margin-left:252px;
	text-align:center;
	border: 2px solid #000;
}
.sweet_to_tra_line1_div,
.tra_to_fre_line1_div{
	width: 300px;
	height: 2px;
	margin-left: 200px;
	background-color: #000;
}
.sweet_to_tra_line2_div,
.tra_to_fre_line2_div{
	width: 300px;
	height: 2px;
	margin-top: 10px;
	margin-left: 200px;
	background-color: #000;
}
.tra_in_line1_div,
.tra_in_line2_div{
	width:2px;
	height:20px;
	margin-left: 205px;
	background-color: #000;
}
.tra_out_line1_div,
.tra_out_line2_div{
	width:2px;
	height:20px;
	margin-top: -20px;
	margin-left: 493px;
	background-color: #000;
}
.tra_in_div{
	width: 200px;
	height: 45px;
	margin-left:105px;
	text-align:center;
	border: 2px solid #000;
}
.tra_out_div{
	width: 200px;
	height: 45px;
	margin-top:-49px;
	margin-left:388px;
	text-align:center;
	border: 2px solid #000;
}
</style>
</head>
<body>
<div>
	<div class="root_out_div">
		<div class="root_in_div">
		</div>
	</div>
	<div class="root_to_sweet_hor_div"></div>
	<div class="root_to_sweet_ver_div"></div>
	<span class="t1_text_span">T1</span>
	<span class="t1_true_text_span">True</span>
	<div class="sweet_div">
		<div class="name_div">
			CLS_SWEETCREAM_UP:1
		</div>
		<div class="unitName_div">
			WP_MIXER1
		</div>
	</div>
	<div class="sweet_to_tra_hor_div"></div>
	<div class="sweet_to_tra_ver_div"></div>
	<span class="t2_text_span">T2</span>
	<span class="sweet_up1_state_text_span">CLS_SWEETCREAM_UP:1.STATE=COMPLETE</span>
	<div class="sweet_to_tra_line1_div"></div>
	<div class="sweet_to_tra_line2_div"></div>
	<div class="tra_in_line1_div"></div>
	<div class="tra_out_line1_div"></div>
	<div class="tra_in_div">
		<div class="name_div">
			CLS_TRANSFER_IN_UP:1
		</div>
		<div class="unitName_div">
			WP_FREEZER1
		</div>
	</div>
	<div class="tra_out_div">
		<div class="name_div">
			CLS_TRANSFER_IN_UP:1
		</div>
		<div class="unitName_div">
			WP_FREEZER1
		</div>
	</div>
	<div class="tra_in_line2_div"></div>
	<div class="tra_out_line2_div"></div>
	<div class="tra_to_fre_line1_div"></div>
	<div class="tra_to_fre_line2_div"></div>
</div>
</body>
</html>