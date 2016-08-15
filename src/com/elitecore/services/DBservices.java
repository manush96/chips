package com.elitecore.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.elitecore.dao.DBMasterDao;

import com.elitecore.model.DBMaster;
@Service("DBservices")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)

public class DBservices {

	@Autowired
	DBMasterDao dao;
	public DBservices() {
	}
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addDB(DBMaster dbm) throws Exception {
	dao.saveDB(dbm);
	}

	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public List<DBMaster> getbypage(int pageid,int total)
	{
		System.out.println("before invoking daofunction");
		return dao.getDBByPage(pageid, total);
		//System.out.println("after invoking daofunction");
	}
		
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void UpdateDB(DBMaster dbm) {
		int result= dao.editDB(dbm);
	}
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void Dltquery(int id) {

		int result= dao.dltDB(id);
		
	}
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public int getcount() {
		int result=dao.getcount();
		return result;
	}

	

}
