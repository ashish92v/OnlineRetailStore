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

<style type="text/css">


<style>
.box {
  background: #fff;
  margin: 0 0 30px;
  border: solid 1px #e6e6e6;
  padding: 20px;
  -webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.1);
  box-shadow: 0 1px 5px rgba(0, 0, 0, 0.1);
}

.box .box-header {
  clear: both;
  background: #f7f7f7;
  margin: -20px -20px 20px;
  padding: 20px;
  border-bottom: solid 1px #eee;
}

.box .box-footer {
  clear: both;
  background: #f7f7f7;
  margin: 30px -20px -20px;
  padding: 20px;
  border-top: solid 1px #eee;
}

@media (max-width: 767.98px) {
  .box .box-footer .btn {
    margin-bottom: 20px;
  }
}

.box.slideshow {
  padding: 20px 0 0 0;
  text-align: center;
}

.box.slideshow h3 {
  text-transform: uppercase;
  letter-spacing: 0.1em;
  font-weight: 700;
}


</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<script>

    $(document).ready(function(){
    	  $("button").click(function(){
    	  alert("hey"); 
    	  });
    	});
    
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
                <input type="hidden" name="producthidden" id="producthidden" class="form-control mr-sm-2" aria-label="Buscar">
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
                        <a href="login" class="dropdown-item">Login</a>
                    </div>
                </li>
            </ul>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
   <div id="basket-overview" class="navbar-collapse collapse d-none d-lg-block"><a href="#" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span>3 items in cart</span></a></div>
        
        </div>
    </nav>
    <br><br>

<div><br></div>
<br>
<div id="all">
      <div id="content">
        <div class="container">
          <div class="row">
          
            <div id="basket" class="col-lg-9">
              <div class="box">
                <form method="post" action="checkout1.html">
                  <h1>Shopping cart</h1>
                  <p class="text-muted">You currently have 3 item(s) in your cart.</p>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th colspan="2">Product</th>
                          <th>Quantity</th>
                          <th>Unit price</th>
                          <th>Discount</th>
                          <th colspan="2">Total</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td><a href="#"><img src="img/detailsquare.jpg" alt="White Blouse Armani"></a></td>
                          <td><a href="#">White Blouse Armani</a></td>
                          <td>
                            <input type="number" value="2" class="form-control">
                          </td>
                          <td>$123.00</td>
                          <td>$0.00</td>
                          <td>$246.00</td>
                          <td><a href="#"><i class="fa fa-trash-o"></i></a></td>
                        </tr>
                        <tr>
                          <td><a href="#"><img src="img/basketsquare.jpg" alt="Black Blouse Armani"></a></td>
                          <td><a href="#">Black Blouse Armani</a></td>
                          <td>
                            <input type="number" value="1" class="form-control">
                          </td>
                          <td>$200.00</td>
                          <td>$0.00</td>
                          <td>$200.00</td>
                          <td><a href="#"><i class="fa fa-trash-o"></i></a></td>
                        </tr>
                      </tbody>
                      <tfoot>
                        <tr>
                          <th colspan="5">Total</th>
                          <th colspan="2">$446.00</th>
                        </tr>
                      </tfoot>
                    </table>
                  </div>
                  <!-- /.table-responsive-->
                  <div class="box-footer d-flex justify-content-between flex-column flex-lg-row">
                    <div class="left"><a href="shop" class="btn btn-outline-secondary"><i class="fa fa-chevron-left"></i> Continue shopping</a></div>
                    <div class="right">
                      <button class="btn btn-outline-secondary"><i class="fa fa-refresh"></i> Update cart</button>
                      <button type="submit" class="btn btn-primary">Proceed to checkout <i class="fa fa-chevron-right"></i></button>
                    </div>
                  </div>
                </form>
              </div>
              <!-- /.box-->
              
            </div>
            <!-- /.col-lg-9-->
            <div class="col-lg-3">
              <div id="order-summary" class="box">
                <div class="box-header">
                  <h3 class="mb-0">Order summary</h3>
                </div>
                <p class="text-muted">Shipping and additional costs are calculated based on the values you have entered.</p>
                <div class="table-responsive">
                  <table class="table">
                    <tbody>
                      <tr>
                        <td>Order subtotal</td>
                        <th>$446.00</th>
                      </tr>
                      <tr>
                        <td>Shipping and handling</td>
                        <th>$10.00</th>
                      </tr>
                      <tr>
                        <td>Tax</td>
                        <th>$0.00</th>
                      </tr>
                      <tr class="total">
                        <td>Total</td>
                        <th>$456.00</th>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            
            </div>
            <!-- /.col-md-3-->
          </div>
        </div>
      </div>
    </div>
    






<div><br><br></div>    
        <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Phoenix 2019</p>
      </div>
    </footer>



</body>
</html>                            
