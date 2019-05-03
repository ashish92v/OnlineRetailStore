<%@page import="org.springframework.http.HttpRequest"%>
<%@ page language="java" contentType="text/html;
    pageEncoding=UTF-8"%>
    <%@ taglib prefix="spring"  uri="http://www.springframework.org/tags"%>
 <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
    <%@page import="org.json.JSONObject"%>
    <%@page import="javax.servlet.http.HttpServlet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Phoenix</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css"
    rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
#advantages {
  text-align: center;
}

#advantages .box .icon {
  position: absolute;
  font-size: 120px;
  width: 100%;
  text-align: center;
  top: -20px;
  left: 0;
  height: 100%;
  float: left;
  color: #eee;
  -webkit-transition: all 0.3s;
  transition: all 0.3s;
  z-index: 1;
}

#advantages .box h3 {
  position: relative;
  margin: 0 0 10px;
  font-weight: 300;
  text-transform: uppercase;
  letter-spacing: 0.1em;
  z-index: 2;
}

#advantages .box h3 a:hover {
  text-decoration: none;
}

#advantages .box p {
  position: relative;
  color: #555;
  z-index: 2;
}
</style>

	<link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/quickView/css/reset.css"> <!-- CSS reset --> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/quickView/css/style.css"> <!-- Resource style -->
	<script src="${pageContext.request.contextPath}/quickView/js/modernizr.js"></script> <!-- Modernizr -->
	<script src="${pageContext.request.contextPath}/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 -->

<script>

/*     $(document).ready(function(){
    	  $("button").click(function(){
    	  alert("hey"); 
    	  });
    	}); */
    
</script>

<script>
function productModal(id,product,image,price){
	/* var product="LG";
	var id="LGas";
	var price="352";
 *///function productModal(id,product,image,price){
	/* alert('product'+product);
	alert('image'+image);
	 alert('id'+id);
	alert('price'+price);
	 */
	
var modalCode='  <div class="modal-dialog modal-lg" role="document">'+
	'    <div class="modal-content">'+
	'      <div class="modal-body">'+
	'        <div class="row">'+
	'          <div class="col-lg-5">'+
	'            <!--Carousel Wrapper-->'+
	'            <div id="carousel-thumb" class="carousel slide carousel-fade carousel-thumbnails"'+
	'              data-ride="carousel">'+
	'              <!--Slides-->'+
	'              <div class="carousel-inner" role="listbox">'+
	'                <div class="carousel-item active">'+
	'                  <img class="d-block w-100"'+
	'                    src="${pageContext.request.contextPath}/'+image+'"'+
	'                    alt="First slide">'+
	'                </div>'+
	'                <div class="carousel-item">'+
	'                  <img class="d-block w-100"'+
	'                 src="${pageContext.request.contextPath}/'+image+'"'+
	'                    alt="Second slide">'+
	'                </div>'+
	'                <div class="carousel-item">'+
	'                  <img class="d-block w-100"'+
	'                   src="${pageContext.request.contextPath}/'+image+'"'+
	'                    alt="Third slide">'+
	'                </div>'+
	'              </div>'+
	'              <!--/.Slides-->'+
	'              <!--Controls-->'+
	'              <a class="carousel-control-prev" href="#carousel-thumb" role="button" data-slide="prev">'+
	'                <span class="carousel-control-prev-icon" aria-hidden="true"></span>'+
	'                <span class="sr-only">Previous</span>'+
	'              </a>'+
	'              <a class="carousel-control-next" href="#carousel-thumb" role="button" data-slide="next">'+
	'                <span class="carousel-control-next-icon" aria-hidden="true"></span>'+
	'                <span class="sr-only">Next</span>'+
	'              </a>'+
	'              <!--/.Controls-->'+
	'             </div>'+
	'            <!--/.Carousel Wrapper-->'+
	'          </div>'+
	'          <div class="col-lg-7">'+
	'            <h2 class="h2-responsive product-name">'+
	'              <strong>'+product+'</strong>'+
	'            </h2>'+
	'            <h4 class="h4-responsive">'+
	'              <span class="green-text">'+
	'                <strong>$'+price+'</strong>'+
	'              </span>'+
	'            </h4>'+
	'            <!--Accordion wrapper-->'+
	'            <div class="accordion md-accordion" id="accordionEx" role="tablist" aria-multiselectable="true">'+
	'              <!-- Accordion card -->'+
	'              <div class="card">'+
	'                <!-- Card header -->'+
	'                <div class="card-header" role="tab" id="headingOne1">'+
	'                  <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne1" aria-expanded="true"'+
	'                    aria-controls="collapseOne1">'+
	'                    <h5 class="mb-0">'+
	'                      Collapsible Group Item #1 <i class="fas fa-angle-down rotate-icon"></i>'+
	'                    </h5>'+
	'                  </a>'+
	'                </div>'+
	'                <!-- Card body -->'+
	'                <div id="collapseOne1" class="collapse show" role="tabpanel" aria-labelledby="headingOne1"'+
	'                  data-parent="#accordionEx">'+
	'                  <div class="card-body">'+
	'                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad'+
	'                    squid. 3'+
	'                    wolf moon officia aute,'+
	'                    non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.'+
	'                  </div>'+
	'                </div>'+
	'              </div>'+
	'            </div>'+
	'            <!-- Accordion wrapper -->'+
	'            <!-- Add to Cart -->'+
	'            <div class="card-body">'+
	'              <div class="text-center">'+
	'                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>'+
	'                <button class="btn btn-primary" onclick="addCart(\''+id+'\',\''+product+'\',\''+image+'\',\''+price+'\')">Add to cart'+
//	'                <button class="btn btn-primary" onclick="addCart()">Add to cart'+
	'                  <i class="fas fa-cart-plus ml-2" aria-hidden="true"></i>'+
	'                </button>'+
	'              </div>'+
	'            </div>'+
	'            <!-- /.Add to Cart -->'+
	'          </div>'+
	'        </div>'+
	'      </div>'+
	'    </div>'+
	'  </div>';

	
      document.getElementById("modalQuickView").innerHTML = modalCode;

}

