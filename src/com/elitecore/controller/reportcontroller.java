package com.elitecore.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Scanner;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.jsoup.Jsoup;
import org.quartz.InterruptableJob;
import org.quartz.Job;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleTrigger;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.elitecore.dao.schedulerdao;
import com.elitecore.dto.DBMasterDto;
import com.elitecore.dto.Reportdto;
import com.elitecore.dto.maildto;
import com.elitecore.dto.querydto;
import com.elitecore.model.DBMaster;
import com.elitecore.model.Query;
import com.elitecore.model.Report;
import com.elitecore.model.User;
import com.elitecore.services.DBservices;
import com.elitecore.services.Reportservices;
import com.elitecore.services.itext;
import com.elitecore.services.querycount;
import com.elitecore.services.queryservices;
import com.elitecore.services.transfer;
import com.ibm.icu.util.Calendar;
import com.itextpdf.text.DocumentException;


import jxl.*;
@Controller

public class reportcontroller implements Job {
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
	@RequestMapping(value="convertor.html")
	public String convertor(HttpServletRequest request) throws Exception
	{		
		String url=request.getParameter("html_val_pdf");
		
		String removestring="class=\"table table-bordered table-striped\"";
		String removestring2="class=\"bg-primary\"";
		String borderstring=" border=\"1\" ";
		System.out.println(removestring+"  "+removestring2);
		
		String modified=url.replaceAll(removestring, borderstring);
		String Finalized=modified.replaceAll(removestring2, " ");
		
		System.out.println("URL HERE"+Finalized);
		File input = new File("C:/Vatsal/EliteCoreGITProject/WebContent/Report_PDF_Storage/page.html");
		FileWriter w=new FileWriter(input.getAbsoluteFile());
		BufferedWriter bw=new BufferedWriter(w);
		
		String HtmlString="<html><head></head><body>"+Finalized+"</body></html>";
		System.out.println(HtmlString);
		bw.write(HtmlString);
		bw.close();
		
		//creating unique name everytime for the pdf documentation name
		String fileName = new SimpleDateFormat("dd_MM_yyyy_hh_mm'.pdf'").format(new java.util.Date());
	
		System.out.println("filename  "+fileName);
		
		
		itext.createPdf("C:/Vatsal/EliteCoreGITProject/WebContent/Report_PDF_Storage/Report_"+fileName, "C:/Vatsal/EliteCoreGITProject/WebContent/Report_PDF_Storage/page.html");
		String referer = request.getHeader("Referer");
	    return "redirect:"+ referer;
	
			
	}
	
