package com.elitecore.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="scheduler")
public class scheduler {
@Id
@GeneratedValue
@Column(name="id")
private int id;

@Column(name="job_name")
private String job_name;
@Column(name="report_id")
private int report_id;
@Column(name="start_time")
private String start_time;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getJob_name() {
	return job_name;
}
public void setJob_name(String job_name) {
	this.job_name = job_name;
}
public int getReport_id() {
	return report_id;
}
public void setReport_id(int report_id) {
	this.report_id = report_id;
}
public String getStart_time() {
	return start_time;
}
public void setStart_time(String start_time) {
	this.start_time = start_time;
}


}