</script>

<script>
	function addCart(cartID,product,image,price){
	// alert("id"+cartID);
	 //alert("test");
//	  $('#cartID').val(id);
	  document.getElementById("cartID").value=cartID;
	  document.getElementById("product").value=product;
	  document.getElementById("image").value=image;
	  document.getElementById("price").value=price;
	//  alert("test");
	 document.cartForm.submit();
    }
</script>

<script>


setInterval(function(){
//	alert("Hello")
	$('#msg1').delay(2000).fadeOut()
	},3000);


</script>

   <script>
   
   $(document).ready(function() {
   //alert("test");
   var initialCode="";
   var htmlCode="";
   var finalCode="";
   var gadgetUrl="";
   var gadgetName="";
   var count=0;
   var dataSize=0;
   var productId='ALL';
   

   
   $.ajax({
	    type : "GET",
	    url  : "getProduct",
	    data :
	    {
	    	productId : productId,	    		
	    },
	    success : function(result){
//	    alert("result1"+result);
	  //  alert(result.length);
	    obj = JSON.parse(result);
	    console.log("obj"+obj);

	  //  alert("test");
		 initialCode='<div class="container">'+
	       '<div class="row">'+
	       '<div class="col-lg-12">'+
	       '<div id="msg1">  <h3style="color:green; text-align:center;" >${msg}</h3></div></div>'+
	       '<div class="col-lg-12">'+
	         '<div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">'+
	           '<ol class="carousel-indicators">'+
	             '<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>'+
	             '<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>'+
	             '<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>'+
	           '</ol>'+
	           '<div class="carousel-inner" role="listbox">'+
	             '<div class="carousel-item active">'+
	               '<img class="d-block img-fluid" src="${pageContext.request.contextPath}/img/drone.jpg" alt="First slide">'+
	             '</div>'+
	             '<div class="carousel-item">'+
	               '<img class="d-block img-fluid"  src="${pageContext.request.contextPath}/img/background.jpg" alt="Second slide">'+
	             '</div>'+
	              '<div class="carousel-item">'+
	               '<img class="d-block img-fluid" src="${pageContext.request.contextPath}/img/drone1.jpg" alt="Third slide">'+
	             '</div>'+
	           '</div>'+
	           '<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">'+
	             '<span class="carousel-control-prev-icon" aria-hidden="true"></span>'+
	             '<span class="sr-only">Previous</span>'+
	           '</a>'+
	           '<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">'+
	             '<span class="carousel-control-next-icon" aria-hidden="true"></span>'+
	             '<span class="sr-only">Next</span>'+
	           '</a>'+
	         '</div>'+
	       '</div>'+
	'</div>'+


	'<div id="advantages" >'+
	         '<div class="container">'+
	           '<div class="row mb-4">'+
	             '<div class="col-md-4">'+
	               '<div class="box clickable d-flex flex-column justify-content-center mb-0 h-100">'+
	                 '<div class="icon"><i class="fa fa-heart"></i></div>'+
	                 '<h3><a href="#">We love our customers</a></h3>'+
	                 '<p class="mb-0">We are known to provide best possible service ever</p>'+
	               '</div>'+
	             '</div>'+
	             '<div class="col-md-4">'+
	               '<div class="box clickable d-flex flex-column justify-content-center mb-0 h-100">'+
	                 '<div class="icon"><i class="fa fa-tags"></i></div>'+
	                 '<h3><a href="#">Best prices</a></h3>'+
	                 '<p class="mb-0">You can check that the height of the boxes adjust when longer text like this one is used in one of them.</p>'+
	               '</div>'+
	             '</div>'+
	             '<div class="col-md-4">'+
	              ' <div class="box clickable d-flex flex-column justify-content-center mb-0 h-100">'+
	                ' <div class="icon"><i class="fa fa-thumbs-up"></i></div>'+
	                 '<h3><a href="#">100% satisfaction guaranteed</a></h3>'+
	                 '<p class="mb-0">Free returns on everything for 3 months.</p>'+
	               '</div>'+
	             '</div>'+
	           '</div>'+
	         '</div>'+
	       '</div>'+



	'<br><br><br>'+

		'<ul class="cd-items cd-container">';
	  	  
	//alert("json***********************"+obj);
	 for (i in obj.gadget) {
	//  	alert("json***********************"+ obj.gadget[i].gadgetUrl);
		//count++;
	  	gadgetId=obj.gadget[i].gadgetId;
       gadgetName=obj.gadget[i].gadgetName;
       gadgetUrl=obj.gadget[i].gadgetUrl;
       gadgetPrice=obj.gadget[i].gadgetPrice;

      // alert("gadgetUrl"+gadgetUrl);
	  htmlCode= htmlCode+'<li class="cd-item"><img src="${pageContext.request.contextPath}/'+gadgetUrl+'" alt="Item Preview">'+
    	'<a href="#0" class="cd-trigger" data-toggle="modal" data-target="#modalQuickView" onclick="productModal(\''+gadgetId+'\',\''+gadgetName+'\',\''+gadgetUrl+'\',\''+gadgetPrice+'\')">Quick View</a></li>';

  	      finalCode=initialCode+htmlCode+'</ul></div>';
  	  //    alert("FinalHtmlCode"+finalCode);
  	      
  	      document.getElementById("demo").innerHTML = finalCode;
	 }
	 }
	  }); 

   
   })
   </script>
   
   <script type="text/javascript">

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
	  	 
