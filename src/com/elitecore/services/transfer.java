package com.elitecore.services;

import java.util.ArrayList;
import java.util.List;

import com.elitecore.dto.DBMasterDto;
import com.elitecore.dto.Reportdto;
import com.elitecore.dto.querydto;
import com.elitecore.dto.userdto;
import com.elitecore.model.DBMaster;
import com.elitecore.model.Query;
import com.elitecore.model.Report;
import com.elitecore.model.User;
import com.elitecore.model.queryin;

public class transfer {
public static User trans(userdto u)
{
	User user1=new User();
	user1.setUserName(u.getUsername());
	user1.setPassword(u.getPassword());
	user1.setPhone_no(u.getPhone_no());
	return user1;
}
public static Query querytrans(querydto q)
{

    Query query=new Query();
	query.setName(q.getName());
	query.setDescription(q.getDescription());
	query.setQuery(q.getQuery());
	query.setStatus(q.getStatus());
	return query;
	
}
public static List<queryin> queryintrans(querydto q3)
{
	List<queryin> q1=new ArrayList<queryin>();

	int i=q3.getStatus();
	String[] s1=q3.getParam_name();
	String[] s2=q3.getParam_type();
	System.out.println("Status: " + i);
	for(int j=0;j<i;j++)
	{
		System.out.println("halellujah");
		queryin q2=new queryin();
		q2.setParam_name(s1[j]);
		q2.setParam_type(s2[j]);
		q1.add(q2);
		System.out.println("s1[j]" + s1[j]);
		System.out.println("s2[j]" + s2[j]);
	}
	return q1;
}

public static DBMaster DBtrans(DBMasterDto dto)
{
	DBMaster d=new DBMaster();
	d.setId(dto.getId());
	d.setName(dto.getName());
	d.setDescription(dto.getDescription());
	d.setUsername(dto.getUsername());
	d.setPassword(dto.getPassword());
	d.setMin_pool_size(dto.getMin_pool_size());
	d.setMax_pool_size(dto.getMax_pool_size());
	return d;
}

public static Report Report_trans(Reportdto rd)
{
	Report r=new Report();
	r.setDb_id(rd.getDb_id());
	r.setDisplay_name(rd.getDisplay_name());
	r.setQuery_id(rd.getQuery_id());
	r.setId(rd.getId());
	r.setReport_name(rd.getReport_name());
	return r;
	
}
}
