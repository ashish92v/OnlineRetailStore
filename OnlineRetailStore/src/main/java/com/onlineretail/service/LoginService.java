package com.onlineretail.service;

import com.mongodb.DBCollection;
import com.onlineretail.pojo.Login;

public interface LoginService {
	
	public String saveLogin(String name,String email, String password);
	public String getUser(Login login);
	public String updateUser();
	//public String getGadget(DBCollection collection);
	public String getAllGadget(String productkey);
	
	
}
