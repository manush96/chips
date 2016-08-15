package com.elitecore.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.elitecore.dao.ReportDao;
import com.elitecore.model.DBMaster;
import com.elitecore.model.Report;
@Service("Reportservices")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)

public class Reportservices {
@Autowired
ReportDao dao;
	public List<Report> getreportbypage(int page, int total) {
		// TODO Auto-generated method stub
		return dao.getReportByPage(page, total);
	}

}