	@RequestMapping(value="mailto.html")
	public String mailer(HttpServletRequest request) throws IOException, DocumentException
	{
		String url=request.getParameter("html_val_mail");
		
		System.out.println("TRIGGER"+url);
		
		String removestring="class=\"table table-bordered table-striped\"";
		String removestring2="class=\"bg-primary\"";
		String borderstring=" border=\"1\" ";
		System.out.println(removestring+"  "+removestring2);
		
		String modified=url.replaceAll(removestring, borderstring);
		String Finalized=modified.replaceAll(removestring2, " ");
		
		System.out.println("URL HERE"+Finalized);
		File input = new File("C:/Vatsal/EliteCoreGITProject/WebContent/Report_PDF_Storage/page.html");
		FileWriter w=new FileWriter(input.getAbsoluteFile());
		BufferedWriter bw=new BufferedWriter(w);
		
		String HtmlString="<html><head></head><body>"+Finalized+"</body></html>";
		System.out.println(HtmlString);
		bw.write(HtmlString);
		bw.close();
		
		//creating unique name everytime for the pdf documentation name
		String fileName = new SimpleDateFormat("dd_MM_yyyy_hh_mm'.pdf'").format(new java.util.Date());
	
		System.out.println("filename  "+fileName);
		
		
		itext.createPdf("C:/Vatsal/EliteCoreGITProject/WebContent/Report_PDF_Storage/Report_"+fileName, "C:/Vatsal/EliteCoreGITProject/WebContent/Report_PDF_Storage/page.html");
		

	    final String username = "aprojects66@gmail.com";
	    final String password = "blackbeard123";
	    Properties props = new Properties();
	    props.setProperty("mail.transport.protocol", "smtp");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.host", "smtp.gmail.com");
	    props.put("mail.smtp.port", "587");

	    Session session = Session.getInstance(props,
	            new javax.mail.Authenticator() {
	                protected PasswordAuthentication getPasswordAuthentication() {
	                    return new PasswordAuthentication(username, password);
	                }
	            });

	    try {

	        Message message = new MimeMessage(session);
	        message.setFrom(new InternetAddress("aprojects66@gmail.com"));
	        message.setRecipients(Message.RecipientType.TO,
	                InternetAddress.parse(request.getParameter("mailid")));
	        message.setSubject("Your report");
	        message.setText("PFA");
	        
	        MimeBodyPart messageBodyPart = new MimeBodyPart();

	        Multipart multipart = new MimeMultipart();

	        messageBodyPart = new MimeBodyPart();

			String file = new SimpleDateFormat("dd_MM_yyyy_hh_mm'.pdf'").format(new java.util.Date());
			
			file="C:/Vatsal/EliteCoreGITProject/WebContent/Report_PDF_Storage/Report_"+fileName;
			
			System.out.println("filename  "+file);
		        DataSource source = new FileDataSource(file);
	        messageBodyPart.setDataHandler(new DataHandler(source));
	        messageBodyPart.setFileName("attatchment.pdf");
	        multipart.addBodyPart(messageBodyPart);

	        message.setContent(multipart);

	        System.out.println("Sending");

	        Transport.send(message);

	        System.out.println("Done");

	    } catch (MessagingException e) {
	        e.printStackTrace();
	    }
	    String referer = request.getHeader("Referer");
	    return "redirect:"+ referer;
	  

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
	
	int db_id;
	
	@RequestMapping(value="reportgenerator.html*")
	public ModelAndView execution(@RequestParam(value = "query_id", required = false) int query_id,
								@RequestParam(value="disp_name",required= false)String disp_name,
								@RequestParam(value="db_id",required= false) int db_id, HttpSession session)
	{
			try{
				
			this.db_id=db_id;	
			System.out.println("ReportGen:1");
			ModelAndView model=new ModelAndView();
			int x=services.getparam(query_id);
			System.out.println("ReportGen:2");
			if(x>0)
			{
				System.out.println("ave?");
				List<Query> list=services.getbyid(query_id);
				if(list.size()==1)
				{
					System.out.println("ReportGen:3");
					String query=list.get(0).getQuery();
					System.out.println(query+"that is");
					List<String> l=querycount.querycounter(query);
					System.out.println("ReportGen:4");
					session.setAttribute("disp_name", disp_name);
					ModelAndView model1=new ModelAndView();
					model1.addObject("list",l);
	//				model1.addObject("query",query);
					session.setAttribute("query", query);
					model1.setViewName("paramwiz");
					System.out.println("ReportGen:5");
					return model1;
					
				}
				
			}
			else{
			
				System.out.println("else ma ayu....");
			session.setAttribute("list", services.caller(query_id,disp_name,db_id));
			System.out.println("dao mathi successfully aai gyu....");
			model.addObject("maildto",new maildto());
			model.setViewName("reportgen");
			return model;
			}
			return null;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return new ModelAndView("error_report");
		}
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
		
		session.setAttribute("list", services.caller1(qu,(String)session.getAttribute("disp_name"),db_id));
		model.setViewName("reportgen");
		return model;	
	}
	
	@Autowired
	JdbcTemplate template;
	
	@Override
	/*public void execute(JobExecutionContext arg0) throws JobExecutionException 
	{
				redirector(abc);
		}
		catch(Exception e)
		{
				e.printStackTrace();
		}
		
	}*/
	
	public void execute(JobExecutionContext arg0) throws JobExecutionException
	{
		System.out.println("inside job");
		
		//execute report
		java.util.Date d=new java.util.Date();	
		int i=d.getHours();
		int j=d.getMinutes();
		
		
		
		try{
			
			int report_id = 0;
			int db_id=0;
			int query_id=0;
			String display_name="";
		
			System.out.println("invoking function to dao-via-services "+i+" "+j);
			
			String driverstring="com.mysql.jdbc.Driver";
			String connectionstring="jdbc:mysql://localhost:3306/spring?user=root";
			String user = null;
			String password = null;
			
			System.out.println("invoking CORE JDBC");
			
			try
			{
				Class.forName(driverstring);
				
				Connection con= DriverManager.getConnection(connectionstring);
				
				Statement st=con.createStatement();
				
							
				String query="select report_id from scheduler where start_time='"+i+":"+j+"'";
				System.out.println(query);
				ResultSet rs= st.executeQuery(query);
								
				while(rs.next())
				{
					 report_id = rs.getInt("report_id");
					
				}
				
				System.out.println("reportID "+report_id);
				
				//we got the reportID so call all the field of that report
				String query2="select query_id,db_id,display_name from report where id='"+report_id+"'";
				Statement st2=con.createStatement();
				System.out.println(query2);
				ResultSet rs2= st2.executeQuery(query2);
								
				while(rs2.next())
				{
					 query_id = rs2.getInt("query_id");
					 db_id = rs2.getInt("db_id");
					 display_name = rs2.getString("display_name");
					 
					 System.out.println("QDbDn"+query_id+" "+db_id+" "+display_name);
				}
				
				String query_to_run="";
				String queryfind="select query from query where id="+query_id;
				Statement st4=con.createStatement();
				System.out.println(query_to_run);
				ResultSet rs4= st4.executeQuery(queryfind);
				while(rs4.next())
					query_to_run=rs4.getString("query");
					
				
				String query3=query_to_run;
				Statement st3=con.createStatement();
				System.out.println(query3);
				ResultSet rs3= st3.executeQuery(query3);
								
				ResultSetMetaData mtdt=rs3.getMetaData();
				System.out.println("mtdt count "+mtdt.getColumnCount());
				String html="<tr style=\"background-color:aqua\">";			
				for(int x=1;x<=mtdt.getColumnCount();x++)
				{
					System.out.print(mtdt.getColumnName(x)+"\t");
					html += "<th>"+mtdt.getColumnName(x)+"</th>";
					System.out.println("ahi thi fari km nai frtu???");
				}
				html += "</tr>";
				System.out.println("y here????????");
								
				while(rs3.next())
				{
					System.out.println("direct ahi km ayu???");
					html += "<tr>";
					for(int x=1;x<=mtdt.getColumnCount();x++)
					{
						System.out.println(rs3.getString(x));
						html += "<td>"+ rs3.getString(x)+"</td>" ;
						System.out.println("ahiya to gol fari jaaa plzz...");
					}
					System.out.println("ane to row patai didhi....");
					html += "</tr>";
				}
				
				System.out.println("lyoooo.... khel Khatam...");
				html = "<html>"
						+ "<head> </head>"
						+ "<body>"
						+ "<table border=\"1\" cellpadding=\"4\" cellpadding=\"1\" align=\"center\">"
						+ html
						+ "</table>"
						+ " </body></html>";
				rs.close();rs3.close();
				st.close();st3.close();
				con.close();			
			
			
			System.out.println("inside job");
			// report execution completed....
			
			File input = new File("C:/Vatsal/EliteCoreGITProject/WebContent/Report_PDF_Storage/page.html");
			FileWriter w=new FileWriter(input.getAbsoluteFile());
			BufferedWriter bw=new BufferedWriter(w);
			bw.write(html);
			bw.close();
			
			//creating unique name everytime for the pdf documentation name
			String fileName = new SimpleDateFormat("dd_MM_yyyy_hh_mm'.pdf'").format(new java.util.Date());
			System.out.println("filename  "+fileName);
			itext.createPdf("C:/Vatsal/EliteCoreGITProject/WebContent/Report_PDF_Storage/Report_"+fileName, "C:/Vatsal/EliteCoreGITProject/WebContent/Report_PDF_Storage/page.html");

			
			//pdf generation
			
			
			//pdf generation complete
		 
		
			final String username = "aprojects66@gmail.com";
		    final String passwrd = "blackbeard123";
		    Properties props = new Properties();
		    props.setProperty("mail.transport.protocol", "smtp");
		    props.put("mail.smtp.starttls.enable", "true");
		    props.put("mail.smtp.auth", "true");
		    props.put("mail.smtp.host", "smtp.gmail.com");
		    props.put("mail.smtp.port", "587");

		    Session session = Session.getInstance(props,
		            new javax.mail.Authenticator() {
		                protected PasswordAuthentication getPasswordAuthentication() {
		                    return new PasswordAuthentication(username, passwrd);
		                }
		            });

		    try {

		        Message message = new MimeMessage(session);
		        message.setFrom(new InternetAddress("aprojects66@gmail.com"));
		        message.setRecipients(Message.RecipientType.TO,
		                InternetAddress.parse("vatsal51295@gmail.com"));
		        message.setSubject("Scheduler Report File");
		        message.setText("PFA");
		        
		        MimeBodyPart messageBodyPart = new MimeBodyPart();

		        Multipart multipart = new MimeMultipart();

		        messageBodyPart = new MimeBodyPart();

				String file = new SimpleDateFormat("dd_MM_yyyy_hh_mm'.pdf'").format(new java.util.Date());
				
				file="C:/Vatsal/EliteCoreGITProject/WebContent/Report_PDF_Storage/Report_"+fileName;
				
				System.out.println("filename  "+file);
			    DataSource source = new FileDataSource(file);
		        messageBodyPart.setDataHandler(new DataHandler(source));
		        messageBodyPart.setFileName("Scheduler_Report"+fileName+".pdf");
		        messageBodyPart.setDescription("Hey Admin, An attachment has been sent to you with this email."
		        		+ "kindly check that attachment.");
		        multipart.addBodyPart(messageBodyPart);

		        message.setContent(multipart);

		        System.out.println("Sending");

		        Transport.send(message);

		        System.out.println("Done");

		    } 
		    catch (Exception e) 
		    {
		        e.printStackTrace();
		    }
		}
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}
	
	public String redirector(String abc) throws IOException
	{
		System.out.println("Here in ABC");
		String redirect="redirect:"+abc+"";
		System.out.println(redirect);
		return redirect;
	}
}
	
	
		/*@RequestMapping(value="save_as_excel.html*")
	public ModelAndView save_excel(HttpServletRequest request)
	{
		ModelAndView model=new ModelAndView();
		
		try(OutputStream os1 = new FileOutputStream("target/simple_export_output1.xls"))
		{
	        List<User> user = services.sample();
	        List<String> headers = Arrays.asList("Id", "Username", "Password");
	        SimpleExporter exporter = new SimpleExporter();
	        exporter.gridExport(headers, user, "Idddd, Userrrnamee, pword", os1);
		}
		
		return model;
	}*/
	
	
	
	

