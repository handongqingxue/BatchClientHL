<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
.up_div,
.sweet_phase_div,
.tra_in_op_div,
.xfr_in_div{
	width: 100%;
	margin: 100px auto;
}
.up_div .tit_div,
.sweet_phase_div .tit_div,
.tra_in_op_div .tit_div,
.xfr_in_div .tit_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	text-align: center;
}
.up_div .root_out_div,
.sweet_phase_div .root_out_div,
.tra_in_op_div .root_out_div,
.xfr_in_div .root_out_div{
	width: 100px;
	height: 50px;
	margin-left:300px;
	border: 2px solid #000;
}
.up_div .root_in_div,
.sweet_phase_div .root_in_div,
.tra_in_op_div .root_in_div,
.xfr_in_div .root_in_div{
	width: 90px;
	height: 43px;
	margin-top:2px;
	margin-left:2px;
	border: 2px solid #000;
}
.up_div .root_to_sweet_hor_div,
.up_div .sweet_to_tra_hor_div,
.up_div .tra_to_fre_hor_div,
.up_div .fre_to_comp_hor_div,

.sweet_phase_div .root_to_egg_hor_div,
.sweet_phase_div .egg_to_cre_hor_div,

.tra_in_op_div .root_to_tra_in_hor_div,
.tra_in_op_div .tra_in_to_comp_hor_div,

.xfr_in_div .root_to_xfr_in_hor_div,
.xfr_in_div .xfr_in_to_comp_hor_div{
	width:50px;
	height:2px;
	margin-top: 40px;
	margin-left: 325px;
	background-color: #000;
}
.up_div .root_to_sweet_ver_div,
.up_div .sweet_to_tra_ver_div,
.up_div .tra_to_fre_ver_div,
.up_div .fre_to_comp_ver_div,

.sweet_phase_div .root_to_egg_ver_div,
.sweet_phase_div .egg_to_cre_ver_div,

.tra_in_op_div .root_to_tra_in_ver_div,
.tra_in_op_div .tra_in_to_comp_ver_div,

.xfr_in_div .root_to_xfr_in_ver_div,
.xfr_in_div .xfr_in_to_comp_ver_div{
	width:2px;
	height:100px;
	margin-top: -43px;
	margin-left: 350px;
	background-color: #000;
}
.up_div .t1_text_span,
.up_div .t2_text_span,
.up_div .t3_text_span,
.up_div .t4_text_span,

.sweet_phase_div .t1_text_span,
.sweet_phase_div .t2_text_span,

.tra_in_op_div .t1_text_span,
.tra_in_op_div .t2_text_span,

.xfr_in_div .t1_text_span,
.xfr_in_div .t2_text_span{
	margin-top: -75px;
	margin-left: 300px;
	position: absolute;
}
.up_div .t1_true_text_span,
.up_div .sweet_up1_state_text_span,
.up_div .tra_state_text_span,
.up_div .fre_state_text_span,

.sweet_phase_div .t1_true_text_span,
.sweet_phase_div .t2_true_text_span,

.tra_in_op_div .t1_true_text_span,
.tra_in_op_div .tra_in_state_text_span,

.xfr_in_div .t1_true_text_span,
.xfr_in_div .xfr_in_state_text_span{
	margin-top: -70px;
	margin-left: 377px;
	position: absolute;
}
.up_div .sweet_div,
.xfr_in_div .xfr_in1_div{
	width: 200px;
	height: 45px;
	margin-left:252px;
	text-align:center;
	border: 2px solid #000;
}
.tra_in_op_div .tra_in_op1_div{
	width: 250px;
	height: 45px;
	margin-left:227px;
	text-align:center;
	border: 2px solid #000;
}
.up_div .sweet_to_tra_line1_div,
.up_div .tra_to_fre_line1_div{
	width: 300px;
	height: 2px;
	margin-left: 200px;
	background-color: #000;
}
.up_div .sweet_to_tra_line2_div,
.up_div .tra_to_fre_line2_div{
	width: 300px;
	height: 2px;
	margin-top: 10px;
	margin-left: 200px;
	background-color: #000;
}
.up_div .tra_in_line1_div,
.up_div .tra_in_line2_div{
	width:2px;
	height:20px;
	margin-left: 205px;
	background-color: #000;
}
.up_div .tra_out_line1_div,
.up_div .tra_out_line2_div{
	width:2px;
	height:20px;
	margin-top: -20px;
	margin-left: 493px;
	background-color: #000;
}
.up_div .tra_in_div{
	width: 200px;
	height: 45px;
	margin-left:105px;
	text-align:center;
	border: 2px solid #000;
}
.up_div .tra_out_div{
	width: 200px;
	height: 45px;
	margin-top:-49px;
	margin-left:388px;
	text-align:center;
	border: 2px solid #000;
}
.up_div .fre_div{
	width: 250px;
	height: 45px;
	margin-left:227px;
	text-align:center;
	border: 2px solid #000;
}
.sweet_phase_div .root_to_egg_line1_div{
	width: 600px;
	height: 2px;
	margin-left: 340px;
	background-color: #000;
}
.sweet_phase_div .root_to_egg_line2_div{
	width: 600px;
	height: 2px;
	margin-top: 5px;
	margin-left: 340px;
	background-color: #000;
}
.sweet_phase_div .egg_bef_ver_div,
.sweet_phase_div .egg_aft_ver_div{
	width:2px;
	height:20px;
	margin-left: 350px;
	background-color: #000;
}
.sweet_phase_div .sugar_bef_ver_div,
.sweet_phase_div .sugar_aft_ver_div{
	width:2px;
	height:20px;
	margin-top: -20px;
	margin-left: 600px;
	background-color: #000;
}
.sweet_phase_div .agi_bef_ver_div{
	width:2px;
	height:20px;
	margin-top: -20px;
	margin-left: 850px;
	background-color: #000;
}
.sweet_phase_div .egg_div{
	width: 150px;
	height: 45px;
	margin-left:277px;
	text-align:center;
	border: 2px solid #000;
}
.sweet_phase_div .sugar_div{
	width: 150px;
	height: 45px;
	margin-top:-49px;
	margin-left:520px;
	text-align:center;
	border: 2px solid #000;
}
.sweet_phase_div .agi_div{
	width: 150px;
	height: 45px;
	margin-top:-49px;
	margin-left:773px;
	text-align:center;
	border: 2px solid #000;
}
.sweet_phase_div .egg_to_comp_line1_div{
	width: 273px;
	height: 2px;
	margin-left: 340px;
	background-color: #000;
}
.sweet_phase_div .egg_to_comp_line2_div{
	width: 273px;
	height: 2px;
	margin-top: 5px;
	margin-left: 340px;
	background-color: #000;
}
.sweet_phase_div .agi_aft_ver_div{
	width:2px;
	height:200px;
	margin-top: -20px;
	margin-left: 850px;
	background-color: #000;
}
</style>
</head>
<body>
<div class="up_div">
	<div class="tit_div">UP流程图</div>
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
			CLS_TRANSFER_OUT_UP:1
		</div>
		<div class="unitName_div">
			WP_MIXER1
		</div>
	</div>
	<div class="tra_in_line2_div"></div>
	<div class="tra_out_line2_div"></div>
	<div class="tra_to_fre_line1_div"></div>
	<div class="tra_to_fre_line2_div"></div>
	<div class="tra_to_fre_hor_div"></div>
	<div class="tra_to_fre_ver_div"></div>
	<span class="t3_text_span">T3</span>
	<span class="tra_state_text_span">CLS_TRANSFER_IN_UP:1.STATE=COMPLETE AND CLS_TRANSFER_OUT_UP:1.STATE=COMPLETE</span>
	<div class="fre_div">
		<div class="name_div">
			CLS_FRENCHVANILLA_UP:1
		</div>
		<div class="unitName_div">
			WP_FREEZER1
		</div>
	</div>
	<div class="fre_to_comp_hor_div"></div>
	<div class="fre_to_comp_ver_div"></div>
	<span class="t4_text_span">T4</span>
	<span class="fre_state_text_span">CLS_FRENCHVANILLA_UP:1.STATE=COMPLETE</span>
