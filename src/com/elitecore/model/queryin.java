package com.elitecore.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="queryin")

public class queryin {
@Id
@GeneratedValue
@Column(name = "id")
private int id;

@Column(name="query_id")
private int query_id;
@Column(name="param_name")
private String param_name;
@Column(name="param_type")
private String param_type;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getQuery_id() {
	return query_id;
}
public void setQuery_id(int query_id) {
	
	this.query_id = query_id;
}
public String getParam_name() {
	return param_name;
}
public void setParam_name(String param_name) {
	this.param_name = param_name;
}
public String getParam_type() {
	return param_type;
}
public void setParam_type(String param_type) {
	this.param_type = param_type;
}

}
