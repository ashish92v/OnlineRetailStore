package com.onlineretail.service;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.onlineretail.controller.Config;
import com.onlineretail.pojo.CartProduct;
import com.onlineretail.pojo.Gadget;
import com.onlineretail.pojo.Login;

	@Service("LoginService")
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public class LoginServiceImp implements LoginService{

		// For Annotation
		ApplicationContext ctx = 
	             new AnnotationConfigApplicationContext(Config.class);
		MongoOperations mongoOperation = (MongoOperations) ctx.getBean("mongoTemplate");
		
	
		
		@Override
	    public String saveLogin(String firstName ,String lastName , String email, String password){
			String response="";
			try{
				if(firstName!=null && firstName!="" && lastName!=null && lastName!="" && email!=null && email!="" && password!=null && password!=""){
					Login user = new Login(firstName,lastName ,email,password);	
					mongoOperation.save(user);
					response="sucess";
				}else{
					response="fail";
					
				}
				System.out.println("response:"+response);
			}catch(Exception e){
				e.printStackTrace();
					
			}	
			return response;
	    }
	    
		@Override
		public Login getUser(Login login){
			Login login1=null;
			String username="";
			try{
				// query to search user
				System.out.println("inside getUser method");
				Query searchUserQuery = new Query(Criteria.where("email").is(login.getEmail()).and("password").is(login.getPassword()));

				System.out.println("inside getUser method1");				
				List<Login> listUser =	mongoOperation.find(searchUserQuery, Login.class);
				System.out.println("inside getUser method2");				
				System.out.println("4. Number of user = " + listUser.size());
				if(listUser!=null && listUser.size()>0){
					for (Iterator iterator = listUser.iterator(); iterator.hasNext();) {
						 login1 = (Login) iterator.next();
						System.out.println("Login"+login1.getEmail());
						System.out.println("Login"+login1.getFirstname());
						username=login1.getFirstname();
					}
				}
				System.out.println("username"+username);
				
			}catch(Exception e){
				e.printStackTrace();
			}
				
		return login1;
		}
		
		@Override
		public String updateUser(){
			
			try{
				Query searchUserQuery = new Query(Criteria.where("username").is("avish2").and("password").is("123456"));

				// delete
				mongoOperation.remove(searchUserQuery, Login.class);

				// List, it should be empty now.
				List<Login> listUser = mongoOperation.findAll(Login.class);
				System.out.println("4. Number of user = " + listUser.size());

				for (Iterator iterator = listUser.iterator(); iterator.hasNext();) {
					Login login = (Login) iterator.next();
					System.out.println("Login"+login.getEmail());
				}
				
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
			return "";
		}
		
	@Override	
	public String updatePassword(String email,String password){
		String status="failure";
		try{
			System.out.println("password "+password);
			Query searchUserQuery = new Query(Criteria.where("email").is(email));
			
			List<Login> user =	mongoOperation.find(searchUserQuery, Login.class);
			System.out.println("user size"+user.size());
			for (Iterator iterator = user.iterator(); iterator.hasNext();) {
				Login login = (Login) iterator.next();
				
				if(login!=null && password!=null && password.trim()!=""){
					Update update=new Update();
					update.set("password", password);
					mongoOperation.updateFirst(searchUserQuery, update, Login.class);
					status="success";
				}
				
				System.out.println("Login"+login.getEmail());
			}
		
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return status;
	}
	
	
	@Override
	public String getAllGadget(String productkey){
		
		JSONArray jsonarray = new JSONArray();
		DBCollection collection = mongoOperation.getCollection("gadget");
		JSONObject jsonobj = null;
		String product="";
		try{
		
			System.out.println("hey"+productkey);
			if(productkey!=null && productkey!="" && !productkey.equalsIgnoreCase("ALL")){
				
				Query query = new Query(Criteria.where("gadgetName").regex("^(?i)"+productkey));
				Query query2 = new Query(Criteria.where("gadgetName").regex("^(?i)"+productkey+"^(?i)"));
				Query query3 = new Query(Criteria.where("gadgetName").regex(productkey));
				Query query4 = new Query(Criteria.where("gadgetName").regex(productkey+"^(?i)"));
				Query query5 = new Query(Criteria.where("category").regex("^(?i)"+productkey));
				Query query6 = new Query(Criteria.where("category").regex("^(?i)"+productkey+"^(?i)"));
				Query query7 = new Query(Criteria.where("category").regex(productkey));
				Query query8 = new Query(Criteria.where("category").regex(productkey+"^(?i)"));

				
				
				
				System.out.println("inside getUser method1");				
				List<Gadget> dataList =	mongoOperation.find(query, Gadget.class);
				List<Gadget> dataList2 =	mongoOperation.find(query2, Gadget.class);
				List<Gadget> dataList3 =	mongoOperation.find(query3, Gadget.class);
				List<Gadget> dataList4 =	mongoOperation.find(query4, Gadget.class);
				List<Gadget> dataList5 =	mongoOperation.find(query5, Gadget.class);
				List<Gadget> dataList6 =	mongoOperation.find(query6, Gadget.class);
				List<Gadget> dataList7 =	mongoOperation.find(query7, Gadget.class);
				List<Gadget> dataList8 =	mongoOperation.find(query8, Gadget.class);
				
				System.out.println("dataList"+dataList.size());
				System.out.println("dataList2"+dataList2.size());
				System.out.println("dataList3"+dataList3.size());
				System.out.println("dataList4"+dataList4.size());
				System.out.println("dataList5"+dataList5.size());
				System.out.println("dataList6"+dataList6.size());
				System.out.println("dataList7"+dataList7.size());
				System.out.println("dataList8"+dataList8.size());
					
				
				
				
				for (Iterator iterator = dataList.iterator(); iterator.hasNext();) {
					Gadget gadget = (Gadget) iterator.next();
					System.out.println("gadget:"+gadget.getGadgetName());
					System.out.println("getGadgetId:"+gadget.get_id());
					jsonobj= new JSONObject();
				    jsonobj.put("gadgetId",gadget.get_id());
					jsonobj.put("gadgetName", gadget.getGadgetName());
				    jsonobj.put("gadgetUrl", gadget.getGadgetUrl());
					jsonobj.put("gadgetPrice", gadget.getGadgetPrice());
					jsonarray.put(jsonobj);
				}

				for (Iterator iterator = dataList2.iterator(); iterator.hasNext();) {
					Gadget gadget = (Gadget) iterator.next();
					System.out.println("gadget:"+gadget.getGadgetName());
					System.out.println("getGadgetId:"+gadget.get_id());
					jsonobj= new JSONObject();
				    jsonobj.put("gadgetId",gadget.get_id());
					jsonobj.put("gadgetName", gadget.getGadgetName());
				    jsonobj.put("gadgetUrl", gadget.getGadgetUrl());
					jsonobj.put("gadgetPrice", gadget.getGadgetPrice());
					jsonarray.put(jsonobj);
				}
				
				for (Iterator iterator = dataList3.iterator(); iterator.hasNext();) {
					Gadget gadget = (Gadget) iterator.next();
					System.out.println("gadget:"+gadget.getGadgetName());
					System.out.println("getGadgetId:"+gadget.get_id());
					jsonobj= new JSONObject();
				    jsonobj.put("gadgetId",gadget.get_id());
					jsonobj.put("gadgetName", gadget.getGadgetName());
				    jsonobj.put("gadgetUrl", gadget.getGadgetUrl());
					jsonobj.put("gadgetPrice", gadget.getGadgetPrice());
					jsonarray.put(jsonobj);
				}
				
				for (Iterator iterator = dataList4.iterator(); iterator.hasNext();) {
					Gadget gadget = (Gadget) iterator.next();
					System.out.println("gadget:"+gadget.getGadgetName());
					System.out.println("getGadgetId:"+gadget.get_id());
					jsonobj= new JSONObject();
				    jsonobj.put("gadgetId",gadget.get_id());
					jsonobj.put("gadgetName", gadget.getGadgetName());
				    jsonobj.put("gadgetUrl", gadget.getGadgetUrl());
					jsonobj.put("gadgetPrice", gadget.getGadgetPrice());
					jsonarray.put(jsonobj);
				}
	
				for (Iterator iterator = dataList5.iterator(); iterator.hasNext();) {
					Gadget gadget = (Gadget) iterator.next();
					System.out.println("gadget:"+gadget.getGadgetName());
					System.out.println("getGadgetId:"+gadget.get_id());
					jsonobj= new JSONObject();
				    jsonobj.put("gadgetId",gadget.get_id());
					jsonobj.put("gadgetName", gadget.getGadgetName());
				    jsonobj.put("gadgetUrl", gadget.getGadgetUrl());
					jsonobj.put("gadgetPrice", gadget.getGadgetPrice());
					jsonarray.put(jsonobj);
				}
	
				for (Iterator iterator = dataList6.iterator(); iterator.hasNext();) {
					Gadget gadget = (Gadget) iterator.next();
					System.out.println("gadget:"+gadget.getGadgetName());
					System.out.println("getGadgetId:"+gadget.get_id());
					jsonobj= new JSONObject();
				    jsonobj.put("gadgetId",gadget.get_id());
					jsonobj.put("gadgetName", gadget.getGadgetName());
				    jsonobj.put("gadgetUrl", gadget.getGadgetUrl());
					jsonobj.put("gadgetPrice", gadget.getGadgetPrice());
					jsonarray.put(jsonobj);
				}
	
				for (Iterator iterator = dataList7.iterator(); iterator.hasNext();) {
					Gadget gadget = (Gadget) iterator.next();
					System.out.println("gadget:"+gadget.getGadgetName());
					System.out.println("getGadgetId:"+gadget.get_id());
					jsonobj= new JSONObject();
				    jsonobj.put("gadgetId",gadget.get_id());
					jsonobj.put("gadgetName", gadget.getGadgetName());
				    jsonobj.put("gadgetUrl", gadget.getGadgetUrl());
					jsonobj.put("gadgetPrice", gadget.getGadgetPrice());
					jsonarray.put(jsonobj);
				}
	
				for (Iterator iterator = dataList8.iterator(); iterator.hasNext();) {
					Gadget gadget = (Gadget) iterator.next();
					System.out.println("gadget:"+gadget.getGadgetName());
					System.out.println("getGadgetId:"+gadget.get_id());
					jsonobj= new JSONObject();
				    jsonobj.put("gadgetId",gadget.get_id());
				    jsonobj.put("gadgetName", gadget.getGadgetName());
				    jsonobj.put("gadgetUrl", gadget.getGadgetUrl());
					jsonobj.put("gadgetPrice", gadget.getGadgetPrice());
					jsonarray.put(jsonobj);
				}
	
				
				
			}else{
				
				DBCursor cursor = collection.find();
				while(cursor.hasNext())
				{
					jsonobj= new JSONObject();
					BasicDBObject obj = (BasicDBObject) cursor.next();
					System.out.println("Data "+obj.getString("gadgetUrl"));
					jsonobj.put("gadgetId", obj.getString("_id"));
				    jsonobj.put("gadgetName", obj.getString("gadgetName"));
				    jsonobj.put("gadgetUrl", obj.getString("gadgetUrl"));
				    jsonobj.put("gadgetPrice", obj.getString("gadgetPrice"));
				    jsonarray.put(jsonobj);
				}
				System.out.println("hey");
			}
			product=jsonarray.toString();
			product="{"+"\"gadget\""+":"+product+"}";
			System.out.println("data in string"+product );
	
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return product;
	}
		
	@Override
	public String generatePassword() {
	      int len = 7; 
		  System.out.println("generatePassword "); 
		  String capitalChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"; 
		  String smallChars = "abcdefghijklmnopqrstuvwxyz"; 
		  String numbers = "0123456789"; 
		  
		  
		  String values = capitalChars + smallChars + numbers ; 
		  
		  Random rndm_method = new Random(); 
		  
		  char[] password = new char[len]; 
		  
		  for (int i = 0; i < len; i++) 
		  { 
		     password[i] = 
		     values.charAt(rndm_method.nextInt(values.length())); 
		  
		   } 
		  String generatedPassword= new String(password);
		   return generatedPassword; 
		  
	}

	@Override
    public String saveCart(String gadgetId,String UserId,String product,String image,String price){
		String response="";
		CartProduct gadget=new CartProduct();
		try{
			if(gadgetId!=null && gadgetId!="" && UserId!=null && UserId!="" && product!=null && product!="" && image!=null && image!="" && price!=null && price!=""){
				
				// check whether product exist in cart
				String checkProductInCart=new LoginServiceImp().checkProductInCart(gadgetId, UserId);
				System.out.println("1==========");

				if(checkProductInCart!=null && checkProductInCart!="" ){
					System.out.println("2==========checkProductInCart"+checkProductInCart);

					String str[]= checkProductInCart.split("~");
					String prodExistence=str[0];
					double countVal=str[1]!=null?Double.parseDouble(str[1].toString()):0;
					int count=(int)countVal;
					System.out.println("3==========prodExistence"+prodExistence);
					System.out.println("3==========count"+count);

					// if product doesn't i.e "no", insert new entry in cartProduct in db
					if(prodExistence.trim().equalsIgnoreCase("no")){
						System.out.println("4==========");
						gadget.setProductCount("1");
						gadget.setDate(new Date());
						gadget.setUserId(UserId);
						gadget.setGadget(gadgetId);
						gadget.setProduct(product);
						gadget.setPrice(price);
						gadget.setImage(image);
						mongoOperation.save(gadget);
					}else{ //else increase the count
						System.out.println("5=========="+gadgetId);
						
						System.out.println("5=========="+UserId);
						count=count+1;
						Query searchUserQuery = new Query(Criteria.where("gadget").is(gadgetId).and("userId").is(UserId));
						List<CartProduct> prod =	mongoOperation.find(searchUserQuery, CartProduct.class);

						System.out.println("size of prod"+prod.size());
						System.out.println("count"+count);
						
						for (Iterator iterator = prod.iterator(); iterator.hasNext();) {
						CartProduct	cartProd = (CartProduct) iterator.next();
						System.out.println("size of prod"+cartProd.getGadget());
						System.out.println("count"+cartProd.getUserId());

						}		
						
						if(prod!=null && prod.size()>0){
							System.out.println("6==========");
							Update update=new Update();
							update.set("productCount", count);
							mongoOperation.updateFirst(searchUserQuery, update, CartProduct.class);
						}
					}
			}else{
				gadget.setProductCount("1");
				gadget.setDate(new Date());
				gadget.setUserId(UserId);
				gadget.setGadget(gadgetId);
				mongoOperation.save(gadget);
		
				
			}
			System.out.println("response:"+response);
		}
	}catch(Exception e){
			e.printStackTrace();
	}	
		return response;
    }

	@Override
	public String checkProductInCart(String gadgetId,String userId){
		String prodExist="no";
		String prodCount="0";
		CartProduct cartProd=null;
		try{
			System.out.println("inside getUser method");
			Query searchCartQuery = new Query(Criteria.where("gadget").is(gadgetId).and("userId").is(userId));

			System.out.println("inside getUser method11111");				
			List<CartProduct> cart = mongoOperation.find(searchCartQuery, CartProduct.class);
			System.out.println("cart size = " + cart.size());
			
			if(cart!=null && cart.size()>0){
				prodExist="yes";

				for (Iterator iterator = cart.iterator(); iterator.hasNext();) {
					cartProd = (CartProduct) iterator.next();
					System.out.println("Login value"+cartProd.getGadget());
					System.out.println("Login value"+cartProd.getUserId());
					System.out.println("Login value"+cartProd.getProductCount());
					prodCount=cartProd.getProductCount();
				}
			}
			
			prodExist=prodExist+"~"+prodCount;
			
		}catch(Exception e){
			e.printStackTrace();
		}
			
	return prodExist;
	}

	@Override
	public String getCartProducts(String userId){
		JSONArray jsonarray = new JSONArray();
		JSONObject jsonobj = null;
		String product="";
		try{
			Query searchProductQuery = new Query(Criteria.where("userId").is(userId));
			List<CartProduct> prod =	mongoOperation.find(searchProductQuery, CartProduct.class);
		
			if(prod!=null && prod.size()>0){
				for (Iterator iterator = prod.iterator(); iterator.hasNext();) {
					CartProduct cartProd = (CartProduct) iterator.next();
					System.out.println("getGadget value"+cartProd.getGadget());
					System.out.println("getUserId value"+cartProd.getUserId());
					System.out.println("getProductCount value"+cartProd.getProductCount());
					System.out.println("getProduct value"+cartProd.getProduct());
					System.out.println("getImage value"+cartProd.getImage());
					System.out.println("getPrice value"+cartProd.getPrice());

					
					jsonobj= new JSONObject();
					jsonobj.put("gadgetId", cartProd.getGadget());
				    jsonobj.put("userId", cartProd.getUserId());
				    jsonobj.put("productCount", cartProd.getProductCount());
				    jsonobj.put("product", cartProd.getProduct());
				    jsonobj.put("image", cartProd.getImage());
				    jsonobj.put("price", cartProd.getPrice());
				    jsonarray.put(jsonobj);
				
				}
				
				System.out.println("jsonarray: "+jsonarray);
				product=jsonarray.toString();
				product="{"+"\"gadget\""+":"+product+"}";
			
			}		
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return product;
	}

	
	public void deleteProduct(String gadget,String userId){
		System.out.println("LoginServiceImp.deleteProduct()");
		try{
			Query searchProductQuery = new Query(Criteria.where("gadget").is(gadget).and("userId").is(userId));
			// delete
			mongoOperation.remove(searchProductQuery, CartProduct.class);

		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	@Override
	public Integer productCount(String userId){
		System.out.println("LoginServiceImp.deleteProduct()");
		Integer count=0;
		try{
			Query searchProductQuery = new Query(Criteria.where("userId").is(userId));

			List<CartProduct> gadgetList =	mongoOperation.find(searchProductQuery, CartProduct.class);

			System.out.println("count of product"+gadgetList.size());
			count=gadgetList.size();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}

@Override
	public void updateInfo(String emailId, Login login){
		System.out.println("LoginServiceImp.updateInfo()");
		try{
			Query searchUserQuery = new Query(Criteria.where("email").is(emailId));

			Update update=new Update();
			update.set("firstname", login.getFirstname());
			update.set("lastname", login.getLastname());
			update.set("address1", login.getAddress1());
			update.set("address2", login.getAddress2());
			update.set("city", login.getCity());
			update.set("state", login.getState());
			update.set("telephone", login.getTelephone());
			update.set("zip", login.getZip());
			mongoOperation.updateFirst(searchUserQuery, update, Login.class);
		
			mongoOperation.save(login);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}


@Override
public String checkPassword(String password, String email){
	System.out.println("LoginServiceImp.updateInfo()");
	String user="";
	try{
		Query searchUserQuery = new Query(Criteria.where("email").is(email).and("password").is(password));
		List<Login> listUser =	mongoOperation.find(searchUserQuery, Login.class);
		
		 user= listUser.size()==0?"yes":"no";
	}catch(Exception e){
		e.printStackTrace();
	}
	return user;
}


	@Override
	public Login getInformation(String email){
		String username="";
		Login login= new Login();
		try{
			// query to search user
			Query searchUserQuery = new Query(Criteria.where("email").is(email));
	
			List<Login> listUser =	mongoOperation.find(searchUserQuery, Login.class);
	
			if(listUser!=null && listUser.size()>0){
				for (Iterator iterator = listUser.iterator(); iterator.hasNext();) {
					 login = (Login) iterator.next();
					System.out.println("Login"+login.getEmail());
					System.out.println("Login"+login.getFirstname());
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
			
	return login;
	}

	
	@Override
	public void removeProduct(String userId){
		String username="";
		Login login= new Login();
		try{
			// query to search user
			Query searchProductQuery = new Query(Criteria.where("userId").is(userId));

			mongoOperation.remove(searchProductQuery, CartProduct.class);

			
		}catch(Exception e){
			e.printStackTrace();
		}
			
	}


}
	
	