package com.jscn.yangkai.entity;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class TravelReimberse {
	private int id;
	private String username;
	private String name;
	private Timestamp createtime;
	private Timestamp lastmodifytime;
	private String lastmodifyusername;
	private String travelreason;
	private String startdate;
	private String enddate;
	private String startplace;
	private String endplace;
	private String leavevehicle;
	private BigDecimal leavevehiclecost;
	private String returnvehicle;
	private BigDecimal returnvehiclecost;
	private String accommodationtype;
	private BigDecimal accommodationcost;
	private String accommodationremark;
	private String subsidytype;
	private BigDecimal subsidyperday;
	private int subsidydays;
	private BigDecimal subsidysum;
	private String othercontent;
	private BigDecimal othercost;
	private BigDecimal sum;
	private String state;
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}
	public Timestamp getLastmodifytime() {
		return lastmodifytime;
	}
	public void setLastmodifytime(Timestamp lastmodifytime) {
		this.lastmodifytime = lastmodifytime;
	}
	public String getLastmodifyusername() {
		return lastmodifyusername;
	}
	public void setLastmodifyusername(String lastmodifyusername) {
		this.lastmodifyusername = lastmodifyusername;
	}
	public String getTravelreason() {
		return travelreason;
	}
	public void setTravelreason(String travelreason) {
		this.travelreason = travelreason;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getStartplace() {
		return startplace;
	}
	public void setStartplace(String startplace) {
		this.startplace = startplace;
	}
	public String getEndplace() {
		return endplace;
	}
	public void setEndplace(String endplace) {
		this.endplace = endplace;
	}
	public String getLeavevehicle() {
		return leavevehicle;
	}
	public void setLeavevehicle(String leavevehicle) {
		this.leavevehicle = leavevehicle;
	}
	public BigDecimal getLeavevehiclecost() {
		return leavevehiclecost;
	}
	public void setLeavevehiclecost(BigDecimal leavevehiclecost) {
		this.leavevehiclecost = leavevehiclecost;
	}
	public String getReturnvehicle() {
		return returnvehicle;
	}
	public void setReturnvehicle(String returnvehicle) {
		this.returnvehicle = returnvehicle;
	}
	public BigDecimal getReturnvehiclecost() {
		return returnvehiclecost;
	}
	public void setReturnvehiclecost(BigDecimal returnvehiclecost) {
		this.returnvehiclecost = returnvehiclecost;
	}
	public String getAccommodationtype() {
		return accommodationtype;
	}
	public void setAccommodationtype(String accommodationtype) {
		this.accommodationtype = accommodationtype;
	}
	public BigDecimal getAccommodationcost() {
		return accommodationcost;
	}
	public void setAccommodationcost(BigDecimal accommodationcost) {
		this.accommodationcost = accommodationcost;
	}
	public String getAccommodationremark() {
		return accommodationremark;
	}
	public void setAccommodationremark(String accommodationremark) {
		this.accommodationremark = accommodationremark;
	}
	public String getSubsidytype() {
		return subsidytype;
	}
	public void setSubsidytype(String subsidytype) {
		this.subsidytype = subsidytype;
	}
	public BigDecimal getSubsidyperday() {
		return subsidyperday;
	}
	public void setSubsidyperday(BigDecimal subsidyperday) {
		this.subsidyperday = subsidyperday;
	}
	public int getSubsidydays() {
		return subsidydays;
	}
	public void setSubsidydays(int subsidydays) {
		this.subsidydays = subsidydays;
	}
	public BigDecimal getSubsidysum() {
		return subsidysum;
	}
	public void setSubsidysum(BigDecimal subsidysum) {
		this.subsidysum = subsidysum;
	}
	public String getOthercontent() {
		return othercontent;
	}
	public void setOthercontent(String othercontent) {
		this.othercontent = othercontent;
	}
	public BigDecimal getOthercost() {
		return othercost;
	}
	public void setOthercost(BigDecimal othercost) {
		this.othercost = othercost;
	}
	public BigDecimal getSum() {
		return sum;
	}
	public void setSum(BigDecimal sum) {
		this.sum = sum;
	}
	
}
