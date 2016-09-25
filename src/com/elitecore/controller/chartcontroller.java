package com.elitecore.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.elitecore.dto.DBMasterDto;
import com.elitecore.dto.userdto;
import com.elitecore.services.chartservices;

@Controller
public class chartcontroller {

	@Autowired
	chartservices services;

	@RequestMapping(value = "/view_graph.html*")
	public ModelAndView setsession(@RequestParam("x") String x,@RequestParam("y") String y,@RequestParam("graph_type") String graph)
	{
		ModelAndView model = new ModelAndView();
		model.addObject("x", x);
		model.addObject("y", y);
		model.addObject("graph_type",graph);
		model.setViewName("chart");
		return model;
	}
}
