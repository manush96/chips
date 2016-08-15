package com.elitecore.dto;

public class DBMasterDto {
	
	private int id;
	private String name;
	private String description;
	private String Url;
	private String username;
	private String password;
	private String min_pool_size;
	private String max_pool_size;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUrl() {
		return Url;
	}
	public void setUrl(String url) {
		Url = url;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMin_pool_size() {
		return min_pool_size;
	}
	public void setMin_pool_size(String min_pool_size) {
		this.min_pool_size = min_pool_size;
	}
	public String getMax_pool_size() {
		return max_pool_size;
	}
	public void setMax_pool_size(String max_pool_size) {
		this.max_pool_size = max_pool_size;
	}
	
	

}
