package com.batchClientHL.entity;

public class ProcedureData {

	private Integer ID;
	public Integer getID() {
		return ID;
	}
	public void setID(Integer iD) {
		ID = iD;
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
	public Integer getRawXCord() {
		return rawXCord;
	}
	public void setRawXCord(Integer rawXCord) {
		this.rawXCord = rawXCord;
	}
	public Integer getRawYCord() {
		return rawYCord;
	}
	public void setRawYCord(Integer rawYCord) {
		this.rawYCord = rawYCord;
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
	private String RecpID;
	private String RecpName;
	private Integer BoundUnitID;
	private String ElemID;
	private String ElemName;
	private Integer ElemType;
	private String RecipeLink;
	private Integer rawXCord;
	private Integer rawYCord;
	private String ParmList;
	private String ConditionExp;
	private String PrevElemID;
	private String NextElemID;
	private String PrevElemIDList;
	private String NextElemIDList;
	private String Remark;
}
