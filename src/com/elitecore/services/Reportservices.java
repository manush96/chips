package com.elitecore.services;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.elitecore.dao.ReportDao;
import com.elitecore.model.DBMaster;
import com.elitecore.model.Query;
import com.elitecore.model.Report;
@Service("Reportservices")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)

public class Reportservices {
@Autowired
ReportDao dao;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public List<Report> getreportbypage(int page, int total) 
	{
		return dao.getReportByPage(page, total);
	}
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)	
	public void addrep(Report rp) 
	{  
		System.out.println("in service,before invoking add report function");
		dao.saveReport(rp);
		System.out.println("in service, after invoking add report function");
	}
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void multidelete(String ids) 
	{		
		dao.multideleterep(ids);
	}
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void Dltrep(int id) 
	{
		dao.dltReport(id);
	}
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public List<Map<String,Object>> caller(int sql,String disp_name)
	{
		return dao.runner(sql,disp_name);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public List<Map<String,Object>> caller1(String qu,String disp_name)
	{
		return dao.runner1(qu,disp_name);
	}
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public List<Query> getbyid(int id)
	{
		return dao.getbyid(id);
	}
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public int getparam(int x)
	{
		return dao.getparams(x);
	}
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public List<Report> getbykeyword(String keyword,int pageid, int total) {
		
		return dao.getReportBykeyword(keyword, pageid, total);
	}
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public int getcount(String key) {

		int result=dao.getcount(key);
		return result;
	}

}
