package com.elitecore.services;

public class validator {

	boolean validate;
	public boolean validate_phone(String phone)
	{
	
		if(phone.contains("[a-zA-Z]+")==false && phone.length()==10)
		{
			validate=true;
		}
		else
		{
			validate=false;
		}
		return validate;
	}
	public boolean validate_uname(String name)
	{
		if((Character.isLetter(name.charAt(0)) || name.charAt(0)=='$') && name.length()>=6)
		{
			validate=true;
		}
		else
		{
			validate=false;
		}
		return validate;
	}
	public boolean validate_pw(String pw)
	{
		if (pw == null || pw.trim().isEmpty()) {
	         System.out.println("Incorrect format of string");
	         validate=false;
	     }
		else
		{
			
				if(pw.length()>=6 && pw.length()<=20)
				{
					validate=true;
				}
				else
				{
					validate=false;
				}
			
		}
			return validate;
	}

}
