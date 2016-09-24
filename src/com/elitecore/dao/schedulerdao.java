package com.elitecore.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Temporal;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletResponse;

import org.quartz.Job;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleTrigger;
import org.quartz.impl.JobDetailImpl;
import org.quartz.impl.StdSchedulerFactory;
import org.quartz.impl.triggers.SimpleTriggerImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.elitecore.controller.reportcontroller;
import com.ibm.icu.util.Calendar;

@Repository("schedulerdao")
public class schedulerdao{
private EntityManager em;
	
	@PersistenceContext
    public void setEntityManager(EntityManager em) {
        this.em = em;
    }
	@Autowired

	JdbcTemplate template;
	@SuppressWarnings("deprecation")
	public void scheduler1() throws SchedulerException
	{		
		System.out.println("scheduler");
		String sql="select start_time,job_name from scheduler";
		
		List<Map<String,Object>> list=template.queryForList(sql);
		for(int i=0;i<list.size();i++)
		{
			Map<String,Object> m=list.get(i);
			System.out.println("Map "+m);
			int j=1;
			String jobname="";
			String start_time="";
			for(Map.Entry<String, Object> entry:m.entrySet())
			{	
				if(j==1)
				{
				start_time=entry.getValue().toString();
				j++;
			}
				if(j==2)
				{
					jobname=entry.getValue().toString();
				}
			}
			JobDetail job = new JobDetail();
	    	job.setName(jobname);
	    	System.out.println(start_time);
	    	
	    	job.setJobClass(reportcontroller.class);
	    	System.out.println(jobname);
	    	//configure the scheduler time
	    	SimpleTrigger trigger = new SimpleTrigger();
	    	trigger.setName("dumb");
	    	java.util.Calendar c=java.util.Calendar.getInstance();
	    	java.util.Date d=new java.util.Date();
	    	String a=start_time.replace(":", "");
	    	
	    	
	    	int a1=Integer.parseInt(a);
	    	System.out.println(a1);
	    	
	    	int h=a1/100;
	    	int m1=a1%100;
	    	System.out.println(a+"--- "+h+" : "+m1);
	    	trigger.setStartTime(new java.util.Date(d.getYear(),d.getMonth(),d.getDate(),h,m1));

	    	trigger.setRepeatInterval(24*60*60*1000);
	    	//schedule it
	    	Scheduler scheduler = null;
			try {
				scheduler = new StdSchedulerFactory().getScheduler();
			} catch (SchedulerException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	try {
				scheduler.start();
			} catch (SchedulerException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	try {
				scheduler.scheduleJob(job, trigger);
			} catch (SchedulerException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		

		
}
	}
	
}
