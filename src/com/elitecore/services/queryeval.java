package com.elitecore.services;

public class queryeval {
public static void main(String args[])
{
	String a="select * from user where id=$";
	a.toLowerCase();
	int x=a.indexOf("$");
	int count=0;
	if(x==-1)
	{
		System.out.println(0);
	}
	else{
		while(x!=-1)
		{
			x=a.indexOf("$");
			count++;
			
		}
	}
	System.out.println(count);
}
}
