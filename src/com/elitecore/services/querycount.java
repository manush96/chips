package com.elitecore.services;
import java.util.ArrayList;
import java.util.List;

public class querycount {

	public static String rev(String a)
	{
		String rev="";
		int x=a.length();
		while(x!=0)
		{
			rev+=a.charAt(x-1);
			x--;
		}
		return rev;
	}
	public static List<String> querycounter(String a)
	{	
		List<String> list=new ArrayList<String>();
		List<String> list1=new ArrayList<String>();
		a.toLowerCase();
		while(a.indexOf("(")!=-1)
		{
			a = a.replaceAll("\\("," ");
		}
		while(a.indexOf(")")!=-1)
		{
			a = a.replaceAll("\\)"," ");
		}
		while(a.indexOf("= ")!=-1)
		{
			a = a.replaceAll("= ","=");
		}
		while(a.indexOf(" =")!=-1)
		{
			a = a.replaceAll(" =","=");
		}
		int y;
		int x=a.indexOf("$");
		String sm=a.substring(0, x);
		int count=0;
			
			while(x!=-1)
			{
				String ar1=sm.replaceAll(","," ");
				String ar[]=ar1.split(" ");
				int skl=ar.length;
				ar[skl-1]=ar[skl-1].substring(0, ar[skl-1].length()-1);
				list1.add(ar[skl-1]);
				System.out.println(ar[skl-1]);
				x=a.indexOf("$");
				y=a.indexOf("$");
				a=a.substring(x+1);
				int z=a.indexOf("$");
				if(z!=-1)
				{
				sm=a.substring(0,z);
				}
				count++;
			}
			for(int k=0;k<(list1.size()-1);k++)
			{
				list.add(list1.get(k));
			}
			return list;
	}
	public static String replacer(List<String> list,String s)
	{
		StringBuilder str=new StringBuilder();
		for(int j=0;j<s.length();j++)
		{
			str.append(s.charAt(j));
		}
		System.out.println(str+"haaaaaaaaaaaaaaaaaaaaa");
		
		for(int i=0;i<list.size();i++)
		{
			
			str.replace(str.indexOf("$"),str.indexOf("$")+1 , "'"+list.get(i)+"'");
		}
		
		System.out.println(str.toString()+"naaaaaaaaaaaaaaaaaaaa");
		return str.toString();
	}
	}


