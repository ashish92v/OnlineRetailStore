<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!-- <script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script type="text/javascript"  src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!------ Include the above in your HEAD tag ---------->
<script src="${pageContext.request.contextPath}/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/onlineretail.js"></script>

<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>


<script type="text/javascript">
function isNotEmpty(inputId, errorMsg) {
	   var inputElement = document.getElementById(inputId);
	   var errorElement = document.getElementById(inputId + "Error");
	   var inputValue = inputElement.value.trim();
	   var isValid = (inputValue.length != 0);  // boolean
	   showMessage(isValid, inputElement, errorMsg, errorElement);
	   return isValid;
	}



</script>


<style>
 body {
  font-family: Arial;
}

* {
  box-sizing: border-box;
}

form.example input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 80%;
  background: #f1f1f1;
}

form.example button {
  float: left;
  width: 40%;
  padding: 10px;
  background: #2196F3;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none;
  cursor: pointer;
}

form.example button:hover {
  background: #0b7dda;
}

form.example::after {
  content: "";
  clear: both;
  display: table;
}
</style>

<style type="text/css">



.login_box_area .login_box_img {
  margin-right: -30px;
  position: relative; }
  .login_box_area .login_box_img img {
    width: 100%; }
  .login_box_area .login_box_img:before {
    position: absolute;
    left: 0;
    top: 0;
    height: 100%;
    width: 100%;
    content: "";
    background: #000;
    opacity: .5; }
  .login_box_area .login_box_img .hover {
    position: absolute;
    top: 50%;
    left: 0px;
    text-align: center;
    width: 100%;
    transform: translateY(-50%); }
    .login_box_area .login_box_img .hover h4 {
      font-size: 24px;
      color: #fff;
      margin-bottom: 15px; }
    .login_box_area .login_box_img .hover p {
      max-width: 380px;
      margin: 0px auto 25px;
      color: #fff; }
    .login_box_area .login_box_img .hover .primary-btn {
      border-radius: 0px;
      line-height: 38px;
      text-transform: uppercase; }
      .login_box_area .login_box_img .hover .primary-btn:hover:before {
        left: 260px; }

.login_form_inner {
  box-shadow: 0px 10px 30px 0px rgba(0, 0, 0, 0.07);
  height: 100%;
  text-align: center;
  padding-top: 115px; }
  .login_form_inner h3 {
    color: #222222;
    text-transform: uppercase;
    font-size: 18px;
    margin-bottom: 30px; }
  .login_form_inner .login_form {
    max-width: 385px;
    margin: auto; }
  .login_form_inner.reg_form {
    padding-top: 60px; }
    .login_form_inner.reg_form h3 {
      margin-bottom: 70px; }

.login_form .form-group input {
  height: 54px;
  border: none;
  border-bottom: 1px solid #cccccc;
  border-radius: 0px;
  outline: none;
  box-shadow: none; }
.login_form .form-group .creat_account {
  margin-top: 10px;
  margin-bottom: 15px;
  text-align: left; }
  .login_form .form-group .creat_account input {
    height: auto;
    margin-right: 10px; }
.login_form .form-group .primary-btn {
  display: block;
  border-radius: 0px;
  line-height: 38px;
  width: 100%;
  text-transform: uppercase;
  border: none; }
  .login_form .form-group .primary-btn:hover:before {
    left: 370px; }
.login_form .form-group a {
  font-size: 14px;
  color: #777777;
  font-family: "Roboto", sans-serif;
  margin-top: 20px;
  display: block; }

				</style>


<%-- 	<link rel="stylesheet" href="${pageContext.request.contextPath}/newResource/css/linearicons.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/newResource/css/owl.carousel.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/newResource/css/themify-icons.css">
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/newResource/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/newResource/css/nice-select.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/newResource/css/nouislider.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/newResource/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/newResource/css/main.css">
 --%>



<script>

/*     $(document).ready(function(){
    	  $("button").click(function(){
    	  document.contactForm.loginButton.value;
                  form1.submit()
    		  
    		  
    		  alert("hey"); 
    	  });
    	});
 */    
    function checkLoginCredentials(){
    	alert("hey");
    	if(isNotEmpty('username', 'Please enter username.'))
    	{
   		if(isNotEmpty('password', 'Please enter password.'))
    	{
   		document.checklogin.submit();
    	}
   		}
    	return false;
    	
    }
    
    
    
    
</script>



   <script>
   
   
   function searchProduct(){
	   var initialCode="";
	   var htmlCode="";
	   var finalCode="";
	   var gadgetUrl="";
	   var gadgetName="";
	   var count=0;
	   var dataSize=0;

     
	 var productId=document.getElementById('productId').value;
	 
	 if(productId==null || productId==""){    
		 productId="ALL";
	 }
	  	 
	 alert("productId"+productId);
	 
     $.ajax({
	    type : "GET",
	    url  : "getProduct",
	    data :
	    {
	    	productId : productId,	    		
	    },
	    success : function(result){
	//    alert("result1"+result);
	 //   alert(result.length);
	    obj = JSON.parse(result);
	    console.log("obj"+obj);

		  var size = Object.size(obj);
		    console.log("obj"+size);
	//	    alert("size"+size);
	    
	    
		 initialCode='<div class="col-lg-2">'+
        '<div class="dropdown">'+
    '<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'+
      'Category'+
   '</button>'+
   '<div class="dropdown-menu" aria-labelledby="dropdownMenu2">'+
      '<button class="dropdown-item" type="button">Mobile</button>'+
       '<div class="dropdown-divider"></div>'+
     '<button class="dropdown-item" type="button">Laptop</button>'+
       '<div class="dropdown-divider"></div>'+
      '<button class="dropdown-item" type="button">Television</button>'+
   '</div>'+
  '</div></div>';

//	alert("json***********************"+obj);
	 for (i in obj.gadget) {
	 // 	alert("json***********************"+ obj.gadget[i].gadgetUrl);
		var dataSize=dataSize+i;
		count++;
	  	gadgetUrl=obj.gadget[i].gadgetUrl;
        gadgetName=obj.gadget[i].name;

//        alert("gadgetUrl"+gadgetUrl+"  gadgetName   "+gadgetName);
           
          htmlCode= htmlCode+'<div class="col-lg-3 col-md-2 mb-2">'+
              '<div class="card h-100">'+
                '<a href="#"><img class="card-img-top" src="${pageContext.request.contextPath}/'+gadgetUrl+
                '"alt=""></a>'+
                '<div class="card-body"> <h4 class="card-title">'+
                    '<a href="#">'+ gadgetName+'</a>'+
                  '</h4> </div> </div> </div> ';
               
                  if((count%3)==0){
                    htmlCode=htmlCode+  '<div class="col-lg-2"></div>';
                  }
        }

       finalCode=initialCode+htmlCode;
       alert("FinalHtmlCode"+finalCode);
      document.getElementById("demo").innerHTML = finalCode;
}


	  }); 
 	}
     
      
    </script>
 


</head>
<body>
<nav class="navbar navbar-expand navbar-dark bg-dark">
        <a href="shop" class="navbar-brand"><H2>Phoenix</H2></a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false">
            <span class="navbar-toggler-icon"></span>
        </button>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <br>
        <div></div>
        <div>
      		
        
        <form action="#" method="get" class="form-inline my-2 mylg-0">
                <input type="search" name="productId" id="productId" class="form-control mr-sm-2" placeholder="search product" aria-label="Buscar">
                <input type="hidden" name="producthidden" id="producthidden" class="form-control mr-sm-2"  aria-label="Buscar">
                <button class="btn btn-primary" type="submit" onclick="return searchProduct();" >Search</button>
        </form></div>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
        </ul>
                    
        
        <div><br><br>&nbsp&nbsp&nbsp&nbsp</div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp

            <ul class="navbar-nav mr-auto">
                <a href="shop" class="nav-item active nav-link">Home</a>
                <a href="aboutus" class="nav-item active nav-link">About us</a>


                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle active" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Profile</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a href="saveAccount" class="dropdown-item">My Account</a>
                        <a href="#" class="dropdown-item">Order</a>
                        <a href="#" class="dropdown-item">Login</a>
                    </div>
                </li>
            </ul>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
   <div id="basket-overview" class="navbar-collapse collapse d-none d-lg-block"><a href="cart" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span>3 items in cart</span></a></div>
        
        </div>
    </nav>
    <br><br>

    
<section class="login_box_area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<img class="img-fluid" src="${pageContext.request.contextPath}/img/familySpeaker.jpg" alt="">
						<div class="hover">
							<h4>New to Phoenix?</h4>
							
							<a class="primary-btn" href="register">Create an Account</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>Log in to enter</h3>
						<form class="row login_form" action="checklogin" method="POST" name="checklogin"  id="checklogin" novalidate="novalidate">
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="username" name="username" placeholder="Username" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username'">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="password" name="password" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'">
							</div>
							<div class="col-md-12 form-group">
								<div class="creat_account">
									<input type="checkbox" id="f-option2" name="selector">
									<label for="f-option2">Keep me logged in</label>
								</div>
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" id="loginButton"  name="loginButton" class="primary-btn" onclick="return checkLoginCredentials();">Log In</button>
								<a href="#">Forgot Password?</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
<div><br><br></div>
            <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Phoenix 2019</p>
      </div>
    </footer>
    
</body>
</html>                            