package com.elitecore.services;

import org.springframework.util.StringUtils;

public class manipulator {
public static String convsql(String s1,String s2)
{
	s1 = s1.toLowerCase();
	
	while(s1.indexOf("  ")!=-1)
	{
		s1 = s1.replaceAll("  "," ");
	}
	while(s1.indexOf(", ")!=-1)
	{
		s1 = s1.replaceAll(", ",",");
	}
	
	int delim;
	int a = 7;
	int b = s1.indexOf("from");
	
	String ms = s1.substring(a, b);
	
	while(s2.indexOf("  ")!=-1)
	{
		s2 = s2.replaceAll("  "," ");
	}
	while(s2.indexOf(", ")!=-1)
	{
		s2 = s2.replaceAll(", ",",");
	}
	
	delim = s1.indexOf("*");
	
	if(delim!=-1)
	{
		return s1;
	}
	
	String[] a1 = ms.split(",");
	String[] a2 = s2.split(",");
	String s3 = "";
	
	for(int i=0; i<a1.length; i++)
	{
		s3 += a1[i] + " as " + a2[i] + ",";
	}
	s3 = s3.substring(0, s3.length()-1);
	s3 += " ";
	return s1.replaceFirst(ms, s3);
	
}
}
