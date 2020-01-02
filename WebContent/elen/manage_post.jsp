<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.oxcytech.*"%>
<!DOCTYPE html>
<html lang="en">

<%
String emailchk=(String)session.getAttribute("email"); 
if (emailchk==null) {
	response.sendRedirect("Login.jsp");
}
%>
<%
      ConnectionFile mycon=new ConnectionFile();
	  Connection con=mycon.getConnection();
%>

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
    
    <link rel="stylesheet" type="text/css" href="../styles/bootstrap4/bootstrap.min.css">
<link href="../plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="../plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="../plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="../styles/properties.css">
<link rel="stylesheet" type="text/css" href="../styles/properties_responsive.css">
  </head>
  <body>

<%
boolean isSet = (request.getParameter("changepass") == null);
%>

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
					<div class="row properties_row">
					<%
					
					PreparedStatement ps=null;
					ResultSet rs=null;
					Statement statement=null;
					String cust_id = (String) session.getAttribute("cust_id");
					int p1=0,p2=0;
					String city,rooms=null,loc=null;
					int price=0;
				    statement = con.createStatement() ;
				    rs = statement.executeQuery("select * from post_room WHERE Cust_ID='"+cust_id+"'");
					while (rs.next()) {
					%>
					<div class="col-xl-4 col-lg-6 property_col">
						<div class="property">
							<div class="property_image">
								<img src="../images/property_6.jpg" alt="">
								<div class="tag_featured property_tag"><a href="#"><%=rs.getString(11) %></a></div>
							</div>
							<div class="property_body text-center">
								<div class="property_location"><%=rs.getString(5) %></div>
								<div class="property_title"><a href="property.html">Sea view property</a></div>
								<div class="property_price">Rs. <%=rs.getString(6) %></div>
							</div>
							<div class="property_footer d-flex flex-row align-items-center justify-content-start">
								<div><div class="property_icon"><img src="../images/icon_1.png" alt=""></div><span><%=rs.getString(9) %> Ftsq</span></div>
								<div><div class="property_icon"><img src="../images/icon_2.png" alt=""></div><span><%=rs.getString(7) %></span></div>
							</div>
						</div>
						</div>
						<%}%>
						</div>
					</div>
				</div>
			</div>
		</div><!-- END COLORLIB-MAIN -->
	</div><!-- END COLORLIB-PAGE -->

  <!-- loader -->
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