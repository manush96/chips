package com.elitecore.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.elitecore.dto.DBMasterDto;
import com.elitecore.dto.Reportdto;
import com.elitecore.model.DBMaster;
import com.elitecore.model.Query;
import com.elitecore.services.DBservices;
import com.elitecore.services.queryservices;

@Controller
public class dbcontroller {

	@Autowired
	DBservices services;

	@Autowired
	queryservices services1;

	@RequestMapping(value="/viewdb.html*")
	public ModelAndView getPage(
	@RequestParam(value="page", required=false) int page, HttpSession session)
	{
		session.setAttribute("page_id",page);
		int total=5;
		if(page==1){}
		else
		{
			page=(page-1)*total+1;
		}

		int result=1;
		int no;
		if(result%5 == 0)
			no = (result/5);
		else
			no = (result/5)+1;
		
		List<DBMaster> list=services.getbypage(page, total);
		ModelAndView model=new ModelAndView();
		model.addObject("DBMasterDto",new DBMasterDto());
		model.addObject("list",list);
		model.addObject("count", no);
		model.setViewName("dbview");
		return model;	
	}

	@RequestMapping(value = "reportconfig.html")
	public ModelAndView reportconfig() {
		ModelAndView model = new ModelAndView();
		List<Query> list = new ArrayList();
		list = services1.queryname();
		model.addObject("Reportdto", new Reportdto());
		System.out.println(list.size());
		model.addObject("list", list);
		model.setViewName("report_conf");
		return model;
	}

}
