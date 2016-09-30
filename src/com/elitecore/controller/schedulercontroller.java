package com.elitecore.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.elitecore.dto.Schedulerdto;
import com.elitecore.dto.userdto;
import com.elitecore.model.User;
import com.elitecore.model.scheduler;
import com.elitecore.services.Reportservices;
import com.elitecore.services.itext;
import com.elitecore.services.transfer;
import com.elitecore.services.validator;

@Controller
public class schedulercontroller implements Job {
	
	@Autowired
	Reportservices services;
	
	@RequestMapping(value="/scheduletask.html", method = RequestMethod.POST)
	public String save(@Valid @ModelAttribute Schedulerdto  schedulerdto,BindingResult result) throws Exception 
	{
		scheduler sch=transfer.schedules(schedulerdto);
		services.addschedule(sch);
		return "redirect:index.jsp";
	}
	
	@RequestMapping(value="/scheduler.html")
	public ModelAndView scheduler_view(HttpServletRequest request)
	{
		ModelAndView model=new ModelAndView();
		model.addObject("scheduler", new Schedulerdto());
		model.setViewName("schedulerview");
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
