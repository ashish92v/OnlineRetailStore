package com.onlineretail.service;

	import java.util.Iterator;
import java.util.List;
import java.util.regex.Pattern;

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
	    public String saveLogin(String name, String email, String password){
	
			try{
				if(name!=null && name!="" && email!=null && email!="" && password!=null && password!=""){
					Login user = new Login(name,email,password);	
					// save
					mongoOperation.save(user);

				}
			}catch(Exception e){
				e.printStackTrace();
			}	
			return "sucess";
	    }
	    
		public String getUser(Login login){
		
			String username="";
			try{
				// query to search user
				System.out.println("inside getUser method");
				Query searchUserQuery = new Query(Criteria.where("email").is(login.getEmail()).and("password").is(login.getPassword()));

				System.out.println("inside getUser method1");				
				List<Login> listUser =	mongoOperation.find(searchUserQuery, Login.class);
				System.out.println("inside getUser method2");				
				System.out.println("4. Number of user = " + listUser.size());

				for (Iterator iterator = listUser.iterator(); iterator.hasNext();) {
					Login login1 = (Login) iterator.next();
					System.out.println("Login"+login1.getEmail());
					System.out.println("Login"+login1.getName());
					username=login1.getName();
				}
				System.out.println("username"+username);
				
			/*	// update password
				mongoOperation.updateFirst(searchUserQuery, 
			                         Update.update("password", "new password"),Login.class);

				// find the updated user object
				Login updatedUser = mongoOperation.findOne(searchUserQuery, Login.class);
*/				
			}catch(Exception e){
				e.printStackTrace();
			}
				
		return username;
		}
		
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
		
	
}

	
	
	
	
	
	
	