</div>

<div class="sweet_phase_div">
	<div class="tit_div">sweet phase流程图</div>
	<div class="root_out_div">
		<div class="root_in_div">
		</div>
	</div>
	<div class="root_to_egg_hor_div"></div>
	<div class="root_to_egg_ver_div"></div>
	<span class="t1_text_span">T1</span>
	<span class="t1_true_text_span">True</span>
	<div class="root_to_egg_line1_div"></div>
	<div class="root_to_egg_line2_div"></div>
	<div class="egg_bef_ver_div"></div>
	<div class="sugar_bef_ver_div"></div>
	<div class="agi_bef_ver_div"></div>
	<div class="egg_div">
		<div class="name_div">
			ADD_EGG:1
		</div>
		<div class="amount_div">
			200 KG
		</div>
	</div>
	<div class="sugar_div">
		<div class="name_div">
			ADD_SUGAR:1
		</div>
		<div class="amount_div">
			750 KG
		</div>
	</div>
	<div class="agi_div">
		<div class="name_div">
			ADD_AGITATE:1
		</div>
		<div class="amount_div">
			25 RPM
		</div>
	</div>
	<div class="egg_aft_ver_div"></div>
	<div class="sugar_aft_ver_div"></div>
	<div class="egg_to_comp_line1_div"></div>
	<div class="egg_to_comp_line2_div"></div>
	<div class="egg_to_cre_hor_div"></div>
	<div class="egg_to_cre_ver_div"></div>
	
	<span class="t2_text_span">T2</span>
	<span class="t2_true_text_span">True</span>
	
	<div class="agi_aft_ver_div"></div>
	
</div>

<div class="tra_in_op_div">
	<div class="tit_div">CLS_TRANSFER_IN_OP:1流程图</div>
	<div class="root_out_div">
		<div class="root_in_div">
		</div>
	</div>
	<div class="root_to_tra_in_hor_div"></div>
	<div class="root_to_tra_in_ver_div"></div>
	<span class="t1_text_span">T1</span>
	<span class="t1_true_text_span">True</span>
	<div class="tra_in_op1_div">
		<div class="name_div">
			CLS_TRANSFER_IN_OP:1
		</div>
	</div>
	<div class="tra_in_to_comp_hor_div"></div>
	<div class="tra_in_to_comp_ver_div"></div>
	<span class="t2_text_span">T2</span>
	<span class="tra_in_state_text_span">CLS_TRANSFER_IN_OP:1.STATE=COMPLETE</span>
</div>

<div class="xfr_in_div">
	<div class="tit_div">XFR_IN流程图</div>
	<div class="root_out_div">
		<div class="root_in_div">
		</div>
	</div>
	<div class="root_to_xfr_in_hor_div"></div>
	<div class="root_to_xfr_in_ver_div"></div>
	<span class="t1_text_span">T1</span>
	<span class="t1_true_text_span">True</span>
	<div class="xfr_in1_div">
		<div class="name_div">
			XFR_IN:1
		</div>
	</div>
	<div class="xfr_in_to_comp_hor_div"></div>
	<div class="xfr_in_to_comp_ver_div"></div>
	<span class="t2_text_span">T2</span>
	<span class="xfr_in_state_text_span">XFR_IN:1.STATE=COMPLETE</span>
</div>
</body>
</html>