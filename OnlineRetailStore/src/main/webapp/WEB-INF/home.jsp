<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

  <head>
<title>Phoenix </title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">


    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/shop-homepage.css" rel="stylesheet">



    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#">Phoenix</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">

          <form class="form-inline my-2 my-lg-0"  method="get">
              <input class="form-control mr-sm-2" id="productId" type="search" placeholder="Search" aria-label="Search">
              <input class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="return searchProduct();" >
            </form>​


          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Contact</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

        <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script>

var initialCode="";
var htmlCode="";
var finalCode="";
var gadgetUrl="";
var gadgetName="";
var count=0;


// function searchProduct(){
//   console.log("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
//   var productName=document.getElementById('productId').value;
//   $('#productId').val(productName);
//
// $.ajax({
//   url: "http://localhost:5000/api/searchItem",  // the local Node server
//   method: 'GET',
//   success: function(data){
//       console.log("xyz"+data.length); //display data in cosole to see if I receive it
//
//            initialCode='<div class="col-lg-2">'+
//                 '<div class="dropdown">'+
//             '<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'+
//               'Category'+
//             '</button>'+
//             '<div class="dropdown-menu" aria-labelledby="dropdownMenu2">'+
//               '<button class="dropdown-item" type="button">Mobile</button>'+
//                '<div class="dropdown-divider"></div>'+
//               '<button class="dropdown-item" type="button">Laptop</button>'+
//                '<div class="dropdown-divider"></div>'+
//               '<button class="dropdown-item" type="button">Television</button>'+
//             '</div>'+
//           '</div></div>';
//
//           for(i=0;i<data.length;i++){
//             count++;
//             console.log("count value"+count);
//             console.log("data.length"+data.length);
//             console.log(i);
//
//               console.log("gadgetUrl"+data[i].gadgetUrl);
//               console.log("name"+data[i].name);
//
//                 gadgetUrl=data[i].gadgetUrl;
//                gadgetName=data[i].name;
//
//                htmlCode= htmlCode+'<div class="col-lg-3 col-md-2 mb-2">'+
//                   '<div class="card h-100">'+
//                     '<a href="#"><img class="card-img-top" src="'+gadgetUrl+
//                     '"alt=""></a>'+
//                     '<div class="card-body"> <h4 class="card-title">'+
//                         '<a href="#">'+ gadgetName+'</a>'+
//                       '</h4> </div> </div> </div> ';
//                       console.log("gadgetUrl   "+gadgetUrl +" gadgetName   "+     gadgetName);
//
//                       console.log("count number"+count);
//                       if((count%3)==0 && count<data.length){
//                         console.log(count%3==0);
//                         console.log("counter==============="+count);
//                         htmlCode=htmlCode+  '<div class="col-lg-2"></div>';
//
//                       }
//             }
//
//            finalCode=initialCode+htmlCode;
//            console.log("FinalHtmlCode"+finalCode);
//           document.getElementById("demo").innerHTML = finalCode;
//
//   }
//
// });
// });
// }
//
// </script>


    <script>

      var initialCode="";
      var htmlCode="";
      var finalCode="";
      var gadgetUrl="";
      var gadgetName="";
      var count=0;

      console.log("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
      var productName=document.getElementById('productId').value;

      $(document).ready(function(){
        $.ajax({
          url: "http://localhost:5000/electronics",  // the local Node server
          method: 'GET',
          success: function(data){
              console.log("xyz"+data.length); //display data in cosole to see if I receive it

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

                  for(i=0;i<data.length;i++){
                    count++;
                    console.log("count value"+count);
                    console.log("data.length"+data.length);
                    console.log(i);

                      console.log("gadgetUrl"+data[i].gadgetUrl);
                      console.log("name"+data[i].name);

                        gadgetUrl=data[i].gadgetUrl;
                       gadgetName=data[i].name;

                       htmlCode= htmlCode+'<div class="col-lg-3 col-md-2 mb-2">'+
                          '<div class="card h-100">'+
                            '<a href="#"><img class="card-img-top" src="'+gadgetUrl+
                            '"alt=""></a>'+
                            '<div class="card-body"> <h4 class="card-title">'+
                                '<a href="#">'+ gadgetName+'</a>'+
                              '</h4> </div> </div> </div> ';
                              console.log("gadgetUrl   "+gadgetUrl +" gadgetName   "+     gadgetName);

                              console.log("count number"+count);
                              if((count%3)==0 && count<data.length){
                                console.log(count%3==0);
                                console.log("counter==============="+count);
                                htmlCode=htmlCode+  '<div class="col-lg-2"></div>';

                              }
                    }

                   finalCode=initialCode+htmlCode;
                   console.log("FinalHtmlCode"+finalCode);
                  document.getElementById("demo").innerHTML = finalCode;

          }

  });
  });

</script>


</head>



  <body>


    <!-- Page Content -->
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
                <img class="d-block img-fluid" src="img/drone.jpg" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid"  src="img/background.jpg" alt="Second slide">
              </div>
               <div class="carousel-item">
                <img class="d-block img-fluid" src="img/drone1.jpg" alt="Third slide">
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
          <!-- /.row -->

      <!--   </div>
       -->  <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->

    <!-- /.container -->

    <!-- Footer -->

     <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/shop-homepage.css" rel="stylesheet">
    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Phoenix 2018</p>
      </div>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
