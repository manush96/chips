package com.elitecore.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import com.elitecore.model.Report;
import com.elitecore.services.DBservices;
import com.elitecore.services.Reportservices;
import com.elitecore.services.querycount;
import com.elitecore.services.queryservices;
import com.elitecore.services.transfer;

@Controller

public class reportcontroller {
	@Autowired
	Reportservices services;
	
	@Autowired
	queryservices services1;

	@Autowired
	DBservices services2;

	@RequestMapping(value = "reportconfig.html")
	public ModelAndView reportconfig() {
		ModelAndView model = new ModelAndView();
		List<Query> list = new ArrayList();
		List<Query> list1 = new ArrayList();
		
		list = services1.queryname();		
		list1 = services2.dbname();		
		
		System.out.println(list.size()+"is the size of the list");
		
		model.addObject("Reportdto", new Reportdto());
		model.addObject("list", list);
		model.addObject("list1", list1);
		model.setViewName("report_conf");
		
		return model;
	}
	
	
	@RequestMapping(value="/viewreport.html*")
	public ModelAndView getPage(
	@RequestParam(value="page", required=false) int pageid, @RequestParam(value="key", required=false, defaultValue="") String key, HttpSession session)
	{
		session.setAttribute("page_id",pageid);
		
		int total=5;
		if(pageid==1){}
		else
		{
			pageid=(pageid-1)*total+1;
		}
		
		List<Report> list=services.getbykeyword(key, pageid, total);
		
		int result = services.getcount(key);
		int no;
		if(result%5 == 0)
			no = (result/5);
		else
			no = (result/5)+1;
		
		ModelAndView model=new ModelAndView();
		model.addObject("querydto",new querydto());
		model.addObject("list",list);
		model.addObject("count", no);
		model.addObject("key",key);
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
	@RequestMapping(value="reportgenerator.html*")
	public ModelAndView execution(@RequestParam(value = "query_id", required = false) int query_id,
								@RequestParam(value="disp_name",required= false)String disp_name, HttpSession session)
	{
		ModelAndView model=new ModelAndView();
		int x=services.getparam(query_id);
		if(x>0)
		{
			List<Query> list=services.getbyid(query_id);
			if(list.size()==1)
			{
				String query=list.get(0).getQuery();
				System.out.println(query+"that is");
				List<String> l=querycount.querycounter(query);
				session.setAttribute("disp_name", disp_name);
				ModelAndView model1=new ModelAndView();
				model1.addObject("list",l);
//				model1.addObject("query",query);
				session.setAttribute("query", query);
				model1.setViewName("paramwiz");
				return model1;
			}
			
		}
		else{
		session.setAttribute("list", services.caller(query_id,disp_name));
		model.setViewName("reportgen");
		return model;
		}
		return null;
	}
	@RequestMapping(value="paramquery.html*")
	public ModelAndView hellno(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		String s=(String) session.getAttribute("query");
		System.out.println(s+"beeeeeee");
		List<String> l=querycount.querycounter(s);
		List<String> answer=new ArrayList<String>();
		for(int k=0;k<l.size();k++)
		{
			answer.add(request.getParameter(l.get(k)));
		}
		String qu=querycount.replacer(answer, s);
		System.out.println(qu+"beeeeeeep");
		ModelAndView model=new ModelAndView();
		session.setAttribute("list", services.caller1(qu,(String)session.getAttribute("disp_name")));
		model.setViewName("reportgen");
		return model;
		
	}
}

