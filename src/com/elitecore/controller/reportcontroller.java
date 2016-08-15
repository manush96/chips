package com.elitecore.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.elitecore.dto.DBMasterDto;
import com.elitecore.model.DBMaster;
import com.elitecore.model.Report;
import com.elitecore.services.Reportservices;

@Controller

public class reportcontroller {
@Autowired
Reportservices services;
@RequestMapping(value = "/viewreport.html*")
public ModelAndView getPage(@RequestParam(value = "page", required = false) int page, HttpSession session) {
	session.setAttribute("page_id", page);
	int total = 5;
	if (page == 1) {
	} else {
		page = (page - 1) * total + 1;
	}

	int result = 1;
	int no;
	if (result % 5 == 0)
		no = (result / 5);
	else
		no = (result / 5) + 1;

	List<Report> list = services.getreportbypage(page, total);
	ModelAndView model = new ModelAndView();
	model.addObject("list", list);
	model.addObject("count", no);
	model.setViewName("repview");
	return model;
}

}
