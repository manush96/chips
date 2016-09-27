package com.elitecore.dto;

import java.util.Date;

public class Schedulerdto {

	
	private int id;
	
	private String job_name;
	
	private int report_id;
	
	private Date start_time;

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

	public Date getStart_time() {
		return start_time;
	}

	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}
	
	
}
