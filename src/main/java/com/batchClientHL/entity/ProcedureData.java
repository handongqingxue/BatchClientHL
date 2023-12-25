package com.batchClientHL.entity;

public class ProcedureData {

	public static final int PARENT_STEP=0;
	public static final int INITIAL_STEP=1;
	public static final int TERMINAL_STEP=2;
	public static final int REGULAR_STEP=3;
	public static final int TRANSITION=4;
	public static final int LINK=5;
	public static final int OR_DIVERGENCE=6;
	public static final int OR_CONVERGENCE=7;
	public static final int AND_DIVERGENCE=8;
	public static final int AND_CONVERGENCE=9;
	
	public static final String PARENT_STEP_TEXT="parentStep";
	public static final String INITIAL_STEP_TEXT="initialStep";
	public static final String TERMINAL_STEP_TEXT="terminalStep";
	public static final String REGULAR_STEP_TEXT="regularStep";
	public static final String TRANSITION_TEXT="transition";
	public static final String LINK_TEXT="link";
	public static final String AND_DIVERGENCE_TEXT="andDivergence";
	public static final String AND_CONVERGENCE_TEXT="andConvergence";
	
	private Integer ID;
	public Integer getID() {
		return ID;
	}
	public void setID(Integer iD) {
		ID = iD;
	}
	public String getProcedureID() {
		return ProcedureID;
	}
	public void setProcedureID(String procedureID) {
		ProcedureID = procedureID;
	}
	public String getRecpID() {
		return RecpID;
	}
	public void setRecpID(String recpID) {
		RecpID = recpID;
	}
	public String getRecpName() {
		return RecpName;
	}
	public void setRecpName(String recpName) {
		RecpName = recpName;
	}
	public Integer getBoundUnitID() {
		return BoundUnitID;
	}
	public void setBoundUnitID(Integer boundUnitID) {
		BoundUnitID = boundUnitID;
	}
	public String getElemID() {
		return ElemID;
	}
	public void setElemID(String elemID) {
		ElemID = elemID;
	}
	public String getElemName() {
		return ElemName;
	}
	public void setElemName(String elemName) {
		ElemName = elemName;
	}
	public Integer getElemType() {
		return ElemType;
	}
	public void setElemType(Integer elemType) {
		ElemType = elemType;
	}
	public String getRecipeLink() {
		return RecipeLink;
	}
	public void setRecipeLink(String recipeLink) {
		RecipeLink = recipeLink;
	}
	public Integer getDrawXCord() {
		return drawXCord;
	}
	public void setDrawXCord(Integer drawXCord) {
		this.drawXCord = drawXCord;
	}
	public Integer getDrawYCord() {
		return drawYCord;
	}
	public void setDrawYCord(Integer drawYCord) {
		this.drawYCord = drawYCord;
	}
	public String getParmList() {
		return ParmList;
	}
	public void setParmList(String parmList) {
		ParmList = parmList;
	}
	public String getConditionExp() {
		return ConditionExp;
	}
	public void setConditionExp(String conditionExp) {
		ConditionExp = conditionExp;
	}
	public String getPrevElemID() {
		return PrevElemID;
	}
	public void setPrevElemID(String prevElemID) {
		PrevElemID = prevElemID;
	}
	public String getNextElemID() {
		return NextElemID;
	}
	public void setNextElemID(String nextElemID) {
		NextElemID = nextElemID;
	}
	public String getPrevElemIDList() {
		return PrevElemIDList;
	}
	public void setPrevElemIDList(String prevElemIDList) {
		PrevElemIDList = prevElemIDList;
	}
	public String getNextElemIDList() {
		return NextElemIDList;
	}
	public void setNextElemIDList(String nextElemIDList) {
		NextElemIDList = nextElemIDList;
	}
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}
	private String ProcedureID;
	private String RecpID;
	private String RecpName;
	private Integer BoundUnitID;
	private String ElemID;
	private String ElemName;
	private Integer ElemType;
	private String RecipeLink;
	private Integer drawXCord;
	private Integer drawYCord;
	private String ParmList;
	private String ConditionExp;
	private String PrevElemID;
	private String NextElemID;
	private String PrevElemIDList;
	private String NextElemIDList;
	private String Remark;
}