//	 alert("productId"+productId);

	 
	   $.ajax({
		    type : "GET",
		    url  : "getProduct",
		    data :
		    {
		    	productId : productId,	    		
		    },
		    success : function(result){
//		    alert("result1"+result);
		  //  alert(result.length);
		    obj = JSON.parse(result);
		    console.log("obj"+obj);

		  //  alert("test");
			 initialCode='<div class="container">'+
		       '<div class="row">'+
		       '<div class="col-lg-12">'+
		         '<div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">'+
		           '<ol class="carousel-indicators">'+
		             '<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>'+
		             '<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>'+
		             '<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>'+
		           '</ol>'+
		           '<div class="carousel-inner" role="listbox">'+
		             '<div class="carousel-item active">'+
		               '<img class="d-block img-fluid" src="${pageContext.request.contextPath}/img/drone.jpg" alt="First slide">'+
		             '</div>'+
		             '<div class="carousel-item">'+
		               '<img class="d-block img-fluid"  src="${pageContext.request.contextPath}/img/background.jpg" alt="Second slide">'+
		             '</div>'+
		              '<div class="carousel-item">'+
		               '<img class="d-block img-fluid" src="${pageContext.request.contextPath}/img/drone1.jpg" alt="Third slide">'+
		             '</div>'+
		           '</div>'+
		           '<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">'+
		             '<span class="carousel-control-prev-icon" aria-hidden="true"></span>'+
		             '<span class="sr-only">Previous</span>'+
		           '</a>'+
		           '<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">'+
		             '<span class="carousel-control-next-icon" aria-hidden="true"></span>'+
		             '<span class="sr-only">Next</span>'+
		           '</a>'+
		         '</div>'+
		       '</div>'+
		'</div>'+


		'<div id="advantages" >'+
		         '<div class="container">'+
		           '<div class="row mb-4">'+
		             '<div class="col-md-4">'+
		               '<div class="box clickable d-flex flex-column justify-content-center mb-0 h-100">'+
		                 '<div class="icon"><i class="fa fa-heart"></i></div>'+
		                 '<h3><a href="#">We love our customers</a></h3>'+
		                 '<p class="mb-0">We are known to provide best possible service ever</p>'+
		               '</div>'+
		             '</div>'+
		             '<div class="col-md-4">'+
		               '<div class="box clickable d-flex flex-column justify-content-center mb-0 h-100">'+
		                 '<div class="icon"><i class="fa fa-tags"></i></div>'+
		                 '<h3><a href="#">Best prices</a></h3>'+
		                 '<p class="mb-0">You can check that the height of the boxes adjust when longer text like this one is used in one of them.</p>'+
		               '</div>'+
		             '</div>'+
		             '<div class="col-md-4">'+
		              ' <div class="box clickable d-flex flex-column justify-content-center mb-0 h-100">'+
		                ' <div class="icon"><i class="fa fa-thumbs-up"></i></div>'+
		                 '<h3><a href="#">100% satisfaction guaranteed</a></h3>'+
		                 '<p class="mb-0">Free returns on everything for 3 months.</p>'+
		               '</div>'+
		             '</div>'+
		           '</div>'+
		         '</div>'+
		       '</div>'+



		'<br><br><br>'+

			'<ul class="cd-items cd-container">';
		  	  
	//	alert("json***********************"+obj);
		 for (i in obj.gadget) {
		//  	alert("json***********************"+ obj.gadget[i].gadgetUrl);
			//count++;
		  	gadgetId=obj.gadget[i].gadgetId;
	       gadgetName=obj.gadget[i].gadgetName;
	       gadgetUrl=obj.gadget[i].gadgetUrl;
	       gadgetPrice=obj.gadget[i].gadgetPrice;

	  //     alert("gadgetUrl"+gadgetUrl);
		  htmlCode= htmlCode+'<li class="cd-item"><img src="${pageContext.request.contextPath}/'+gadgetUrl+'" alt="Item Preview">'+
	    	'<a href="#0" class="cd-trigger" data-toggle="modal" data-target="#modalQuickView" onclick="productModal(\''+gadgetId+'\',\''+gadgetName+'\',\''+gadgetUrl+'\',\''+gadgetPrice+'\')">Quick View</a></li>';

	    	finalCode=initialCode+htmlCode+'</ul></div>';
  
	  	      document.getElementById("demo").innerHTML = finalCode;
		 }
		 }
		  }); 

	   
	   }
	 
    </script>
