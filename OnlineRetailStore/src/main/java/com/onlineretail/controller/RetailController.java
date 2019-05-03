package com.onlineretail.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.onlineretail.pojo.Category;
import com.onlineretail.pojo.Product;
import com.onlineretail.service.BackendService;
import com.onlineretail.util.Result;

import com.onlineretail.pojo.Login;
import com.onlineretail.service.LoginService;
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

	@Controller
	@RequestMapping("/hello")

	public class RetailController {
		@Autowired LoginService login;
		@Autowired BackendService backendService;
	//	HttpSession session=null;
		
		ApplicationContext ctx = 
				new AnnotationConfigApplicationContext(Config.class);
		MongoOperations mongoOperation = (MongoOperations) ctx.getBean("mongoTemplate");
		
		
		@RequestMapping(value = "/shop", method = RequestMethod.GET)
		public String index(ModelMap model,HttpSession session, HttpServletRequest request) {
		System.out.println("shop");
			String username="";
			String sessionCheck="";
			Login loginData=null;
			
			try {
				if(session!=null && session.getAttribute("username")!="" ){
					System.out.println("session+++++"+session);
					sessionCheck=session.getAttribute("username")!=null?session.getAttribute("username").toString():"Guest";
					System.out.println("sessionCheck");
					if(sessionCheck!=null){
						String UserId=session.getAttribute("userId").toString();
						String name=session.getAttribute("name").toString();
						Integer productCount=login.productCount(UserId);
						model.addAttribute("count",productCount);
						model.addAttribute("user",name);
					}else{
						model.addAttribute("count",0);
						System.out.println("userlogin if block");
						model.addAttribute("user","Guest");
					}

					
				}else{
					model.addAttribute("count",0);
					System.out.println("userlogin if block");
					model.addAttribute("user","Guest");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			
			System.out.println("hello"+username);
			return "home";
		}
		
		@RequestMapping(value = "/login", method = RequestMethod.GET)
		public String login(ModelMap model) {
			
			model.addAttribute("message", "Hello Spring WEB MVC!");
			return "login";
		}

		
		@RequestMapping(value = "/checklogin", method = RequestMethod.POST)
		public String login1(@RequestParam("username") String username,@RequestParam("password") String password,
			HttpSession session,ModelMap modelMap) {
			Login user=null;
			String LoggedInUser="";
			Login login1=new Login();
			boolean isLoginSuccessful=false;
			String result="login";
			 modelMap.addAttribute("msg","Invalid Credentials");			
			if(username!=null && username!="" && password!=null && password!=""){
				 user= new Login(username, password);
				 login1=login.getUser(user);
				
				 if(login1!=null){
					 System.out.println("LoggedInUser : "+login1.getFirstname());
					 System.out.println("LoggedInUser : "+login1.getId());
					 session.setAttribute("userId", login1.getId());
					 session.setAttribute("username", login1.getEmail());
					 session.setAttribute("name", login1.getFirstname());
					 modelMap.addAttribute("user",login1.getFirstname());
					 
					 isLoginSuccessful=true; 
					 Integer productCount=login.productCount(login1.getId());
					 modelMap.addAttribute("count",productCount);
					 result= "home";
					 modelMap.addAttribute("msg","");
				 }
				 
			}else{
			//	modelMap.put("error", "Invalid Account");
				modelMap.addAttribute("count",0);
				 modelMap.addAttribute("user",LoggedInUser);			
				result= "login";
			
			}
			return result;
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
		public String aboutus(ModelMap model,HttpSession session, HttpServletRequest request) {
			
			String sessionCheck="";
			System.out.println("RetailController.aboutus()");
			if(session!=null && session.getAttribute("username")!="" ){
				System.out.println("session+++++"+session);
				sessionCheck=session.getAttribute("username")!=null?session.getAttribute("username").toString():"Guest";
				String name=session.getAttribute("name")!=null?session.getAttribute("name").toString():"Guest";
				System.out.println("sessionCheck");
				if(sessionCheck!=null){
					String UserId=session.getAttribute("userId").toString();
					Integer productCount=login.productCount(UserId);
					model.addAttribute("count",productCount);
					model.addAttribute("user",name);
				}
			}
			
			return "aboutus";
		}
		
		@RequestMapping(value = "/AddInCart", method = RequestMethod.GET)
		public String AddInCart(ModelMap model,@RequestParam String cartID,@RequestParam String product,@RequestParam String image,@RequestParam String price, HttpSession session, HttpServletRequest request) {
			System.out.println("RetailController.AddInCart()");
			System.out.println("cart"+cartID);
			System.out.println("product"+product);
			System.out.println("image"+image);
			System.out.println("price"+price);
			String requestPage="home";
			String username="";
			String sessionCheck="";
			Login loginData=null;
			
			if(session!=null && session.getAttribute("username")!=null && session.getAttribute("username")!="" && !session.getAttribute("username").toString().equalsIgnoreCase("Guest") && cartID!=null && cartID!=""){
				System.out.println("session+++++"+session);
				sessionCheck=session.getAttribute("username")!=null?session.getAttribute("username").toString():"";
				String UserId=session.getAttribute("userId").toString();
				String name=session.getAttribute("name").toString();
				System.out.println("UserId"+UserId);
				System.out.println("sessionCheck"+sessionCheck);
				String response=login.saveCart(cartID, UserId,product,image,price);
				Integer productCount=login.productCount(UserId);
				model.addAttribute("count",productCount);
				model.addAttribute("user",name);

				System.out.println("DB AddInCart response"+response);
				model.addAttribute("msg","product added in cart");
			}else
			{
				System.out.println("userlogin if block");
				model.addAttribute("count",0);
				requestPage="login";
				model.addAttribute("user","Guest");
				model.addAttribute("msg","Please login to your account");
			}
			return requestPage;
		}
		
		@RequestMapping(value = "/cart", method = RequestMethod.GET)
		public String cart(ModelMap model,HttpSession session, HttpServletRequest request){
			System.out.println("RetailController.showCart()");
			String product="";
			String sessionCheck="";
			String requestPage="cart";
			
			if(session!=null && session.getAttribute("username")!=null && session.getAttribute("username")!="" && !session.getAttribute("username").toString().equalsIgnoreCase("Guest") ){
				System.out.println("session+++++"+session);
				sessionCheck=session.getAttribute("username")!=null?session.getAttribute("username").toString():"";
				String UserId=session.getAttribute("userId").toString();
				String name=session.getAttribute("name").toString();
				Integer productCount=login.productCount(UserId);
				model.addAttribute("count",productCount);

				System.out.println("UserId"+UserId);
				System.out.println("sessionCheck"+sessionCheck);
				model.addAttribute("user",name);
				
			}else
			{
				System.out.println("userlogin if block");
				requestPage="login";
				model.addAttribute("user","Guest");
			}
			return requestPage;
		}
		
		@RequestMapping(value = "/showcart", method = RequestMethod.GET)
		public  @ResponseBody String  showcart(ModelMap model,HttpSession session, HttpServletRequest request){
			System.out.println("RetailController.showCart()");
			String product= "";
			System.out.println("product  :"+product);
			String sessionCheck="";
			
			
			if(session!=null && session.getAttribute("username")!=null && session.getAttribute("username")!="" && !session.getAttribute("username").toString().equalsIgnoreCase("Guest") ){
				System.out.println("session+++++"+session);
				sessionCheck=session.getAttribute("username")!=null?session.getAttribute("username").toString():"";
				String UserId=session.getAttribute("userId").toString();
				System.out.println("UserId"+UserId);
				System.out.println("sessionCheck"+sessionCheck);
				if(UserId!=null && UserId!=""){
					product= login.getCartProducts(UserId);
					Integer productCount=login.productCount(UserId);
					model.addAttribute("count",productCount);

				}
				
			}
			
			return product;
			
		}
		
		@RequestMapping(value = "/deleteProduct", method = RequestMethod.GET)
		public String deleteProduct(ModelMap model,@RequestParam String cartID, HttpSession session, HttpServletRequest request){
			String sessionCheck="";
			System.out.println("RetailController.deleteProduct()");
			if(session!=null && session.getAttribute("username")!=null && session.getAttribute("username")!="" && !session.getAttribute("username").toString().equalsIgnoreCase("Guest")
				&&	cartID!=null && cartID!=""	){
				System.out.println("session+++++"+session);
				sessionCheck=session.getAttribute("username")!=null?session.getAttribute("username").toString():"";
				String UserId=session.getAttribute("userId").toString();
				System.out.println("UserId"+UserId);
				System.out.println("sessionCheck"+sessionCheck);
				if(UserId!=null && UserId!=""){
					login.deleteProduct(cartID, UserId);
					Integer productCount=login.productCount(UserId);
					model.addAttribute("count",productCount);

				}
				
				
			}
			return "cart";
		}
		

		@RequestMapping(value = "/productCount", method = RequestMethod.GET)
		public String productCount(HttpSession session, HttpServletRequest request){
			String sessionCheck="";
			System.out.println("RetailController.productCount()");
			if(session!=null && session.getAttribute("username")!=null && session.getAttribute("username")!="" 
					&& !session.getAttribute("username").toString().equalsIgnoreCase("Guest")){
				System.out.println("session+++++"+session);
				sessionCheck=session.getAttribute("username")!=null?session.getAttribute("username").toString():"";
				String UserId=session.getAttribute("userId").toString();
				System.out.println("UserId"+UserId);
				System.out.println("sessionCheck"+sessionCheck);
				if(UserId!=null && UserId!=""){
					login.productCount(UserId);
				}
				
			}
			return "cart";
		}

		@RequestMapping(value = "/updateProduct1", method = RequestMethod.GET)
		public String updateProduct1(){
			System.out.println("RetailController.updateProduct1()");
			return "cart";
		}
		
		
		/*@RequestMapping(value = "/showcart", method = RequestMethod.GET)
		public String showCart(ModelMap model,HttpSession session, HttpServletRequest request) {
			System.out.println("RetailController.cart()");
			String sessionCheck="";
			String requestPage="cart";
			String product="";
			
			if(session!=null && session.getAttribute("username")!=null && session.getAttribute("username")!="" && !session.getAttribute("username").toString().equalsIgnoreCase("Guest") ){
				System.out.println("session+++++"+session);
				sessionCheck=session.getAttribute("username")!=null?session.getAttribute("username").toString():"";
				String UserId=session.getAttribute("userId").toString();
				System.out.println("UserId"+UserId);
				System.out.println("sessionCheck"+sessionCheck);
				if(UserId!=null && UserId!=""){
					product= login.getCartProducts(UserId);
				}
				model.addAttribute("user",sessionCheck);
				
			}else
			{
				System.out.println("userlogin if block");
				requestPage="login";
				model.addAttribute("user","Guest");
			}

			return requestPage;
		}
	*/
		
		@RequestMapping(value = "/test", method = RequestMethod.GET)
		public String test(ModelMap model) {
			System.out.println("cart");
			model.addAttribute("message", "Hello Spring WEB MVC!");
			return "test";
		}
		
		@RequestMapping(value = "/saveAccount", method = RequestMethod.GET)
		public String saveAccount(ModelMap model,HttpSession session, HttpServletRequest request) {
			System.out.println("createAccount");
			String requestPage="home";
			Integer productCount=0;
			if(session!=null && session.getAttribute("username")!=null && session.getAttribute("username")!=""){
				
				String name=session.getAttribute("name").toString();
				String UserId=session.getAttribute("userId").toString();
				System.out.println("UserId"+UserId);
				if(UserId!=null && UserId!=""){
					 productCount=login.productCount(UserId);
					model.addAttribute("count",productCount);

				}else{
					model.addAttribute("count",productCount);
				}
				model.addAttribute("user",name);
	
				requestPage="saveAccount";
			}else{
				model.addAttribute("msg", "Please login to your account.");
			}
			
			
			return requestPage;
		}
		
		@RequestMapping(value = "/updateAccount", method = RequestMethod.GET)
		public String updateAccount(ModelMap model,HttpSession session, HttpServletRequest request,
				@RequestParam String firstname,@RequestParam String lastname,
				@RequestParam String address1, @RequestParam String address2,@RequestParam String city,
				@RequestParam String zip,@RequestParam String state,@RequestParam String phone) {
			System.out.println("lmasd");
			String requestPage="saveAccount";
			if(firstname!=null && firstname!="" && lastname!=null && lastname!="" && address1!=null && address1!="" &&
				address2!=null && address2!="" && city!=null && city!="" && zip!=null && zip!="" && 
				state!=null && state!="" && phone!=null && phone!=""){
				
				Integer productCount=0;
				if(session!=null && session.getAttribute("username")!=null && session.getAttribute("username")!=""){
					
					String emailId=session.getAttribute("username").toString();
					Login user = new Login(firstname,lastname ,address1,address2,city,zip,state,phone);	
					login.updateInfo(emailId,user);
					String UserId=session.getAttribute("userId").toString();
						
					if(UserId!=null && UserId!=""){
						 productCount=login.productCount(UserId);
						model.addAttribute("count",productCount);

					}else{
						model.addAttribute("count",productCount);
					}

					model.addAttribute("msg", "Information updated successfully");
					requestPage="home";
				}else{
					model.addAttribute("msg", "Oops! something went wrong");
					model.addAttribute("count",productCount);
					
				}
			}
			
			return "home";
		}
		
		@RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
		public String updatePassword(ModelMap model,@RequestParam String password_2,HttpSession session, HttpServletRequest request) {
			System.out.println("RetailController.updatePassword()"+password_2);
			if(password_2!=null && password_2!="" ){
				if(session!=null && session.getAttribute("username")!=null && session.getAttribute("username")!=""){
						String emailId=session.getAttribute("username").toString();
						login.updatePassword(emailId, password_2);
						model.addAttribute("msg", "Your password has been updated successfully");
				}else{
					model.addAttribute("msg", "Oops!,something went wrong");
						
				}
			}else{
				model.addAttribute("msg", "Oops!,something went wrong");
				
			}
			
			return "home";
		}
		
		@RequestMapping(value = "/getInformation", method = RequestMethod.GET)
		public @ResponseBody String getInformation(HttpSession session, HttpServletRequest request) {
			System.out.println("RetailController.getInformation()");
			Login loginlist=new Login();
			String info="";
				if(session!=null && session.getAttribute("username")!=null && session.getAttribute("username")!=""){
						String emailId=session.getAttribute("username").toString();
						loginlist =login.getInformation(emailId);
					
					if(loginlist!=null){
						String firstname=loginlist.getFirstname()!=null?loginlist.getFirstname():"";
						String lastname= loginlist.getLastname()!=null?loginlist.getLastname():"";
						String address1= loginlist.getAddress1()!=null?loginlist.getAddress1():"";
						String address2=loginlist.getAddress2()!=null?loginlist.getAddress2():"";
						String city=loginlist.getCity()!=null?loginlist.getCity():"";
						String zip=loginlist.getZip()!=null?loginlist.getZip():"";
						String state= loginlist.getState()!=null?loginlist.getState():"";
						String telephone=loginlist.getTelephone()!=null?loginlist.getTelephone():"";
						String email=loginlist.getEmail()!=null?loginlist.getEmail():"";
					
						info=firstname+"~"+lastname+"~"+address1+"~"+address2+"~"+city+"~"+zip+"~"+state+"~"+telephone+"~"+email;
 
					}
				}
			
			return info;
		}
		
		

		@RequestMapping(value = "/checkPassword", method = RequestMethod.GET)
		public @ResponseBody String checkPassword(@RequestParam String password_old,HttpSession session, HttpServletRequest request) {
			System.out.println("RetailController.checkPassword()"+password_old);
			String samePassword="no";
			if(password_old!=null && password_old!="" ){
				if(session!=null && session.getAttribute("username")!=null && session.getAttribute("username")!=""){
						String emailId=session.getAttribute("username").toString();
						samePassword=login.checkPassword(password_old,emailId);
				}
			}
			
			return samePassword;
		}

		
		
		
		@RequestMapping(value = "/register", method = RequestMethod.GET)
		public String register(ModelMap model) {
			System.out.println("register");
			model.addAttribute("message", "");
			return "register";
		}
		
		@RequestMapping(value = "/checkout", method = RequestMethod.GET)
		public String checkout(ModelMap model,HttpSession session) {
			System.out.println("checkout");
			try{
				if(session!=null && session.getAttribute("username")!=null && session.getAttribute("username")!=""){
				System.out.println("session"+session);
				System.out.println("session"+session.getAttribute("username"));
					String UserId=session.getAttribute("userId").toString();
					login.removeProduct(UserId);
					model.addAttribute("msg", "Thank you for shopping with us.");
			
				}
			}catch(Exception e){
			e.printStackTrace();
			}
			return "Thankyou";
		}
		
		@RequestMapping(value = "/registrationPage", method = RequestMethod.GET)
		public String register(ModelMap model,@RequestParam String firstName,@RequestParam String lastName ,@RequestParam String email,@RequestParam String password) {
			System.out.println("firstName "+ firstName + " lastName " + lastName + " email "+ email +" password "+password);
			String response="";
			String request="login";
			if(firstName !=null && lastName!="" && email!=null && email!="" && password!=null && password!=""){
				 response=login.saveLogin(firstName , lastName , email, password);
				 
				 
				 System.out.println("response"+response);
			}
			System.out.println("response"+response);
			
			model.addAttribute("message", "Congratulations!, you have been successully registered.");
			if(response!=null && response!="" && response.equalsIgnoreCase("fail")){
				request="register";
				model.addAttribute("message", "User already exist, please use another email-id.");
			}
			
			//model.addAttribute("message", "Hello Spring WEB MVC!");
			return request;
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
						product=login.getAllGadget("ALL");
						System.out.println("productId"+productId);	       
	/*		        	System.out.println("productId"+productId);
						product="{\"gadget\": [{ \"gadgetUrl\": \"img//camera.jpg\",\"name\":\"camera\"}  ,{ \"gadgetUrl\": \"img//phone2.jpg\", \"name\": \"phone2\" },  { \"gadgetUrl\": \"img//laptop.jpg\", \"name\": \"laptop\" },{ \"gadgetUrl\": \"img//grinder.jpg\", \"name\": \"grinder\" },{ \"gadgetUrl\": \"img//television.jpg\", \"name\": \"television\" },{ \"gadgetUrl\": \"img//washingmachine.jpg\", \"name\": \"washingmachine\" },{ \"gadgetUrl\": \"img//grinder.jpg\", \"name\": \"grinder\" },{ \"gadgetUrl\": \"img//television.jpg\", \"name\": \"television\" },{ \"gadgetUrl\": \"img//washingmachine.jpg\", \"name\": \"washingmachine\" },{ \"gadgetUrl\": \"img//camera.jpg\",\"name\":\"camera\"}  ,{ \"gadgetUrl\": \"img//phone2.jpg\", \"name\": \"phone2\" },  { \"gadgetUrl\": \"img//laptop.jpg\", \"name\": \"laptop\" }]}";
	*/		        }
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
		
		@RequestMapping(value="/forgotPasswordReq", method = RequestMethod.GET)
		public String passwordAssistance(ModelMap model,@RequestParam String username,HttpSession session){
			System.out.println("RetailController.passwordAssistance()");
			String requestPage="forgotPassword";
			
			try{
				if(username!=null && username.trim()!=""){
					String password=login.generatePassword();
					//String email= session.getAttribute("username")!=null?session.getAttribute("username").toString():"";
					
					System.out.println("username:"+username);
					System.out.println("new password:"+password);
					
					String status=login.updatePassword(username,password);
					MailConfig mail =new MailConfig();
					
					if(status!=null && status!="" && !status.equalsIgnoreCase("failure")){
						mail.sendMail(username,password);
						requestPage="login";
						model.addAttribute("msg", "Congratulation! New password has been sent on your email-id.");
					}else{
						model.addAttribute("msg","User does not exist");
					}
				}
				System.out.println("requestPage"+requestPage);
			}catch(Exception e){
				e.printStackTrace();
			}

			System.out.println("requestPage"+requestPage);
			return requestPage;
		}	
	 
		@RequestMapping(value="/forgotPassword", method = RequestMethod.GET)
		public String forgotPassword(){
			System.out.println("RetailController.forgotPassword()");
			
			return "forgotPassword";
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