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

<%
String emailchk=(String)session.getAttribute("email"); 
%>

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
							<li><a href="properties.jsp?local=1&&set=0">Properties</a></li>
							<li><a href="about.html">About us</a></li>
							<li><a href="contact.html">Contact</a></li>
							<% 
							if (emailchk==null) {
							%>
							<li><a href="Login.jsp"><button class="Lbutton">Login</button></a></li>
							<li><a href="Register.jsp"><button class="Sbutton">Sign up</button></a></li>
							<%} else { %>
							<li><a href="Logout.jsp"><button class="Lbutton">Logout</button></a></li>
							<li><a href="Rentalcome.jsp"><button class="Lbutton">Profile</button></a></li>
							<%} %>
						</ul>			            	
					</nav>
					<div class="hamburger ml-auto"><i class="fa fa-bars" aria-hidden="true"></i></div>
				</div>
			</div>
		</div>
	</div>
</header>
</div>



<!-- Home -->

	<div class="home">

		<!-- Home Slider -->
		<div class="home_slider_container">
			<div class="owl-carousel owl-theme home_slider">
				
				<!-- Slide -->
				<div class="owl-item">
					<div class="home_slider_background" style="background-image:url(images/home_slider_1.jpg)"></div>
					<div class="slide_container">
						<div class="container">
							<div class="row">
								<div class="col">
									
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Slide -->
				<div class="owl-item">
					<div class="home_slider_background" style="background-image:url(images/home_slider_1.jpg)"></div>
					<div class="slide_container">
						<div class="container">
							<div class="row">
								<div class="col">
									
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Slide -->
				<div class="owl-item">
					<div class="home_slider_background" style="background-image:url(images/home_slider_1.jpg)"></div>
					<div class="slide_container">
						<div class="container">
							<div class="row">
								<div class="col">
									
								</div>
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
							<form action="properties.jsp" method="POST" class="search_form d-flex flex-row align-items-start justfy-content-start">
								<div class="search_form_content d-flex flex-row align-items-start justfy-content-start flex-wrap">
									<div>
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
												<select name="locality" id="" class="search_form_select">
			                                        <option value="-1">Select Your Locality</option>
			                                        <%  while(rs.next()){ %>
			                                        <option><%= rs.getString(2)%></option>
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

	<!-- Recent -->

	<div class="recent">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title">Recent Properties</div>
					<div class="section_subtitle">Search your dream home</div>
				</div>
			</div>
			<div class="row recent_row">
				<div class="col">
					<div class="recent_slider_container">
						<div class="owl-carousel owl-theme recent_slider">
							
							<%
			
								statement = con.createStatement() ;
								rs = statement.executeQuery("SELECT * FROM `post_room` ORDER BY `post_room`.`Room_ID` DESC");
								int only9=0;
								
							%>
							<!-- Slide -->
							
							<% while(rs.next()) { %>
							<% only9++; %>
							<div class="owl-item">
								<div class="recent_item">
								
									<div class="recent_item_inner">
										<div class="recent_item_image">
											<img src="images/property_<%=only9%>.jpg" alt="">
											<div class="tag_featured property_tag"><a href="#"><%=rs.getString(11) %></a></div>
										</div>
										<div class="recent_item_body text-center">
											<div class="recent_item_location"><%=rs.getString(5) %></div>
											<div class="recent_item_title"><a href="property.jsp?room_id=<%=rs.getString(1) %>">Sea view property</a></div>
											<div class="recent_item_price">Rs. <%=rs.getString(6) %></div>
										</div>
										<div class="recent_item_footer d-flex flex-row align-items-center justify-content-start">
											<div><div class="recent_icon"><img src="images/icon_1.png" alt=""></div><span><%=rs.getString(9) %> Ftsq</span></div>
											<div><div class="recent_icon"><img src="images/icon_2.png" alt=""></div><span><%=rs.getString(7) %></span></div>
										</div>
									</div>
									
								</div>
							</div>
							<% if (only9==9){break;} %>
							<% } %>
							
						</div>

						<div class="recent_slider_nav_container d-flex flex-row align-items-start justify-content-start">
							<div class="recent_slider_nav recent_slider_prev"><i class="fa fa-chevron-left" aria-hidden="true"></i></div>
							<div class="recent_slider_nav recent_slider_next"><i class="fa fa-chevron-right" aria-hidden="true"></i></div>
						</div>
					</div>
					<div class="button recent_button"><a href="properties.jsp?local=1&&set=0">see more</a></div>
				</div>
			</div>
		</div>
	</div>

	<!-- Cities -->

	<div class="cities">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title">Find properties in these locality</div>
					<div class="section_subtitle">Search your dream home</div>
				</div>
			</div>
		</div>
		
		<div class="cities_container d-flex flex-row flex-wrap align-items-start justify-content-between">


		<%
			
			statement = con.createStatement() ;
			rs = statement.executeQuery("select * from locality");
			int s=1;
			
		%>
		
		<!-- City -->
		<%  while(rs.next()) { %>
		<div class="city">
			<img src="images/city_<%=s%>.jpg" alt="https://unsplash.com/@dnevozhai">
			<div class="city_overlay">
				<a href="properties.jsp?local=<%=rs.getString(2)%>&&set=1" class="d-flex flex-column align-items-center justify-content-center">
					<div class="city_title"><%= rs.getString(2)%></div>
					<div class="city_subtitle">Rentals from Rs. 2500/month</div>
				</a>	
			</div>
		</div>
		<% s++; } %>
		</div>
	</div>

	<!-- Newsletter -->

	<div class="newsletter">
		<div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="images/newsletter.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="newsletter_content d-flex flex-lg-row flex-column align-items-start justify-content-start">
						<div class="newsletter_title_container">
							<div class="newsletter_title">Are you buying or selling?</div>
							<div class="newsletter_subtitle">Search your dream home</div>
						</div>
						<div class="newsletter_form_container">
							<form action="#" class="newsletter_form">
								<input type="email" class="newsletter_input" placeholder="Your e-mail address" required="required">
								<button class="newsletter_button">subscribe now</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->

	<footer class="footer">
		<div class="footer_main">
			<div class="container">
				<div class="row">
					<div class="col-lg-3">
						<div class="footer_logo"s><a href="#"><img src="images/logo.png" alt=""></a></div>
					</div>
					</div>
				</div>
			</div>
		<div class="footer_bar">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="footer_bar_content d-flex flex-row align-items-center justify-content-start">
							<div class="cr"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
</div>
							<div class="footer_nav">
								<ul>
									<li><a href="index.jsp">Home</a></li>
									<li><a href="#">About us</a></li>
									<li><a href="properties.jsp">Properties</a></li>
									<li><a href="contact.html">Contact</a></li>
								</ul>
							</div>
							<div class="footer_phone ml-auto"><span>call us: </span>8149758334</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
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

<script src="js/jquery-3.2.1.min.js"></script>
<script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="plugins/parallax-js-master/parallax.min.js"></script>
<script src="js/custom.js"></script>
</body>
</html>



