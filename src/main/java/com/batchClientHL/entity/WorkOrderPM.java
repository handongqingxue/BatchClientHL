package com.batchClientHL.entity;

public class WorkOrderPM {

	private Integer ID;
	public Integer getID() {
		return ID;
	}
	public void setID(Integer iD) {
		ID = iD;
	}
	public String getPMCode() {
		return PMCode;
	}
	public void setPMCode(String pMCode) {
		PMCode = pMCode;
	}
	public String getPMName() {
		return PMName;
	}
	public void setPMName(String pMName) {
		PMName = pMName;
	}
	public String getLot() {
		return Lot;
	}
	public void setLot(String lot) {
		Lot = lot;
	}
	public Float getDosage() {
		return Dosage;
	}
	public void setDosage(Float dosage) {
		Dosage = dosage;
	}
	public String getUnit() {
		return Unit;
	}
	public void setUnit(String unit) {
		Unit = unit;
	}
	public String getHLimit() {
		return HLimit;
	}
	public void setHLimit(String hLimit) {
		HLimit = hLimit;
	}
	public String getLLimit() {
		return LLimit;
	}
	public void setLLimit(String lLimit) {
		LLimit = lLimit;
	}
	public Integer getPMType() {
		return PMType;
	}
	public void setPMType(Integer pMType) {
		PMType = pMType;
	}
	public String getWorkOrderID() {
		return WorkOrderID;
	}
	public void setWorkOrderID(String workOrderID) {
		WorkOrderID = workOrderID;
	}
	public String getCName() {
		return CName;
	}
	public void setCName(String cName) {
		CName = cName;
	}
	public String getHH() {
		return HH;
	}
	public void setHH(String hH) {
		HH = hH;
	}
	public String getLL() {
		return LL;
	}
	public void setLL(String lL) {
		LL = lL;
	}
	public String getCNameMes() {
		return CNameMes;
	}
	public void setCNameMes(String cNameMes) {
		CNameMes = cNameMes;
	}
	private String PMCode;
	private String PMName;
	private String Lot;
	private Float Dosage;
	private String Unit;
  	private String HLimit;
  	private String LLimit;
	private Integer PMType;
	private String WorkOrderID;
	private String CName;
	private String HH;
	private String LL;
	private String CNameMes;
}