</head>



  <body>

<nav class="navbar navbar-expand navbar-dark bg-dark">
        <a href="#" class="navbar-brand"><H2>Phoenix</H2></a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false">
            <span class="navbar-toggler-icon"></span>
        </button>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <br>
        <div></div>
        <div>
      
      
        
        <form  method="get" class="form-inline my-2 mylg-0">
                   <input type="search" name="productId" id="productId" class="form-control mr-sm-2" placeholder="search product" aria-label="Buscar">
		           <input type="hidden" name="producthidden" id="producthidden" class="form-control mr-sm-2"  aria-label="Buscar">
           <input class="btn btn-primary" type="button" onclick="searchProduct()" value="Search">
         </form></div>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
        </ul>
                    
        
        <div><br><br>&nbsp&nbsp&nbsp&nbsp</div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <ul class="navbar-nav mr-auto">
                <a href="#" class="nav-item active nav-link">Home</a>
                <a href="aboutus" class="nav-item active nav-link">About us</a>


                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle active" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Profile</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a href="saveAccount" class="dropdown-item">My Account</a>
                        <a href="cart" class="dropdown-item">Order</a>
                        <a href="login" class="dropdown-item">Login</a>
                    </div>
                </li>
  
 		 <c:choose>
  				<c:when test="${user.equals('Guest')}">
                    <a class="nav-item active nav-link">Hello Guest</a>
  				
  				</c:when>
  			
  				<c:otherwise>			
                 <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle active" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Hello ${user}</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a href="logout" class="dropdown-item">Logout</a>
                    </div>
                </li>
                </c:otherwise>
  		</c:choose>
	
                
           </ul>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
   <div id="basket-overview" class="navbar-collapse collapse d-none d-lg-block"><a href="cart" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span>${count} items in cart</span></a></div>
     
        </div>
    </nav>

