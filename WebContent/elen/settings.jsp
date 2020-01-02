<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.oxcytech.*" %><!DOCTYPE html>
<html lang="en">
  <head>
    <title>WelcomePage</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>

	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="js-fullheight text-center">
			<h1 id="colorlib-logo"><a href="index.jsp">Profile<span>.</span></a></h1>
			<nav id="colorlib-main-menu" role="navigation">
				<ul>
					<li><a href="settings.jsp">Settings</a></li>
					<li><a href="change_pass.jsp">Change Password</a></li>
					<li><a href="post_room.jsp">Post Room</a></li>
					<li><a href="manage_post.jsp">Manage Room</a></li>
					<li><a href="../Logout.jsp">Logout</a></li>
				</ul>
			</nav>
			
		</aside> <!-- END COLORLIB-ASIDE -->
		<div id="colorlib-main">
			<div class="hero-wrap js-fullheight" style="background-image: url(images/bg_1.jpg);" data-stellar-background-ratio="0.5">
				<div class="overlay"></div>
				<div class="js-fullheight d-flex justify-content-center align-items-center">
					<div class="col-md-8 text text-center">
						<% 
					String gender=(String)session.getAttribute("gender");
					if(gender.equals("female")) { %>
						<div class="img mb-4" style="background-image: url(../images/icons/female_avatar.png);"></div>
					<% } else { %>
						<div class="img mb-4" style="background-image: url(../images/icons/male_avatar.png);"></div>
					<% } %>
						<div class="desc">
						<%
						
						String email=(String)session.getAttribute("email");
						ConnectionFile mycon=new ConnectionFile();
						Connection con=mycon.getConnection();
						
						ResultSet rs;
						Statement statement;
						
						statement = con.createStatement() ;
					    rs = statement.executeQuery("select * from cust_table where Email_ID='"+email+"'");
						
						%>
						<form action="#">
			              <div class="form-group">
			              <%  while(rs.next()){ %>
			                <input type="text" readonly class="form-control" value="<%=rs.getString(2) %>" placeholder="Your Name">
			              
			              </div>
			              <div class="form-group">
			                <input type="text" readonly class="form-control" value="<%=rs.getString(7) %>" placeholder="Your Email">
			              </div>
			              <div class="form-group">
			                <input type="text" readonly class="form-control" value="<%=rs.getString(6) %>" placeholder="Address">
			              </div>
			              <div class="form-group">
			                <textarea readonly name="" id="" cols="30" rows="7" class="form-control" placeholder="Message"><%=rs.getString(5) %></textarea>
			              <% } %>
			              </div>
			              </form>
			              <div class="form-group">
			                <a href="settings_edit.jsp"><button class="btn btn-primary py-3 px-5">Edit</button></a>
			              </div>
			            
			            
						</div>
					</div>
				</div>
			</div>
			</div>
			</div>
	
			
	<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
			
  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
    
  </body>
</html>