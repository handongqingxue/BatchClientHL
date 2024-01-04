package com.batchClientHL.entity;

public class WorkOrder {

	private Integer ID;
	public Integer getID() {
		return ID;
	}
	public void setID(Integer iD) {
		ID = iD;
	}
	public String getWorkOrderID() {
		return WorkOrderID;
	}
	public void setWorkOrderID(String workOrderID) {
		WorkOrderID = workOrderID;
	}
	public String getProductCode() {
		return ProductCode;
	}
	public void setProductCode(String productCode) {
		ProductCode = productCode;
	}
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
	public Float getTotalOutput() {
		return TotalOutput;
	}
	public void setTotalOutput(Float totalOutput) {
		TotalOutput = totalOutput;
	}
	public String getRecipeID() {
		return RecipeID;
	}
	public void setRecipeID(String recipeID) {
		RecipeID = recipeID;
	}
	public String getFormulaId() {
		return FormulaId;
	}
	public void setFormulaId(String formulaId) {
		FormulaId = formulaId;
	}
	public Integer getState() {
		return State;
	}
	public void setState(Integer state) {
		State = state;
	}
	public String getCreateTime() {
		return CreateTime;
	}
	public void setCreateTime(String createTime) {
		CreateTime = createTime;
	}
	public String getUnitID() {
		return UnitID;
	}
	public void setUnitID(String unitID) {
		UnitID = unitID;
	}
	public String getZGID() {
		return ZGID;
	}
	public void setZGID(String zGID) {
		ZGID = zGID;
	}
	public String getLotNo() {
		return LotNo;
	}
	public void setLotNo(String lotNo) {
		LotNo = lotNo;
	}
	public String getWorkcenterId() {
		return WorkcenterId;
	}
	public void setWorkcenterId(String workcenterId) {
		WorkcenterId = workcenterId;
	}
	public String getIdentifier() {
		return Identifier;
	}
	public void setIdentifier(String identifier) {
		Identifier = identifier;
	}
	public String getUpdateUser() {
		return UpdateUser;
	}
	public void setUpdateUser(String updateUser) {
		UpdateUser = updateUser;
	}
	private String WorkOrderID;
	private String ProductCode;
	private String ProductName;
	private Float TotalOutput;
	private String RecipeID;
	private String FormulaId;
	private Integer State;
	private String CreateTime;
	private String UnitID;
	private String ZGID;
	private String LotNo;
	private String WorkcenterId;
	private String Identifier;
	private String UpdateUser;
}
