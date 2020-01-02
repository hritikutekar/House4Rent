<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.oxcytech.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
        ConnectionFile mycon=new ConnectionFile();
		Connection con=mycon.getConnection();
%>

<html>
<head>
    
<!-- New design -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Bluesky template project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="styles/responsive.css">
      
<script src="js/vendor/modernizr-2.6.2.min.js"></script>
</head>
<body>
<!-- Body content -->

<div class="super_container">

<!-- Header -->

<header class="header">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="header_content d-flex flex-row align-items-center justify-content-start">
					<div class="logo">
						<a href="#"><img src="images/logo.png" alt=""></a>
					</div>
					<nav class="main_nav">
						<ul>
							<li class="active"><a href="index.jsp">Home</a></li>
							<li><a href="about.html">About us</a></li>
							<li><a href="properties.html">Properties</a></li>
							<li><a href="contact.html">Contact</a></li>
						</ul>
						<div class="button navbar-right">
			            	<a href="Login.jsp"><button class="navbar-btn nav-button wow bounceInRight login" data-wow-delay="0.8s">Login</button></a>
			            	<a href="Register.jsp"><button class="navbar-btn nav-button wow fadeInRight" data-wow-delay="0.6s">Sign up</button></a>
			            </div>
					</nav>
					<div class="phone_num ml-auto">
						<div class="phone_num_inner">
							<img src="images/phone.png" alt=""><span>8149758334</span>
						</div>
					</div>
					<div class="hamburger ml-auto"><i class="fa fa-bars" aria-hidden="true"></i></div>
				</div>
			</div>
		</div>
	</div>
</header>
</div>

        <nav class="navbar navbar-default">
          <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="home.jsp">House4Rent</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			    <ul class="main-nav nav navbar-nav navbar-right">
     
               
              </ul>
              
          
            </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
        </nav>

        <div class="slider-area">
            <div class="slider">
                <div id="bg-slider" class="owl-carousel owl-theme">
                 
                  <div class="item"><img src="img/slider-image-3.jpg" alt="Mirror Edge"></div>
                  <div class="item"><img src="img/slider-image-2.jpg" alt="The Last of us"></div>
                  <div class="item"><img src="img/slider-image-1.jpg" alt="GTA V"></div>
                 
                </div>
            </div>
            <div class="container slider-content">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-sm-12">
                        <h2>Room4Rental</h2>
                       <h4 class="font-thin">  <span class="font-semibold">WITHOUT BROKER - </span> AT THE BEST PRICE </h4>
                        <div class="search-form wow pulse" data-wow-delay="0.8s">
                            <form action="ShortSearch.jsp" class=" form-inline" method="post">
                                <div class="form-group">
                                 <!-- <input type="text" class="form-control" placeholder="Job Key Word"><select name="" id="" class="form-control">-->
                                 
								<% 
   								 try
 									{
    	
										PreparedStatement ps=null;
										ResultSet rs=null;
										Statement statement=null;
										int p1=0,p2=0;
										String city,rooms=null;
										int price=0;
									     statement = con.createStatement() ;
	    							    rs = statement.executeQuery("select * from locality order by locality");
	   							  %>
									<select name="locality" id="" class="form-control">
                                        <option value="-1">Select Your Locality</option>
                                        <%  while(rs.next()){ %>
                                        <option><%= rs.getString(2)%></option>
                                         <% } %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select name="price" id="" class="form-control">
                                        <option value="-1">Select Your Budget</option>
                                        <option value="1">1000 - 5000</option>
                                        <option value="2">5001 - 10000</option>
                                        <option value="3">10001 - 20000</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select name="room" id="" class="form-control">
                                        <option value="-1">Select Your Rooms</option>
                                        <option>RK</option>
  										<option>1BHK</option>
  										<option>2BHK</option>
  										<option>3BHK</option>
                                    </select>
                                </div>
                                <input type="submit" class="btn" value="Search" name="searchbtn">
								
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="content-area">
            <div class="container">
                <div class="row page-title text-center wow zoomInDown" data-wow-delay="1s">
                    <h5>Our Process</h5>
                    <h2>How we work for you?</h2>
                    <p>Room4rental’s focus is always on the long term. Our thoughtful approach to makes website a user-friendly for our global users</p>
                </div>
                <div class="row how-it-work text-center">
                    <div class="col-md-4">
                        <div class="single-work wow fadeInUp" data-wow-delay="0.8s">
                            <img src="img/how-work1.png" alt="">
                            <h3>simply Search</h3>
                            <p></p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="single-work  wow fadeInUp"  data-wow-delay="0.9s">
                            <img src="img/how-work2.png" alt="">
                            <h3>Mobile friendly</h3>
                            <p></p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="single-work wow fadeInUp"  data-wow-delay="1s">
                            <img src="img/how-work3.png" alt="">
                            <h3>solve problems</h3>
                            <p></p>
                        </div>
                    </div>
                </div>
            </div>
            <hr>

  
        </div>
        <div class="footer-area">
            <div class="container">
           
                <div class="row footer-copy">
                    <p><span>(C) room4rental, All rights reserved</span> |  <a href="about.html">about us</a></span> | <a href="contact.us">contact us</a></span> </p>
                </div>
            </div>
        </div>
		
		<% 	
 								 
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		finally
		{
			
		}
		%>
		
		
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/wow.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