<div id=demo></div>

<div  style="visibility: hidden" id="modalCart" >
<form method="GET" id="cartForm" name ="cartForm" action="AddInCart" class="form-inline my-2 mylg-0">
   <input type="hidden" name="cartID" id="cartID" class="form-control mr-sm-2"  aria-label="Buscar">
   <input type="hidden" name="product" id="product" class="form-control mr-sm-2"  aria-label="Buscar">
   <input type="hidden" name="image" id="image" class="form-control mr-sm-2"  aria-label="Buscar">
   <input type="hidden" name="price" id="price" class="form-control mr-sm-2"  aria-label="Buscar">
</form>

</div>

<!-- Modal: modalQuickView -->
<div class="modal fade" id="modalQuickView" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <div class="row">
          <div class="col-lg-5">
            <!--Carousel Wrapper-->
            <div id="carousel-thumb" class="carousel slide carousel-fade carousel-thumbnails"
              data-ride="carousel">
              <!--Slides-->
              <div  class="carousel-inner" role="listbox">
                <div class="carousel-item active">
                  <img class="d-block w-100" 
                    src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/img%20(23).jpg"
                    alt="First slide">
                </div>
                <div class="carousel-item">
                  <img class="d-block w-100"
                    src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/img%20(24).jpg"
                    alt="Second slide">
                </div>
                <div class="carousel-item">
                  <img class="d-block w-100"
                    src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/img%20(25).jpg"
                    alt="Third slide">
                </div>
              </div>
              <!--/.Slides-->
              <!--Controls-->
              <a class="carousel-control-prev" href="#carousel-thumb" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#carousel-thumb" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
              <!--/.Controls-->
             </div>
            <!--/.Carousel Wrapper-->
          </div>
          <div class="col-lg-7">
            <h2 class="h2-responsive product-name">
              <strong>Product Name</strong>
            </h2>
            <h4 class="h4-responsive">
              <span class="green-text">
                <strong>$49</strong>
              </span>
              <span class="grey-text">
                <small>
                  <s>$89</s>
                </small>
              </span>
            </h4>

            <!--Accordion wrapper-->
            <div class="accordion md-accordion" id="accordionEx" role="tablist" aria-multiselectable="true">

              <!-- Accordion card -->
              <div class="card">

                <!-- Card header -->
                <div class="card-header" role="tab" id="headingOne1">
                  <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne1" aria-expanded="true"
                    aria-controls="collapseOne1">
                    <h5 class="mb-0">
                      Collapsible Group Item #1 <i class="fas fa-angle-down rotate-icon"></i>
                    </h5>
                  </a>
                </div>

                <!-- Card body -->
                <div id="collapseOne1" class="collapse show" role="tabpanel" aria-labelledby="headingOne1"
                  data-parent="#accordionEx">
                  <div class="card-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad
                    squid. 3
                    wolf moon officia aute,
                    non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
                  </div>
                </div>

              </div>
            </div>
            <!-- Accordion wrapper -->


            <!-- Add to Cart -->
            <div class="card-body">
              <div class="text-center">

                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button class="btn btn-primary">Add to cart
                  <i class="fas fa-cart-plus ml-2" aria-hidden="true"></i>
                </button>
              </div>
            </div>
            <!-- /.Add to Cart -->
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


    <!-- /.container -->

    <!-- Footer -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Phoenix 2018</p>
      </div>
    </footer>

    <!-- Bootstrap core JavaScript -->
  
  </body>

</html>
