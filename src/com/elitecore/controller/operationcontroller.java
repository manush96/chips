package com.elitecore.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.elitecore.dao.querydao;
import com.elitecore.dto.*;
import com.elitecore.model.Query;
import com.elitecore.model.SearchKeyWord;
import com.elitecore.model.User;
import com.elitecore.model.queryin;
import com.elitecore.services.queryservices;
import com.elitecore.services.transfer;
import com.elitecore.services.userservices;
import com.elitecore.services.validator;
@Controller
@SessionAttributes("test")

public class operationcontroller {

private userservices userService;
//private queryservices queryservices;

@Autowired
queryservices services;
@Autowired
	public operationcontroller(userservices userService) {
		this.userService = userService;
//		this.queryservices=queryservices;
//	
	}
@RequestMapping(value="/hello.html")
public ModelAndView hello()
{
	return new ModelAndView("form","userdto",new userdto());
}

	
	
	@RequestMapping(value="/save.html", method = RequestMethod.POST)
	public String save(@Valid @ModelAttribute userdto  userdto,BindingResult result) throws Exception 
	{
		validator valid=new validator();
		if(valid.validate_uname(userdto.getUsername()) && valid.validate_pw(userdto.getPassword()))
		{
				User user=transfer.trans(userdto);
				userService.addUser(user);
				return "redirect:success_reg.html";
		}
		else
		{
			return "redirect:errorpage.html";
		}

}
	@RequestMapping(value="/get_page_2.html")
	public ModelAndView hello5(@RequestParam("query") String temp, @RequestParam("name") String name,@RequestParam("db_id") int db_id)
	{	
		String[] output = temp.split("^");
		int query_id=Integer.parseInt(output[0]);
		String disp_name=output[1];
		Reportdto r1=new Reportdto();
		r1.setReport_name(name);
		r1.setQuery_id(query_id);
		r1.setDb_id(db_id);
		System.out.println("be yar");
		System.out.println(disp_name);
		int a=disp_name.indexOf("from");
		System.out.println(a);
		String df=disp_name.substring(7,a-1);
		System.out.println(df);
		ModelAndView model=new ModelAndView();
		model.addObject("Reportdto",r1);
		model.addObject("list",df);
		model.setViewName("report_conf2");
		return model;	
	}	
	@RequestMapping(value="/success_reg.html", method = RequestMethod.GET)
	public ModelAndView save1(@ModelAttribute userdto  userdto)
	{
		
				return new ModelAndView("profile","test","hello");
		
	}
	@RequestMapping(value="/errorpage.html",method=RequestMethod.GET)
	public ModelAndView err()
	{
		return new ModelAndView("errorpage");
	}
	@RequestMapping(value="/login.html")
	public String login(@ModelAttribute userdto userdto, HttpSession session) throws Exception
	{
		User user=transfer.trans(userdto);
		
		String m=userService.checklogin(user);
		if(m.equalsIgnoreCase("success"))
		{
			session.setAttribute("user", user);
			session.setAttribute("url", "viewquery.html?page=1");
			return "redirect:profile.html";
		}
		else
		{
			return "redirect:errorpage.html;";
		}
	}
	
	@RequestMapping(value="/profile.html")
	public ModelAndView profile(HttpSession session) throws Exception
	{
		
		User user = (User) session.getAttribute("user");
		if(user == null || user.equals(""))
		{
			return new ModelAndView("form","userdto",new userdto());
		}
		else
		{
			return new ModelAndView("Dashboard","key",user.getUserName());
		}
		
	}
	
	@RequestMapping(value="/logout.html")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:hello.html";
	}

	@RequestMapping(value="/setsession.html")
	public void setsession(@RequestParam("url") String url, HttpSession session)
	{
		session.setAttribute("url",url);
	}
}
