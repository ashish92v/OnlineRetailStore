<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
	/* $(document).ready(function() {
	$('.mdb-select').materialSelect();
	});
	 */
</script>

<script>
    $(document).ready(function(){
    	  alert("hey");
    	var finalCode=
    		
    		'<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalQuickView">Launch'+
    		'  modal</button>'+
    		'<!-- Modal: modalQuickView -->'+
    		'<div class="modal fade" id="modalQuickView" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"'+
    		'  aria-hidden="true">'+
    		'  <div class="modal-dialog modal-lg" role="document">'+
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
    		'                    src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/img%20(23).jpg"'+
    		'                    alt="First slide">'+
    		'                </div>'+
    		'                <div class="carousel-item">'+
    		'                  <img class="d-block w-100"'+
    		'                    src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/img%20(24).jpg"'+
    		'                    alt="Second slide">'+
    		'                </div>'+
    		'                <div class="carousel-item">'+
    		'                  <img class="d-block w-100"'+
    		'                    src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/img%20(25).jpg"'+
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
    		'              <strong>Product Name</strong>'+
    		'            </h2>'+
    		'            <h4 class="h4-responsive">'+
    		'              <span class="green-text">'+
    		'                <strong>$49</strong>'+
    		'              </span>'+
    		'              <span class="grey-text">'+
    		'                <small>'+
    		'                  <s>$89</s>'+
    		'                </small>'+
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
    		'                <button class="btn btn-primary">Add to cart'+
    		'                  <i class="fas fa-cart-plus ml-2" aria-hidden="true"></i>'+
    		'                </button>'+
    		'              </div>'+
    		'            </div>'+
    		'            <!-- /.Add to Cart -->'+
    		'          </div>'+
    		'        </div>'+
    		'      </div>'+
    		'    </div>'+
    		'  </div>'+
    		'</div>';
    	  
    	  
          
          document.getElementById("demo").innerHTML = finalCode;

    	});
    
</script>


</head>
<body>

<div id="demo"></div>
<!-- 
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalQuickView">Launch
  modal</button>
Modal: modalQuickView
<div class="modal fade" id="modalQuickView" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <div class="row">
          <div class="col-lg-5">
            Carousel Wrapper
            <div id="carousel-thumb" class="carousel slide carousel-fade carousel-thumbnails"
              data-ride="carousel">
              Slides
              <div class="carousel-inner" role="listbox">
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
              /.Slides
              Controls
              <a class="carousel-control-prev" href="#carousel-thumb" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#carousel-thumb" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
              /.Controls
             </div>
            /.Carousel Wrapper
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

            Accordion wrapper
            <div class="accordion md-accordion" id="accordionEx" role="tablist" aria-multiselectable="true">

              Accordion card
              <div class="card">

                Card header
                <div class="card-header" role="tab" id="headingOne1">
                  <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne1" aria-expanded="true"
                    aria-controls="collapseOne1">
                    <h5 class="mb-0">
                      Collapsible Group Item #1 <i class="fas fa-angle-down rotate-icon"></i>
                    </h5>
                  </a>
                </div>

                Card body
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
            Accordion wrapper


            Add to Cart
            <div class="card-body">
              <div class="text-center">

                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button class="btn btn-primary">Add to cart
                  <i class="fas fa-cart-plus ml-2" aria-hidden="true"></i>
                </button>
              </div>
            </div>
            /.Add to Cart
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
 -->

</body></html>