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
	private String PMCode;
	private String PMName;
	private String Lot;
	private Float Dosage;
	private String Unit;
	private Integer PMType;
	private String WorkOrderID;
	private String CName;
}
