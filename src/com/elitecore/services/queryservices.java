package com.elitecore.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.elitecore.dao.querydao;
import com.elitecore.model.Query;
import com.elitecore.model.queryin;
@Service("queryservices")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)

public class queryservices {
//	private querydao querydao;

	@Autowired
	querydao dao;
	public queryservices() {
	}
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addQuery(Query query) throws Exception {
	dao.saveQuery(query);
	}
	
	public List<Query> getbypage(int pageid,int total)
	{
		return dao.getqueryByPage(pageid, total);
	}
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public List<Query> queryname()
	{
		return dao.getbyname();
	}
	
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public List<Query> getbykeyword(String keyword,int pageid, int total) {
		
		return dao.getqueryByPage(keyword, pageid, total);
	}
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void Updatequery(Query query) {
		int result= dao.editUser(query);
	}
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void Dltquery(int id) {

		int result= dao.dltQuery(id);
		
	}
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void multidelete(String ids) {
		int resullt=dao.multidelete(ids);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public int getcount(String key) {

		int result=dao.getcount(key);
		return result;
	}
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void queryparam(List<queryin> list)
	{
		System.out.println("break3");
		dao.addparamquery(list);
	}
	
}

