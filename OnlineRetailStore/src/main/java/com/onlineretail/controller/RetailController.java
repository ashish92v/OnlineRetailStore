package com.onlineretail.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.onlineretail.pojo.Category;
import com.onlineretail.pojo.Product;
import com.onlineretail.service.BackendService;
import com.onlineretail.util.Result;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.onlineretail.pojo.Login;
import com.onlineretail.service.LoginService;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@Controller
//@RequestMapping("/hello")

public class RetailController {
	@Autowired LoginService login;
	@Autowired BackendService backendService;
//	HttpSession session=null;
	
	ApplicationContext ctx = 
            new AnnotationConfigApplicationContext(Config.class);
	MongoOperations mongoOperation = (MongoOperations) ctx.getBean("mongoTemplate");

	
	
	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	public String index(ModelMap model,HttpSession session, HttpServletRequest request) {
		String requestPage="home";
		String username="";
		String sessionCheck="";
		Login loginData=null;
		
		try {
		//	Login userlogin= checkAccountCookie(request);
			
			if(session!=null && session.getAttribute("username")!="" ){
				System.out.println("session+++++"+session);
				sessionCheck=session.getAttribute("username")!=null?session.getAttribute("username").toString():"NA";
				System.out.println("sessionCheck");
			}
			
			if(sessionCheck==null || sessionCheck=="" || sessionCheck=="NA"){
				System.out.println("userlogin if block");
				requestPage="login";
				model.addAttribute("user","Guest");
			}
			else{
				System.out.println("userlogin if block2"+ sessionCheck);	
				model.addAttribute("user",sessionCheck);
				String product="{'gadget': [{ gadgetUrl: 'img//camera.jpg',name:'camera'}  ,{ gadgetUrl: 'img//phone2.jpg', name: 'phone2' },  { gadgetUrl: 'img//laptop.jpg', name: 'laptop' },{ gadgetUrl: 'img//grinder.jpg', name: 'grinder' },{ gadgetUrl: 'img//television.jpg', name: 'television' },{ gadgetUrl: 'img//washingmachine.jpg', name: 'washingmachine' }]}";
				model.addAttribute("message", "Hello Spring WEB MVC!");

			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("hello"+username);
		System.out.println("requestPage"+requestPage);
		return requestPage;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		
/*		session.getAttribute("username");
		System.out.println("session check"+session.getAttribute("username"));
*/		model.addAttribute("message", "Hello Spring WEB MVC!");
		return "login";
	}

	
	@RequestMapping(value = "/checklogin", method = RequestMethod.POST)
	public String login1(@RequestParam("username") String username,@RequestParam("password") String password,
		HttpSession session,ModelMap modelMap) {
		Login user=null;
		String LoggedInUser="";
		
		if(username!=null && username!="" && password!=null && password!=""){
			 user= new Login(username, password);
			 LoggedInUser=login.getUser(user);
			 System.out.println("LoggedInUser : "+LoggedInUser);
			 session.setAttribute("username", LoggedInUser);
			 modelMap.addAttribute("user",LoggedInUser);
			return "home";
		
		}else{
		//	modelMap.put("error", "Invalid Account");
			 modelMap.addAttribute("user",LoggedInUser);			
			return "login";
		
		}
		
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("username");
		return "login";
	}
	
	
/*	@RequestMapping(value = "/checklogin", method = RequestMethod.POST)
	public String login1(@RequestParam String username ,@RequestParam String password) {
		System.out.println("login:  "+ "username "+username+" password "+ password);
	//	model.addAttribute("message", "Hello Spring WEB MVC!");
		return "home";
	}
*/


	public Login checkAccountCookie(HttpServletRequest request){
		Cookie[] cookies= request.getCookies();
		Login login= null;
		String username="";
		String password="";
		
		for(Cookie ck: cookies){
			if(ck.getName().equalsIgnoreCase("username")){
				username=ck.getValue();	
			}
			if(ck.getName().equalsIgnoreCase("username")){
				password=ck.getValue();
			}
		}
		if(!username.isEmpty() && !password.isEmpty())
		{
			login=new Login(username,password);
		}
		return login;
	}
	
	
	
	@RequestMapping(value = "/aboutus", method = RequestMethod.GET)
	public String aboutus(ModelMap model) {
		System.out.println("aboutus");
		model.addAttribute("message", "Hello Spring WEB MVC!");
		return "aboutus";
	}
	
	
	@RequestMapping(value = "/hello", method = RequestMethod.GET)
	public String hello(ModelMap model) {
		System.out.println("hello");
		model.addAttribute("message", "Hello Spring WEB MVC!");
		return "shop";
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(ModelMap model) {
		System.out.println("cart");
		model.addAttribute("message", "Hello Spring WEB MVC!");
		return "cart";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(ModelMap model) {
		System.out.println("cart");
		model.addAttribute("message", "Hello Spring WEB MVC!");
		return "test";
	}
	
	@RequestMapping(value = "/saveAccount", method = RequestMethod.GET)
	public String saveAccount(ModelMap model) {
		System.out.println("createAccount");
		model.addAttribute("message", "Hello Spring WEB MVC!");
		return "saveAccount";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(ModelMap model) {
		System.out.println("register");
		model.addAttribute("message", "Hello Spring WEB MVC!");
		return "register";
	}
	
	@RequestMapping(value = "/test1", method = RequestMethod.GET)
	public String test1(ModelMap model) {
		System.out.println("register");
		model.addAttribute("message", "Hello Spring WEB MVC!");
		return "modalP";
	}
	
	@RequestMapping(value = "/registrationPage", method = RequestMethod.GET)
	public String register(@RequestParam String name ,@RequestParam String email,@RequestParam String password) {
		System.out.println("name"+ name + "email "+ email +"password "+password);
		if(name!=null && name!="" && email!=null && email!="" && password!=null && password!=""){
			login.saveLogin(name, email, password);
		}
		//model.addAttribute("message", "Hello Spring WEB MVC!");
		return "login";
	}
	
	@RequestMapping(value="/getProduct", method = RequestMethod.GET)
	    public @ResponseBody  String getProduct(@RequestParam String productId,HttpSession session) {
	        System.out.println("getProduct "+productId); 
	        String product="";
	        
	        try{
	
/*
		        String prod=login.getAllGadget("phone");
		        System.out.println("prod"+prod);	        
*/		
	        	if(productId!=null && productId!="" && !productId.equalsIgnoreCase("ALL")){
		
	        		productId=productId.trim();
			        product=login.getAllGadget(productId);
			        System.out.println("productId"+productId);	        
	        		
	        		/*System.out.println("productId"+productId);
		        	product="{\"gadget\": [{ \"gadgetUrl\": \"img//camera.jpg\",\"name\":\"camera\"}  ,{ \"gadgetUrl\": \"img//phone2.jpg\", \"name\": \"phone2\" },  { \"gadgetUrl\": \"img//laptop.jpg\", \"name\": \"laptop\" },{ \"gadgetUrl\": \"img//grinder.jpg\", \"name\": \"grinder\" },{ \"gadgetUrl\": \"img//television.jpg\", \"name\": \"television\" },{ \"gadgetUrl\": \"img//washingmachine.jpg\", \"name\": \"washingmachine\" }]}";
			    	*/	
		        }
		        else{
		        	//product=login.getAllGadget("ALL");
			        System.out.println("productId"+productId);	       
		        	//System.out.println("productId"+productId);
		        	product="{\"gadget\": [{ \"gadgetUrl\": \"img//camera.jpg\",\"name\":\"camera\"}  ,{ \"gadgetUrl\": \"img//phone2.jpg\", \"name\": \"phone2\" },  { \"gadgetUrl\": \"img//laptop.jpg\", \"name\": \"laptop\" },{ \"gadgetUrl\": \"img//grinder.jpg\", \"name\": \"grinder\" },{ \"gadgetUrl\": \"img//television.jpg\", \"name\": \"television\" },{ \"gadgetUrl\": \"img//washingmachine.jpg\", \"name\": \"washingmachine\" },{ \"gadgetUrl\": \"img//grinder.jpg\", \"name\": \"grinder\" },{ \"gadgetUrl\": \"img//television.jpg\", \"name\": \"television\" },{ \"gadgetUrl\": \"img//washingmachine.jpg\", \"name\": \"washingmachine\" },{ \"gadgetUrl\": \"img//camera.jpg\",\"name\":\"camera\"}  ,{ \"gadgetUrl\": \"img//phone2.jpg\", \"name\": \"phone2\" },  { \"gadgetUrl\": \"img//laptop.jpg\", \"name\": \"laptop\" }]}";
		        }
		        System.out.println("getBatchListAction result "+product);
		    
/*		        JSONArray jsonarray = new JSONArray();
				DBCollection collection = mongoOperation.getCollection("gadget");
				DBCursor cursor = collection.find();
				JSONObject jsonobj = null;
			
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
				  
				product=jsonarray.toString();
				product="{"+"\"gadget\""+":"+product+"}";
*/				System.out.println("data in string"+product );
						
//				System.out.println("json"+jsonarray);
		        
	        }catch(Exception e){
	        	e.printStackTrace();
	        }
	        
	        return product;
	        }




	@RequestMapping(value = "/hometest", method = RequestMethod.GET)
	public String homeTest(ModelMap model) {
		Result<List<Product>> results = backendService.getSampleProducts(20);
		//Result<List<Product>> results = backendService.getProducts("?categories=5c9668945801bc84144575fe");
		//Result<Product> productResult = backendService.getProduct("5c966ef05801bc841446755e");
        //Result<List<Category>> results = backendService.getSampleCategories(20);
        // Result<List<String>> results = backendService.getImageNamesForProduct("5c966ef05801bc841446755e");

		if (results.isError()){
			//log or return error
			return "error";  //note: this is not a valid url. Need to figure what we want to do if we fail to get sample data
		}else{
			model.addAttribute("sampleproducts", results.getValue());
			return "home2";
		}
	}


}