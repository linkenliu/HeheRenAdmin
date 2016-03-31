package com.heheren.model;

import java.util.Date;

public class Dictionarie {
	private int id;
	private String name;
	private String nameNode;
	private int secondaryId;
	private String secondaryName;
	private String secondaryNameNode;
	private Date createDate;
	private Date updateDate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNameNode() {
		return nameNode;
	}
	public void setNameNode(String nameNode) {
		this.nameNode = nameNode;
	}
	public int getSecondaryId() {
		return secondaryId;
	}
	public void setSecondaryId(int secondaryId) {
		this.secondaryId = secondaryId;
	}
	public String getSecondaryName() {
		return secondaryName;
	}
	public void setSecondaryName(String secondaryName) {
		this.secondaryName = secondaryName;
	}
	public String getSecondaryNameNode() {
		return secondaryNameNode;
	}
	public void setSecondaryNameNode(String secondaryNameNode) {
		this.secondaryNameNode = secondaryNameNode;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	
}
