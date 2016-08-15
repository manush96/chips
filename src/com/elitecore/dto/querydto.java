package com.elitecore.dto;

public class querydto {
public int id;
private String name;
private String description;
private String query;
private int status;
private String[] param_type;
private String[] param_name;
public String getName() {
	return name;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public void setName(String name) {
	this.name = name;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getQuery() {
	return query;
}
public void setQuery(String query) {
	this.query = query;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
public String[] getParam_type() {
	return param_type;
}
public void setParam_type(String[] param_type) {
	this.param_type = param_type;
}
public String[] getParam_name() {
	return param_name;
}
public void setParam_name(String[] param_name) {
	this.param_name = param_name;
}



}
