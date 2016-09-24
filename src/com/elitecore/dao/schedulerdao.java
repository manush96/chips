package com.elitecore.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Temporal;

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

import com.ibm.icu.util.Calendar;

@Repository("schedulerdao")
public class schedulerdao implements Job{
private EntityManager em;
	
	@PersistenceContext
    public void setEntityManager(EntityManager em) {
        this.em = em;
    }
	@Autowired

	JdbcTemplate template;
	@SuppressWarnings("deprecation")
	public static void scheduler1() throws SchedulerException
	{
		System.out.println("scheduler");
		String sql="select start_time,job_name from scheduler";
		
		List<Map<String,Object>> list=template.queryforList(sql);
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
				jobname=entry.getValue().toString();
				j++;
			}
				if(j==2)
				{
					start_time=entry.getValue().toString();
				}
			}
			JobDetail job = new JobDetail();
	    	job.setName(jobname);
	    	System.out.println(start_time);
	    	
	    	job.setJobClass(schedulerdao.class);
	    	System.out.println(jobname);
	    	//configure the scheduler time
	    	SimpleTrigger trigger = new SimpleTrigger();
	    	trigger.setName("dumb");
	    	java.util.Calendar c=java.util.Calendar.getInstance();
	    	Date d=new Date();
	    	String a=start_time.replace(":", "");
	    	String hh=a.substring(0,1);
	    	String mm=a.substring(2,3);
	    	System.out.println(hh+":"+mm);
	    	
	    	int h=Integer.parseInt(hh);
	    	int m1=Integer.parseInt(mm);
	    	trigger.setStartTime(new Date(d.getYear(),d.getMonth(),d.getDate(),h,m1));
	    	trigger.setRepeatCount(SimpleTriggerImpl.REPEAT_INDEFINITELY);
	    	trigger.setRepeatInterval(24*60*60*1000);
	    	//schedule it
	    	Scheduler scheduler = new StdSchedulerFactory().getScheduler();
	    	scheduler.start();
	    	scheduler.scheduleJob(job, trigger);
		
		}
	}
	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
			
			System.out.println("inside job");
			
	}
}
