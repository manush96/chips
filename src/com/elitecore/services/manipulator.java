package com.elitecore.services;

import org.springframework.util.StringUtils;

public class manipulator {
public static String convsql(String s,String s1)
{
	
	int begin=0;
	int begin1=0;
	String final1="";
	int n = StringUtils.countOccurrencesOf(s, ",");
	int a=s.indexOf(",");
	int b=s1.indexOf(",");
	String temp=s.substring(begin,a);
	String temp1=s1.substring(begin,b);
	for(int i=0;i<n;i++)
		{
			if(i!=n)
			{
				System.out.println(i);
				final1= final1 + temp +" as ";
				final1= final1 + temp1 +",";
				System.out.println(final1);
				//begin=a+1;
				//begin1=b+1;
				System.out.println(begin);
				System.out.println(a);
				s=s.substring(a+1);
				s1=s1.substring(b+1);
				a=s.indexOf(",");
				b=s1.indexOf(",");
				if(i!=n-1)
				{
				     temp=s.substring(begin,a);
				     temp1=s1.substring(begin1,b);
				}
			}
			else
			{
					System.out.println(i+"hi");
					s=s.substring(a+1);
					s1=s1.substring(b+1);
			}
		}
	System.out.println(s);
	a=s.indexOf("from");
	if(a==-1)
	{
		a=s.indexOf("FROM");
	}
	if(a==-1)
	{
		a=s.indexOf("From");
	}
	System.out.println(begin);
	System.out.println(a);
	temp=s.substring(0,a);
	temp1=s1.substring(0);
	System.out.println(temp1);
	final1= final1 + temp +"as ";
	final1= final1 + temp1+" ";
	System.out.println(final1);
	s=s.substring(a);
	final1= final1 + s;
	System.out.println(final1);
	return final1;
	
}
}
