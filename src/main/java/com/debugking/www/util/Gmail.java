package com.debugking.www.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication(){
		
		
		return new PasswordAuthentication("dlgkrals6000", "debugking");
		
	}
	
}
