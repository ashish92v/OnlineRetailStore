package com.onlineretail.service;

import com.mongodb.DBCollection;
import com.onlineretail.pojo.Login;

public interface LoginService {
	
	public String saveLogin(String firstName ,String lastName,String email, String password);
	public Login getUser(Login login);
	public String updateUser();
	//public String getGadget(DBCollection collection);
	public String getAllGadget(String productkey);
	public String generatePassword();
	public String updatePassword(String email,String password);
	public String saveCart(String gadgetId,String UserId,String product, String image, String price);
	public String checkProductInCart(String gadgetId,String userId);
	public String getCartProducts(String userId);
	public void deleteProduct(String gadget,String userId);
	public Integer productCount(String userId);
	public void updateInfo(String userId, Login login);
	public String checkPassword(String password, String email);
	public Login getInformation(String email);
	public void removeProduct(String userId);
}
