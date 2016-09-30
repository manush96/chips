package com.elitecore.dto;

import java.util.Date;

public class Schedulerdto {

	
	private int id;
	
	private String job_name;
	
	private int report_id;
	
	private String start_time;
	
	private String email_id;
	
	private int freq_hour;
	
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

	public String getEmail_id() {
		return email_id;
	}

	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}

	public int getFreq_hour() {
		return freq_hour;
	}

	public void setFreq_hour(int freq_hour) {
		this.freq_hour = freq_hour;
	}
	
}
