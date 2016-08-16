package com.elitecore.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.elitecore.dto.DBMasterDto;
import com.elitecore.dto.Reportdto;
import com.elitecore.model.DBMaster;
import com.elitecore.model.Report;
import com.elitecore.services.Reportservices;
import com.elitecore.services.transfer;

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
	
	@RequestMapping(value = "/addrep.html*", method = RequestMethod.POST)
	public String getFilter(@ModelAttribute Reportdto rdt,
			@RequestParam(value = "page", required = false) int pageid) {

		Report rp = transfer.Report_trans(rdt);

		try 
		{
			System.out.println("in the controller, before invoking services function");
			services.addrep(rp);
			System.out.println("in the controller, after adding report");
		} catch (Exception e)
		{			
			e.printStackTrace();
		}

		return "redirect:profile.html";

	}
	
	@RequestMapping(value = "/multideleterep.html", method = RequestMethod.POST)
	public String multidelete(@RequestParam("ids") String ids) {
		services.multidelete(ids);
		return "success";
	}
	
	@RequestMapping(value = "/SingleDeleterep.html", method = RequestMethod.POST)
	public ModelAndView Editreport(@RequestParam("id") int id) {
		services.Dltrep(id);
		return new ModelAndView("grid", "Report", new Report());
	}

}
