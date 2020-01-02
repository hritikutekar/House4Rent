<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.oxcytech.*" %>
<!DOCTYPE html>
<%
      ConnectionFile mycon=new ConnectionFile();
	  Connection con=mycon.getConnection();
%>
<html lang="en">
<head>
<title>Properties</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Bluesky template project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="styles/properties.css">
<link rel="stylesheet" type="text/css" href="styles/properties_responsive.css">
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






			


	<!-- Properties -->

	<div class="properties">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title"><% 
					
					int i=0;
					if ("POST".equalsIgnoreCase(request.getMethod())) {
						loc=request.getParameter("locality");
						int p=Integer.parseInt(request.getParameter("price"));
						String r =request.getParameter("room");
						if(p==1) {
							p1=1000;
							p2=5000;
						}
						else if(p==2) {
							p1=5001;
							p2 =10000;
						}
						else if(p==3) {
							p1=10001;
							p2=20000;
					 	}

						statement = con.createStatement() ;
					    rs = statement.executeQuery("select * from post_room where Locality='"+loc+"' and Bedroom='"+r+"' and Price between '"+p1+"'and'"+p2+"'");
					    while(rs.next()){
					    	i++;
					    }
					    %>
					    <%=i %> Properties found <%
					}
					if("GET".equalsIgnoreCase(request.getMethod())) {
						int set=Integer.parseInt(request.getParameter("set"));
						String local=request.getParameter("local");
						if (set==0){
							statement = con.createStatement() ;
						    rs = statement.executeQuery("select * from post_room");
						    while(rs.next()){
						    	i++;
						    }
						    %>
						    <%=i %> Properties found <%
						    
						} 
						else {
							statement = con.createStatement() ;
						    rs = statement.executeQuery("select * from post_room where Locality='"+local+"'");
						    while(rs.next()){
						    	i++;
							}
						    %>
						    <%=i %> Properties found <%
							}
							
					}
					
					
					%></div>
					<div class="section_subtitle">Search your dream home</div>
				</div>
			</div>
			<div class="row properties_row">
		
				
							
				<!-- Property -->
				
				<% 
					
					if ("POST".equalsIgnoreCase(request.getMethod())) {
						loc=request.getParameter("locality");
						int p=Integer.parseInt(request.getParameter("price"));
						String r =request.getParameter("room");
						if(p==1) {
							p1=1000;
							p2=5000;
						}
						else if(p==2) {
							p1=5001;
							p2 =10000;
						}
						else if(p==3) {
							p1=10001;
							p2=20000;
					 	}

						statement = con.createStatement() ;
					    rs = statement.executeQuery("select * from post_room where Locality='"+loc+"' and Bedroom='"+r+"' and Price between '"+p1+"'and'"+p2+"'");
					    while(rs.next()){ %>
					    
					    <div class="col-xl-4 col-lg-6 property_col">
						<div class="property">
							<div class="property_image">
								<img src="images/property_6.jpg" alt="">
								<div class="tag_featured property_tag"><a href="#"><%=rs.getString(11) %></a></div>
							</div>
							<div class="property_body text-center">
								<div class="property_location"><%=loc %></div>
								<div class="property_title"><a href="property.jsp?room_id=<%=rs.getString(1) %>">Sea view property</a></div>
								<div class="property_price">Rs. <%=rs.getString(6) %></div>
							</div>
							<div class="property_footer d-flex flex-row align-items-center justify-content-start">
								<div><div class="property_icon"><img src="images/icon_1.png" alt=""></div><span><%=rs.getString(9) %> Ftsq</span></div>
								<div><div class="property_icon"><img src="images/icon_2.png" alt=""></div><span><%=rs.getString(7) %></span></div>
							</div>
						</div>
						</div>
					    
					    <%}}
					    
					if("GET".equalsIgnoreCase(request.getMethod())) {
						String local1=request.getParameter("local");
						if(local1!="1") {
						statement = con.createStatement() ;
					    rs = statement.executeQuery("select * from post_room where Locality='"+local1+"'");
					    while(rs.next()){ %>
					    
					    <div class="col-xl-4 col-lg-6 property_col">
						<div class="property">
							<div class="property_image">
								<img src="images/property_6.jpg" alt="">
								<div class="tag_featured property_tag"><a href="#"><%=rs.getString(11) %></a></div>
							</div>
							<div class="property_body text-center">
								<div class="property_location"><%=local1 %></div>
								<div class="property_title"><a href="property.jsp?room_id=<%=rs.getString(1) %>">Sea view property</a></div>
								<div class="property_price">Rs. <%=rs.getString(6) %></div>
							</div>
							<div class="property_footer d-flex flex-row align-items-center justify-content-start">
								<div><div class="property_icon"><img src="images/icon_1.png" alt=""></div><span><%=rs.getString(9) %> Ftsq</span></div>
								<div><div class="property_icon"><img src="images/icon_2.png" alt=""></div><span><%=rs.getString(7) %></span></div>
							</div>
						</div>
						</div>
					    
					    <%}}}%>
					    <%
						if("GET".equalsIgnoreCase(request.getMethod())) {
						int local2=Integer.parseInt(request.getParameter("local"));
						int set=Integer.parseInt(request.getParameter("set"));
						if (set==0){
						statement = con.createStatement() ;
					    rs = statement.executeQuery("select * from post_room");
					    while(rs.next()){ %>
					    
					    <div class="col-xl-4 col-lg-6 property_col">
						<div class="property">
							<div class="property_image">
								<img src="images/property_6.jpg" alt="">
								<div class="tag_featured property_tag"><a href="#"><%=rs.getString(11) %></a></div>
							</div>
							<div class="property_body text-center">
								<div class="property_location"><%=rs.getString(5) %></div>
								<div class="property_title"><a href="property.jsp?room_id=<%=rs.getString(1) %>">Sea view property</a></div>
								<div class="property_price">Rs. <%=rs.getString(6) %></div>
							</div>
							<div class="property_footer d-flex flex-row align-items-center justify-content-start">
								<div><div class="property_icon"><img src="images/icon_1.png" alt=""></div><span><%=rs.getString(9) %> Ftsq</span></div>
								<div><div class="property_icon"><img src="images/icon_2.png" alt=""></div><span><%=rs.getString(7) %></span></div>
							</div>
						</div>
						</div>
					    
					    <%}}}%>
				
				
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

				
				</div>

			</div>
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
						<div class="footer_logo"><a href="#"><img src="images/logo.png" alt=""></a></div>
					</div>
					<div class="col-lg-9 d-flex flex-column align-items-start justify-content-end">
						<div class="footer_title">Latest Properties</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-3 footer_col">
						<div class="footer_about">
							<div class="footer_about_text">Donec in tempus leo. Aenean ultricies mauris sed quam lacinia lobortis. Cras ut vestibulum enim, in gravida nulla. Curab itur ornare nisl at sagittis cursus.</div>
						</div>
					</div>
					<div class="col-lg-3 footer_col">
						<div class="footer_latest d-flex flex-row align-items-start justify-content-start">
							<div><div class="footer_latest_image"><img src="images/footer_latest_1.jpg" alt=""></div></div>
							<div class="footer_latest_content">
								<div class="footer_latest_location">Miami</div>
								<div class="footer_latest_name"><a href="#">Sea view property</a></div>
								<div class="footer_latest_price">$ 1. 234 981</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 footer_col">
						<div class="footer_latest d-flex flex-row align-items-start justify-content-start">
							<div><div class="footer_latest_image"><img src="images/footer_latest_2.jpg" alt=""></div></div>
							<div class="footer_latest_content">
								<div class="footer_latest_location">Miami</div>
								<div class="footer_latest_name"><a href="#">Town House</a></div>
								<div class="footer_latest_price">$ 1. 234 981</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 footer_col">
						<div class="footer_latest d-flex flex-row align-items-start justify-content-start">
							<div><div class="footer_latest_image"><img src="images/footer_latest_3.jpg" alt=""></div></div>
							<div class="footer_latest_content">
								<div class="footer_latest_location">Miami</div>
								<div class="footer_latest_name"><a href="#">Modern House</a></div>
								<div class="footer_latest_price">$ 1. 234 981</div>
							</div>
						</div>
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
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
</div>
							<div class="footer_nav">
								<ul>
									<li><a href="index.jsp">Home</a></li>
									<li><a href="#">About us</a></li>
									<li><a href="properties.html">Properties</a></li>
									<li><a href="news.html">News</a></li>
									<li><a href="contact.html">Contact</a></li>
								</ul>
							</div>
							<div class="footer_phone ml-auto"><span>call us: </span>652 345 3222 11</div>
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
<script src="plugins/parallax-js-master/parallax.min.js"></script>
<script src="js/properties.js"></script>
</body>
</html>