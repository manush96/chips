package com.elitecore.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="DB_Master")
public class DBMaster {
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	@Column(name="name")
	private String name;
	@Column(name="description")
	private String description;
	@Column(name="username")
	private String username;
	@Column(name="password")
	private String password;
	@Column(name="url")
	private String url;
	@Column(name="max_pool_size")
	private String max_pool_size;
	@Column(name="min_pool_size")
	private String min_pool_size;
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String i) {
		this.password = i;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getMax_pool_size() {
		return max_pool_size;
	}
	public void setMax_pool_size(String max_pool_size) {
		this.max_pool_size = max_pool_size;
	}
	public String getMin_pool_size() {
		return min_pool_size;
	}
	public void setMin_pool_size(String i) {
		this.min_pool_size = i;
	}
	
	
	
}
