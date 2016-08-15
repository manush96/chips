package com.elitecore.model;


import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.*;
import com.elitecore.services.crypt;

@SuppressWarnings("unused")
@Entity
@Table(name = "user")
public class User {

	@Id
	@GeneratedValue
	@Column(name = "id")
	private Long Id;

	public String getPhone_no() {
		return phone_no;
	}

	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}

	public User() {
	}

	@Column(name = "username", nullable =true, length=20)
	private String userName;

	@Column(name = "password", nullable = true, length=20)
	private String password;

	public Long getId() {
		return Id;
	}

	public void setId(Long id) {
		Id = id;
	}

	public String getUserName() {
		return userName;
	}
	@Column(name="role")
	public int role;
	@Column(name="date_created")
	public Date date_created;
	public void setUserName(String userName) {
		this.userName = userName;
	}
@Column(name="phone_no")
public String phone_no;
	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}
	public Date getDate_created() {
		return date_created;
	}

	public void setDate_created(Date date_created) {
		this.date_created = date_created;
	}

	public String getPassword() throws Exception {
		
		
			return password;
		
	}

	public void setPassword(String password) {
		String passwordToHash = password;
        try {
			String generatedPassword = crypt.encrypt(passwordToHash);

	        this.password = generatedPassword;
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        		
	}



}