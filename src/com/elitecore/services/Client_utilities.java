package com.elitecore.services;

import java.util.Random;

public class Client_utilities {

	public static int generate_otp()
	{
		Random r=new Random();
		int max=999999;
		int min=111111;
		int otp= r.nextInt((max-min)+1)+min;
		System.out.println("The PsudoRandom Generated OTP is: "+otp);
		return otp;
	}
	
	
	
}
