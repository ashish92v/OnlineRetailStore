package com.onlineretail;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/hello")

public class RetailController {
	
	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	public String index(ModelMap model) {
		
		try {
			String product="{'gadget': [{ gadgetUrl: 'img//camera.jpg',name:'camera'}  ,{ gadgetUrl: 'img//phone2.jpg', name: 'phone2' },  { gadgetUrl: 'img//laptop.jpg', name: 'laptop' },{ gadgetUrl: 'img//grinder.jpg', name: 'grinder' },{ gadgetUrl: 'img//television.jpg', name: 'television' },{ gadgetUrl: 'img//washingmachine.jpg', name: 'washingmachine' }]}";
		//	String product="{'employees':[{'name':'Ram', 'email':'ram@gmail.com', 'age':23},{'name':'Shyam', 'email':'shyam23@gmail.com', 'age':28},{'name':'John', 'email':'john@gmail.com', 'age':33},{'name':'Bob', 'email':'bob32@gmail.com', 'age':41}]}";
			JSONObject obj= new JSONObject(product);	
			
			
			/*List<String> list = new ArrayList<String>();
			JSONArray array = obj.getJSONArray("gadget");
			for(int i = 0 ; i < array.length() ; i++){
			    list.add(array.getJSONObject(i).getString("gadgetUrl"));
			    
			}
			for(int i = 0 ; i < array.length() ; i++){
			    list.add(array.getJSONObject(i).getString("name"));
			    
			}
			
			for (Iterator iterator = list.iterator(); iterator.hasNext();) {
				String string = (String) iterator.next();
				System.out.println(string);
			}
		*/
			model.addAttribute("message", "Hello Spring WEB MVC!");
			model.addAttribute(obj);

		} catch (Exception e) {
			// TODO: handle exception
		}
		
		System.out.println("hello");
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		System.out.println("login");
		model.addAttribute("message", "Hello Spring WEB MVC!");
		return "login";
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
	
	
	@RequestMapping(value="/getProduct", method = RequestMethod.GET)
	    public @ResponseBody  String getProduct(@RequestParam String productId,HttpSession session) {
	        System.out.println("getProduct "+productId); 
	        String product="";
	        if(productId!=null && productId!="" && !productId.equalsIgnoreCase("ALL")){
	        	System.out.println("productId"+productId);
	        	product="{\"gadget\": [{ \"gadgetUrl\": \"img//camera.jpg\",\"name\":\"camera\"}  ,{ \"gadgetUrl\": \"img//phone2.jpg\", \"name\": \"phone2\" },  { \"gadgetUrl\": \"img//laptop.jpg\", \"name\": \"laptop\" },{ \"gadgetUrl\": \"img//grinder.jpg\", \"name\": \"grinder\" },{ \"gadgetUrl\": \"img//television.jpg\", \"name\": \"television\" },{ \"gadgetUrl\": \"img//washingmachine.jpg\", \"name\": \"washingmachine\" }]}";
		    		
	        }else{
	        	System.out.println("productId"+productId);
	        	product="{\"gadget\": [{ \"gadgetUrl\": \"img//camera.jpg\",\"name\":\"camera\"}  ,{ \"gadgetUrl\": \"img//phone2.jpg\", \"name\": \"phone2\" },  { \"gadgetUrl\": \"img//laptop.jpg\", \"name\": \"laptop\" },{ \"gadgetUrl\": \"img//grinder.jpg\", \"name\": \"grinder\" },{ \"gadgetUrl\": \"img//television.jpg\", \"name\": \"television\" },{ \"gadgetUrl\": \"img//washingmachine.jpg\", \"name\": \"washingmachine\" },{ \"gadgetUrl\": \"img//grinder.jpg\", \"name\": \"grinder\" },{ \"gadgetUrl\": \"img//television.jpg\", \"name\": \"television\" },{ \"gadgetUrl\": \"img//washingmachine.jpg\", \"name\": \"washingmachine\" },{ \"gadgetUrl\": \"img//camera.jpg\",\"name\":\"camera\"}  ,{ \"gadgetUrl\": \"img//phone2.jpg\", \"name\": \"phone2\" },  { \"gadgetUrl\": \"img//laptop.jpg\", \"name\": \"laptop\" }]}";
	        }
	        //String product="abdsjk";
	        System.out.println("getBatchListAction result "+product);
	        return product;
	    }


	
	
}