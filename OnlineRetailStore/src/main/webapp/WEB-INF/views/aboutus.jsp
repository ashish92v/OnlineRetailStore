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


<style>



/*============ blog_left_sidebar css ==============*/
.blog_item {
  margin-bottom: 40px; }

.blog_info {
  padding-top: 30px; }
  .blog_info .post_tag {
    padding-bottom: 20px; }
    .blog_info .post_tag a {
      font: 300 14px/21px "Roboto", sans-serif;
      color: #222222; }
      .blog_info .post_tag a:hover {
        color: #777777; }
      .blog_info .post_tag a.active {
        color: #ffba00; }
  .blog_info .blog_meta li a {
    font: 300 14px/20px "Roboto", sans-serif;
    color: #777777;
    vertical-align: middle;
    padding-bottom: 12px;
    display: inline-block; }
    .blog_info .blog_meta li a i {
      color: #222222;
      font-size: 16px;
      font-weight: 600;
      padding-left: 15px;
      line-height: 20px;
      vertical-align: middle; }
    .blog_info .blog_meta li a:hover {
      color: #ffba00; }

.blog_post img {
  max-width: 100%; }
.blog_post .white_bg_btn {
  border: 1px solid #eeeeee;
  text-transform: uppercase;
  font-size: 12px;
  padding: 0 30px;
  line-height: 34px;
  display: inline-block;
  color: #222222; }

.blog_details {
  padding-top: 20px; }
  .blog_details h2 {
    font-size: 24px;
    line-height: 36px;
    color: #222222;
    font-weight: 600;
    transition: all 0.3s linear; }
    .blog_details h2:hover {
      color: #c5322d; }
  .blog_details p {
    margin-bottom: 26px; }

.view_btn {
  font-size: 14px;
  line-height: 36px;
  display: inline-block;
  color: #222222;
  font-weight: 500;
  padding: 0px 30px;
  background: #fff; }

.blog_right_sidebar {
  border: 1px solid #eeeeee;
  background: #fafaff;
  padding: 30px; }
  .blog_right_sidebar .widget_title {
    font-size: 18px;
    line-height: 25px;
    background: #ffba00;
    text-align: center;
    color: #fff;
    padding: 8px 0px;
    margin-bottom: 30px; }
  .blog_right_sidebar .search_widget .input-group .form-control {
    font-size: 14px;
    line-height: 29px;
    border: 0px;
    width: 100%;
    font-weight: 300;
    color: #fff;
    padding-left: 20px;
    border-radius: 45px;
    z-index: 0;
    background: #ffba00; }
    .blog_right_sidebar .search_widget .input-group .form-control.placeholder {
      color: #fff; }
    .blog_right_sidebar .search_widget .input-group .form-control:-moz-placeholder {
      color: #fff; }
    .blog_right_sidebar .search_widget .input-group .form-control::-moz-placeholder {
      color: #fff; }
    .blog_right_sidebar .search_widget .input-group .form-control::-webkit-input-placeholder {
      color: #fff; }
    .blog_right_sidebar .search_widget .input-group .form-control:focus {
      box-shadow: none; }
  .blog_right_sidebar .search_widget .input-group .btn-default {
    position: absolute;
    right: 20px;
    background: transparent;
    border: 0px;
    box-shadow: none;
    font-size: 14px;
    color: #fff;
    padding: 0px;
    top: 50%;
    transform: translateY(-50%);
    z-index: 1; }
  .blog_right_sidebar .author_widget {
    text-align: center; }
    .blog_right_sidebar .author_widget h4 {
      font-size: 18px;
      line-height: 20px;
      color: #222222;
      margin-bottom: 5px;
      margin-top: 30px; }
    .blog_right_sidebar .author_widget p {
      margin-bottom: 0px; }
    .blog_right_sidebar .author_widget .social_icon {
      padding: 7px 0px 15px; }
      .blog_right_sidebar .author_widget .social_icon a {
        font-size: 14px;
        color: #222222;
        transition: all 0.2s linear; }
        .blog_right_sidebar .author_widget .social_icon a + a {
          margin-left: 20px; }
        .blog_right_sidebar .author_widget .social_icon a:hover {
          color: #c5322d; }
  .blog_right_sidebar .popular_post_widget .post_item .media-body {
    justify-content: center;
    align-self: center;
    padding-left: 20px; }
    .blog_right_sidebar .popular_post_widget .post_item .media-body h3 {
      font-size: 14px;
      line-height: 20px;
      color: #222222;
      margin-bottom: 4px;
      transition: all 0.3s linear; }
      .blog_right_sidebar .popular_post_widget .post_item .media-body h3:hover {
        color: #ffba00; }
    .blog_right_sidebar .popular_post_widget .post_item .media-body p {
      font-size: 12px;
      line-height: 21px;
      margin-bottom: 0px; }
  .blog_right_sidebar .popular_post_widget .post_item + .post_item {
    margin-top: 20px; }
  .blog_right_sidebar .post_category_widget .cat-list li {
    border-bottom: 2px dotted #eee;
    transition: all 0.3s ease 0s;
    padding-bottom: 12px; }
    .blog_right_sidebar .post_category_widget .cat-list li a {
      font-size: 14px;
      line-height: 20px;
      color: #777; }
      .blog_right_sidebar .post_category_widget .cat-list li a p {
        margin-bottom: 0px; }
    .blog_right_sidebar .post_category_widget .cat-list li + li {
      padding-top: 15px; }
    .blog_right_sidebar .post_category_widget .cat-list li:hover {
      border-color: #ffba00; }
      .blog_right_sidebar .post_category_widget .cat-list li:hover a {
        color: #ffba00; }
  .blog_right_sidebar .newsletter_widget {
    text-align: center; }
    .blog_right_sidebar .newsletter_widget .form-group {
      margin-bottom: 8px; }
    .blog_right_sidebar .newsletter_widget .input-group-prepend {
      margin-right: -1px; }
    .blog_right_sidebar .newsletter_widget .input-group-text {
      background: #fff;
      border-radius: 0px;
      vertical-align: top;
      font-size: 12px;
      line-height: 36px;
      padding: 0px 0px 0px 15px;
      border: 1px solid #eeeeee;
      border-right: 0px; }
    .blog_right_sidebar .newsletter_widget .form-control {
      font-size: 12px;
      line-height: 24px;
      color: #cccccc;
      border: 1px solid #eeeeee;
      border-left: 0px;
      border-radius: 0px; }
      .blog_right_sidebar .newsletter_widget .form-control.placeholder {
        color: #cccccc; }
      .blog_right_sidebar .newsletter_widget .form-control:-moz-placeholder {
        color: #cccccc; }
      .blog_right_sidebar .newsletter_widget .form-control::-moz-placeholder {
        color: #cccccc; }
      .blog_right_sidebar .newsletter_widget .form-control::-webkit-input-placeholder {
        color: #cccccc; }
      .blog_right_sidebar .newsletter_widget .form-control:focus {
        outline: none;
        box-shadow: none; }
    .blog_right_sidebar .newsletter_widget .bbtns {
      background: #ffba00;
      color: #fff;
      font-size: 12px;
      line-height: 38px;
      display: inline-block;
      font-weight: 500;
      padding: 0px 24px 0px 24px;
      border-radius: 0; }
    .blog_right_sidebar .newsletter_widget .text-bottom {
      font-size: 12px; }
  .blog_right_sidebar .tag_cloud_widget ul li {
    display: inline-block; }
    .blog_right_sidebar .tag_cloud_widget ul li a {
      display: inline-block;
      border: 1px solid #eee;
      background: #fff;
      padding: 0px 13px;
      margin-bottom: 8px;
      transition: all 0.3s ease 0s;
      color: #222222;
      font-size: 12px; }
      .blog_right_sidebar .tag_cloud_widget ul li a:hover {
        background: #ffba00;
        color: #fff; }
  .blog_right_sidebar .br {
    width: 100%;
    height: 1px;
    background: #eeeeee;
    margin: 30px 0px; }

.blog-pagination {
  padding-top: 25px;
  padding-bottom: 95px; }
  .blog-pagination .page-link {
    border-radius: 0; }
  .blog-pagination .page-item {
    border: none; }

.page-link {
  background: transparent;
  font-weight: 400; }

.blog-pagination .page-item.active .page-link {
  color: #fff; }

.blog-pagination .page-link {
  position: relative;
  display: block;
  padding: 0.5rem 0.75rem;
  margin-left: -1px;
  line-height: 1.25;
  color: #8a8a8a;
  border: none; }

.blog-pagination .page-link .lnr {
  font-weight: 600; }

.blog-pagination .page-item:last-child .page-link,
.blog-pagination .page-item:first-child .page-link {
  border-radius: 0; }

.blog-pagination .page-link:hover {
  color: #fff;
  text-decoration: none;
  background-color: #c5322d;
  border-color: #eee; }

/*============ Start Blog Single Styles  =============*/
.single-post-area .social-links {
  padding-top: 10px; }
  .single-post-area .social-links li {
    display: inline-block;
    margin-bottom: 10px; }
    .single-post-area .social-links li a {
      color: #cccccc;
      padding: 7px;
      font-size: 14px;
      transition: all 0.2s linear; }
      .single-post-area .social-links li a:hover {
        color: #222222; }
.single-post-area .blog_details {
  padding-top: 26px; }
  .single-post-area .blog_details p {
    margin-bottom: 10px; }
.single-post-area .quotes {
  margin-top: 20px;
  margin-bottom: 30px;
  padding: 24px 35px 24px 30px;
  background-color: white;
  box-shadow: -20.84px 21.58px 30px 0px rgba(176, 176, 176, 0.1);
  font-size: 14px;
  line-height: 24px;
  color: #777;
  font-style: italic; }
.single-post-area .arrow {
  position: absolute; }
  .single-post-area .arrow .lnr {
    font-size: 20px;
    font-weight: 600; }
.single-post-area .thumb .overlay-bg {
  background: rgba(0, 0, 0, 0.8); }
.single-post-area .navigation-area {
  border-top: 1px solid #eee;
  padding-top: 30px;
  margin-top: 60px; }
  .single-post-area .navigation-area p {
    margin-bottom: 0px; }
  .single-post-area .navigation-area h4 {
    font-size: 18px;
    line-height: 25px;
    color: #222222; }
  .single-post-area .navigation-area .nav-left {
    text-align: left; }
    .single-post-area .navigation-area .nav-left .thumb {
      margin-right: 20px;
      background: #000; }
      .single-post-area .navigation-area .nav-left .thumb img {
        -webkit-transition: all 0.3s ease 0s;
        -moz-transition: all 0.3s ease 0s;
        -o-transition: all 0.3s ease 0s;
        transition: all 0.3s ease 0s; }
    .single-post-area .navigation-area .nav-left .lnr {
      margin-left: 20px;
      opacity: 0;
      -webkit-transition: all 0.3s ease 0s;
      -moz-transition: all 0.3s ease 0s;
      -o-transition: all 0.3s ease 0s;
      transition: all 0.3s ease 0s; }
    .single-post-area .navigation-area .nav-left:hover .lnr {
      opacity: 1; }
    .single-post-area .navigation-area .nav-left:hover .thumb img {
      opacity: .5; }
    @media (max-width: 767px) {
      .single-post-area .navigation-area .nav-left {
        margin-bottom: 30px; } }
  .single-post-area .navigation-area .nav-right {
    text-align: right; }
    .single-post-area .navigation-area .nav-right .thumb {
      margin-left: 20px;
      background: #000; }
      .single-post-area .navigation-area .nav-right .thumb img {
        -webkit-transition: all 0.3s ease 0s;
        -moz-transition: all 0.3s ease 0s;
        -o-transition: all 0.3s ease 0s;
        transition: all 0.3s ease 0s; }
    .single-post-area .navigation-area .nav-right .lnr {
      margin-right: 20px;
      opacity: 0;
      -webkit-transition: all 0.3s ease 0s;
      -moz-transition: all 0.3s ease 0s;
      -o-transition: all 0.3s ease 0s;
      transition: all 0.3s ease 0s; }
    .single-post-area .navigation-area .nav-right:hover .lnr {
      opacity: 1; }
    .single-post-area .navigation-area .nav-right:hover .thumb img {
      opacity: .5; }
@media (max-width: 991px) {
  .single-post-area .sidebar-widgets {
    padding-bottom: 0px; } }

.comments-area {
  background: #fafaff;
  border: 1px solid #eee;
  padding: 50px 30px;
  margin-top: 50px; }
  @media (max-width: 414px) {
    .comments-area {
      padding: 50px 8px; } }
  .comments-area h4 {
    text-align: center;
    margin-bottom: 50px;
    color: #222222;
    font-size: 18px; }
  .comments-area h5 {
    font-size: 16px;
    margin-bottom: 0px; }
  .comments-area a {
    color: #222222; }
  .comments-area .comment-list {
    padding-bottom: 48px; }
    .comments-area .comment-list:last-child {
      padding-bottom: 0px; }
    .comments-area .comment-list.left-padding {
      padding-left: 25px; }
    @media (max-width: 413px) {
      .comments-area .comment-list .single-comment h5 {
        font-size: 12px; }
      .comments-area .comment-list .single-comment .date {
        font-size: 11px; }
      .comments-area .comment-list .single-comment .comment {
        font-size: 10px; } }
  .comments-area .thumb {
    margin-right: 20px; }
  .comments-area .date {
    font-size: 13px;
    color: #cccccc;
    margin-bottom: 13px; }
  .comments-area .comment {
    color: #777777;
    margin-bottom: 0px; }
  .comments-area .btn-reply {
    background-color: #fff;
    color: #222222;
    border: 1px solid #eee;
    padding: 2px 18px;
    font-size: 12px;
    display: block;
    font-weight: 600;
    -webkit-transition: all 0.3s ease 0s;
    -moz-transition: all 0.3s ease 0s;
    -o-transition: all 0.3s ease 0s;
    transition: all 0.3s ease 0s; }
    .comments-area .btn-reply:hover {
      background-color: #c5322d;
      color: #fff; }

.comment-form {
  background: #fafaff;
  text-align: center;
  border: 1px solid #eee;
  padding: 47px 30px 43px;
  margin-top: 50px;
  margin-bottom: 40px; }
  .comment-form h4 {
    text-align: center;
    margin-bottom: 50px;
    font-size: 18px;
    line-height: 22px;
    color: #222222; }
  .comment-form .name {
    padding-left: 0px; }
    @media (max-width: 767px) {
      .comment-form .name {
        padding-right: 0px;
        margin-bottom: 1rem; } }
  .comment-form .email {
    padding-right: 0px; }
    @media (max-width: 991px) {
      .comment-form .email {
        padding-left: 0px; } }
  .comment-form .form-control {
    padding: 8px 20px;
    background: #fff;
    border: none;
    border-radius: 0px;
    width: 100%;
    font-size: 14px;
    color: #777777;
    border: 1px solid transparent; }
    .comment-form .form-control:focus {
      box-shadow: none;
      border: 1px solid #eee; }
  .comment-form textarea.form-control {
    height: 140px;
    resize: none; }
  .comment-form ::-webkit-input-placeholder {
    /* Chrome/Opera/Safari */
    font-size: 13px;
    color: #777; }
  .comment-form ::-moz-placeholder {
    /* Firefox 19+ */
    font-size: 13px;
    color: #777; }
  .comment-form :-ms-input-placeholder {
    /* IE 10+ */
    font-size: 13px;
    color: #777; }
  .comment-form :-moz-placeholder {
    /* Firefox 18- */
    font-size: 13px;
    color: #777; }



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
                <a href="#" class="nav-item active nav-link">About us</a>


                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle active" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Profile</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a href="saveAccount" class="dropdown-item">My Account</a>
                        <a href="cart" class="dropdown-item">Order</a>
                        <a href="login" class="dropdown-item">Login</a>
                    </div>
                </li>
            </ul>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
   <div id="basket-overview" class="navbar-collapse collapse d-none d-lg-block"><a href="cart" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span>3 items in cart</span></a></div>
        
        </div>
    </nav>
    <br><br>


<section class="login_box_area section_gap">
		<div class="container">
			<div id="demo"   class="row">
				
<b>USER-FRIENDLY SHOPPING EXPERIENCE</b>
<p><b>Phoenix Discount Store</b>: Phoenix an e-commerce retailer in Europe have expanded its collections range and introduced a new ordering &amp; delivery system. The online store offers a wide range of products easy to order online and delivered to your doorsteps anywhere in Europe. From drones, phone cases, phone accessories, apparel, dental care, car &amp; motorcycle accessories, sunglasses To fishing accessories, watches, adults toys, GPS, smart home, cameras &amp; the latest in electronics gadgets they can get their hand on.       </p>


<b>EXPRESS DELIVERY SERVICE</b>
<p>Ordering a product on Phoenix is an easy process: You see it, place an order &amp; get delivered on time. Phoenix offers 2 shopping systems: Cash on Delivery (24h delivery) &amp; Pre-Order (10 days delivery - upfront payment) for items not available in the local warehouse, shipped &amp; delivered directly to customers.                                           </p>
<p>Phoenix offers several payments method: Cash on Delivery, Mobile Money &amp; Paypal. Customers can reach customer support service 24 Hours a day by messenger or what-app chat from the homepage. Phoenix warrants all sold products and provide an after sale return policy stated on their home page.                                              </p>

<p>The Phoenix team has reported that more and more Europians are shopping from the comfort of their homes of all kinds of items.</p>

<b>ONLINE AFFILIATE MARKETING PROGRAM </b>
<p>As an online store &amp; retailer Phoenix provide as well an ''Online Marketing Affiliate Program'' where any individual can join and work as an online sales executive and make money online by promoting Phoenix products on social media and earn a commission in return. (coming soon)                                              </p>
<p>When asked about the '' Online Discount Store'' business concept, we were told Phoenix regularly do ''Fire Sales'' with up to 50% discounts, hence the name, that last for just 24 hours. Customers get instant notifications by sms when the sales are on! A new section is also being introduced for stocks liquidations. </p>

<p><b>Customer Satisfaction Guarantee </b>Phoenix is determined to ensure customer satisfaction at all times during the shopping process. </p>				
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
