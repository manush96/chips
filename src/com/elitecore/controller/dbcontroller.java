package com.elitecore.controller;

import java.util.ArrayList;
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
import com.elitecore.dto.querydto;
import com.elitecore.model.DBMaster;
import com.elitecore.model.Query;
import com.elitecore.model.queryin;
import com.elitecore.services.DBservices;
import com.elitecore.services.queryservices;
import com.elitecore.services.transfer;

@Controller
public class dbcontroller {

	@Autowired
	DBservices services;

	@Autowired
	queryservices services1;

	@RequestMapping(value = "/viewdb.html*")
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

		List<DBMaster> list = services.getbypage(page, total);
		ModelAndView model = new ModelAndView();
		model.addObject("DBMasterDto", new DBMasterDto());
		model.addObject("list", list);
		model.addObject("count", no);
		model.setViewName("dbview");
		return model;
	}
	@RequestMapping(value = "reportconfig.html")
	public ModelAndView reportconfig() {
		ModelAndView model = new ModelAndView();
		List<Query> list = new ArrayList();
		list = services1.queryname();
		List<Query> list1 = new ArrayList();
		list1 = services.dbname();
		model.addObject("Reportdto", new Reportdto());
		System.out.println(list.size());
		model.addObject("list", list);
		model.addObject("list1", list1);
		model.setViewName("report_conf");
		return model;
	}
	@RequestMapping(value = "/adddb.html*", method = RequestMethod.POST)
	public String getFilter(@ModelAttribute DBMasterDto db,
			@RequestParam(value = "page", required = false) int pageid) {

		DBMaster dbm = transfer.DBtrans(db);

		try {
			services.addDB(dbm);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:profile.html";

	}

	@RequestMapping(value = "/multideletedb.html", method = RequestMethod.POST)
	public String multidelete(@RequestParam("ids") String ids) {
		services.multidelete(ids);
		return "success";
	}

	@RequestMapping(value = "/EditDb.html")
	public String Editquery(@ModelAttribute DBMaster dbm) {
		services.UpdateDB(dbm);

		return "redirect:profile.html"; // return new
										// ModelAndView("pagination","list",new
										// list());
	}

	@RequestMapping(value = "/SingleDeleteDb.html", method = RequestMethod.POST)
	public ModelAndView Editquery(@RequestParam("id") int id) {
		services.DltDb(id);
		return new ModelAndView("grid", "DBMaster", new DBMaster());
	}

}
