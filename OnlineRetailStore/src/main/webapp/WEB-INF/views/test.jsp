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

<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>


<script type="text/javascript">


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


<script>

    $(document).ready(function(){
    	  $("button").click(function(){
    	  alert("hey"); 
    	  });
    	});
    
</script>



   <script>
   
   $(document).ready(function() {
   
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
	  //  alert("result1"+result);
	  //  alert(result.length);
	    obj = JSON.parse(result);
	    console.log("obj"+obj);

	    
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
	//  	alert("json***********************"+ obj.gadget[i].gadgetUrl);
		count++;
	  	gadgetUrl=obj.gadget[i].gadgetUrl;
       gadgetName=obj.gadget[i].name;

  //     alert("gadgetUrl"+gadgetUrl+"  gadgetName   "+gadgetName);
          
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
    //  alert("FinalHtmlCode"+finalCode);
     document.getElementById("demo").innerHTML = finalCode;
}


	  }); 

   })
   
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
        <a href="index.html" class="navbar-brand"><H2>Phoenix</H2></a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false">
            <span class="navbar-toggler-icon"></span>
        </button>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <br>
        <div></div>
        <div>
      		
        
        <form action="#" method="get" class="form-inline my-2 mylg-0">
                <input type="search" name="productId" id="productId" class="form-control mr-sm-2" placeholder="Buscar em todo o site" aria-label="Buscar">
                <input type="hidden" name="producthidden" id="producthidden" class="form-control mr-sm-2" placeholder="Buscar em todo o site" aria-label="Buscar">
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
                <a href="#" class="nav-item active nav-link">Home</a>
                <a href="aboutus" class="nav-item active nav-link">About us</a>


                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle active" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Profile</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a href="#" class="dropdown-item">My Account</a>
                        <a href="#" class="dropdown-item">Order</a>
                        <a href="login" class="dropdown-item">Login</a>
                    </div>
                </li>
            </ul>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
   <div id="basket-overview" class="navbar-collapse collapse d-none d-lg-block"><a href="cart" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span>3 items in cart</span></a></div>
        
        </div>
    </nav>
    
     <div class="container">
      <div class="row">
        <!-- /.col-lg-3 -->
        <div class="col-lg-12">
          <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="carousel-item active">
                <img class="d-block img-fluid" src="${pageContext.request.contextPath}/img/drone.jpg" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid"  src="${pageContext.request.contextPath}/img/background.jpg" alt="Second slide">
              </div>
               <div class="carousel-item">
                <img class="d-block img-fluid" src="${pageContext.request.contextPath}/img/drone1.jpg" alt="Third slide">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
        </div>
</div>


<div id="advantages" >
          <div class="container">
            <div class="row mb-4">
              <div class="col-md-4">
                <div class="box clickable d-flex flex-column justify-content-center mb-0 h-100">
                  <div class="icon"><i class="fa fa-heart"></i></div>
                  <h3><a href="#">We love our customers</a></h3>
                  <p class="mb-0">We are known to provide best possible service ever</p>
                </div>
              </div>
              <div class="col-md-4">
                <div class="box clickable d-flex flex-column justify-content-center mb-0 h-100">
                  <div class="icon"><i class="fa fa-tags"></i></div>
                  <h3><a href="#">Best prices</a></h3>
                  <p class="mb-0">You can check that the height of the boxes adjust when longer text like this one is used in one of them.</p>
                </div>
              </div>
              <div class="col-md-4">
                <div class="box clickable d-flex flex-column justify-content-center mb-0 h-100">
                  <div class="icon"><i class="fa fa-thumbs-up"></i></div>
                  <h3><a href="#">100% satisfaction guaranteed</a></h3>
                  <p class="mb-0">Free returns on everything for 3 months.</p>
                </div>
              </div>
            </div>
            <!-- /.row-->
          </div>
          <!-- /.container-->
        </div>



<br><br><br><br><br><br>






          <div id="demo" class="row">


          <!-- <h3 class="my-4">Shop Name</h1>
          --><!--  <div class="list-group">
            <a href="#" class="list-group-item">Category 1</a>
            <a href="#" class="list-group-item">Category 2</a>
            <a href="#" class="list-group-item">Category 3</a>
          </div>
          -->


          <!-- <div class="btn-group">
  <button class="btn btn-secondary btn-lg" type="button">
    Category
  </button>
  <button type="button" class="btn btn-lg btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <span class="sr-only">Toggle Dropdown</span>
  </button>
  <div class="dropdown-menu">
     <a class="dropdown-item" href="#">Camera</a>
    <a class="dropdown-item" href="#">Mobile Phone</a>
    <a class="dropdown-item" href="#">Laptop</a>
    <a class="dropdown-item" href="#">Television</a>
  </div>
</div> -->


<!-- 	<div class="col-lg-"></div> -->


</div>

          </div>
    
    
            <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Phoenix 2019</p>
      </div>
    </footer>
    
</body>
</html>                            