<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.oxcytech.*" %>
<!DOCTYPE html>
<%
      ConnectionFile mycon=new ConnectionFile();
	  Connection con=mycon.getConnection();
%>
<html lang="en">
<head>
<title>Property</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Bluesky template project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="plugins/rangeslider.js-2.3.0/rangeslider.css">
<link rel="stylesheet" type="text/css" href="styles/property.css">
<link rel="stylesheet" type="text/css" href="styles/property_responsive.css">
</head>
<body>

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
								<li><a href="index.jsp">Home</a></li>
								<li class="active"><a href="properties.html">Properties</a></li>
								<li><a href="about.html">About us</a></li>
								<li><a href="contact.html">Contact</a></li>
								<li><a href="Login.jsp"><button class="Lbutton">Login</button></a></li>
								<li><a href="Register.jsp"><button class="Sbutton">Sign up</button></a></li>
							</ul>		
						</nav>
						<div class="hamburger ml-auto"><i class="fa fa-bars" aria-hidden="true"></i></div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Menu -->

	<div class="menu trans_500">
		<div class="menu_content d-flex flex-column align-items-center justify-content-center text-center">
			<div class="menu_close_container"><div class="menu_close"></div></div>
			<div class="logo menu_logo">
				<a href="#">
					<div class="logo_container d-flex flex-row align-items-start justify-content-start">
						<div class="logo_image"><div><img src="images/logo.png" alt=""></div></div>
					</div>
				</a>
			</div>
			<ul>
				<li class="menu_item"><a href="index.jsp">Home</a></li>
				<li class="menu_item"><a href="about.html">About us</a></li>
				<li class="menu_item"><a href="#">Speakers</a></li>
				<li class="menu_item"><a href="#">Tickets</a></li>
				<li class="menu_item"><a href="news.html">News</a></li>
				<li class="menu_item"><a href="contact.html">Contact</a></li>
			</ul>
		</div>
		<div class="menu_phone"><span>call us: </span>652 345 3222 11</div>
	</div>
	
	<!-- Home -->

	<div class="home">
		<div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="images/properties.jpg" data-speed="0.8"></div>
		<div class="home_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="home_content d-flex flex-row align-items-end justify-content-start">
							<div class="home_title">Search results</div>
							<div class="breadcrumbs ml-auto">
								<ul>
									<li><a href="index.htmo">Home</a></li>
									<li>Search Results</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Home Search -->
	<div class="home_search">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_search_container">
						<div class="home_search_content">
							<form method="POST" class="search_form d-flex flex-row align-items-start justfy-content-start">
								<div class="search_form_content d-flex flex-row align-items-start justfy-content-start flex-wrap">
									<div>
									
											<% 
											int roomid=0;
											int custid=0;
			   								 try
			 									{
			    	
													PreparedStatement ps=null;
													ResultSet rs=null;
													Statement statement=null;
													int p1=0,p2=0;
													String city,rooms=null,loc=null;
													int price=0;
												     statement = con.createStatement() ;
				    							    rs = statement.executeQuery("select * from locality");
				   							  %>
												<select name="locality" id="" class="search_form_select">
			                                        <option value="-1">Select Your Locality</option>
			                                        <%  while(rs.next()){ %>
			                                        <option value="<%= rs.getString(2)%>"><%= rs.getString(2)%></option>
			                                         <% } %>
			                                    </select>
									</div>
									<div>
										<select name="price" id="" class="search_form_select">
                                        <option value="-1">Select Your Budget</option>
                                        <option value="1">1000 - 5000</option>
                                        <option value="2">5001 - 10000</option>
                                        <option value="3">10001 - 20000</option>
                                    </select>
									</div>
									<div>
										<select name="room" id="" class="search_form_select">
                                        <option value="-1">Select Your Rooms</option>
                                        <option>RK</option>
  										<option>1BHK</option>
  										<option>2BHK</option>
  										<option>3BHK</option>
                                    </select>
									</div>
								</div>
								<input type="submit" name="searchbtn" value="Search" class="search_form_button ml-auto">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Intro -->

	<div class="intro">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="intro_content d-flex flex-lg-row flex-column align-items-start justify-content-start">
						<div class="intro_title_container">
						<% 
						
					    statement = con.createStatement() ;
					    rs = statement.executeQuery("select * from post_room where Room_ID="+request.getParameter("room_id"));
						while(rs.next()){
						%>
							<div class="intro_title">House in <%=rs.getString(5) %></div>
							
							
							<div class="intro_tags">
							
							</div>
						</div>
						<div class="intro_price_container ml-lg-auto d-flex flex-column align-items-start justify-content-center">
							<div>For Rent</div>
							<div class="intro_price">RS. <%=rs.getString(6) %></div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		<div class="intro_slider_container">

			<!-- Intro Slider -->
			<div class="owl-carousel owl-theme intro_slider">
				<!-- Slide -->
				<div class="owl-item"><img src="images/intro_1.jpg" alt=""></div>
				<!-- Slide -->
				<div class="owl-item"><img src="images/intro_1.jpg" alt=""></div>
				<!-- Slide -->
				<div class="owl-item"><img src="images/intro_1.jpg" alt=""></div>
			</div>

			<!-- Intro Slider Nav -->
			<div class="intro_slider_nav_container">
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="intro_slider_nav_content d-flex flex-row align-items-start justify-content-end">
								<div class="intro_slider_nav intro_slider_prev"><i class="fa fa-chevron-left" aria-hidden="true"></i></div>
								<div class="intro_slider_nav intro_slider_next"><i class="fa fa-chevron-right" aria-hidden="true"></i></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Property -->

	<div class="property">
		<div class="container">
			<div class="row">
				<!-- Property Content -->
				<div class="col-lg-7 offset-lg-1">
					<div class="property_content">
						<div class="property_icons">
							<div class="property_title">Extra Facilities</div>
							<div class="property_text property_text_1">
								<p>The rooms are as follows: </p>
							</div>
							<div class="property_rooms d-flex flex-sm-row flex-column align-items-start justify-content-start">

								<!-- Property Room Item -->
								<div class="property_room">
									<div class="property_room_title">Rooms</div>
									<div class="property_room_content d-flex flex-row align-items-center justify-content-start">
										<div class="room_icon"><img src="images/room_1.png" alt=""></div>
										<div class="room_num"><%=rs.getString(7) %></div>
									</div>
								</div>

								<!-- Property Room Item -->
								<div class="property_room">
									<div class="property_room_title">Area</div>
									<div class="property_room_content d-flex flex-row align-items-center justify-content-start">
										<div class="room_icon"><img src="images/room_3.png" alt=""></div>
										<div class="room_num"><%=rs.getString(9) %></div>
									</div>
								</div>
							</div>
						</div>


						<!-- Additional Details -->

						<div class="additional_details">
						<%
						String cust_id = rs.getString(2);
						statement = con.createStatement() ;
						ResultSet rs1 = statement.executeQuery("select * from cust_table where Cust_ID="+cust_id);
						rs1.next();
						%>
							<div class="property_title">Additional Details</div>
							<div class="details_container">
								<ul>
									<li><span>Phone Number: </span><%=rs1.getString(6) %></li>
									<li><span>Name: </span><%=rs1.getString(2) %></li>
									<li><span>Address: </span><%=rs.getString(3) %></li>
									<li><span>Locality: </span><%=rs.getString(5) %></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%} %>

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



	<!-- Footer -->

	<footer class="footer">
		<div class="footer_main">
			<div class="container">
				<div class="row">
					<div class="col-lg-3">
						<div class="footer_logo"><a href="#"><img src="images/logo.png" alt=""></a></div>
					</div>
				</div>
				
			</div>
		</div>
		<div class="footer_bar">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="footer_bar_content d-flex flex-row align-items-center justify-content-start">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
</div>

<script src="js/jquery-3.2.1.min.js"></script>
<script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/greensock/TweenMax.min.js"></script>
<script src="plugins/greensock/TimelineMax.min.js"></script>
<script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="plugins/greensock/animation.gsap.min.js"></script>
<script src="plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="plugins/rangeslider.js-2.3.0/rangeslider.min.js"></script>
<script src="plugins/parallax-js-master/parallax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
<script src="js/property.js"></script>
</body>
</html>