<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.oxcytech.*" %><!DOCTYPE html>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.http.Part"%>

    <%ResultSet resultset =null;%>
    <%
    ConnectionFile mycon=new ConnectionFile();
	Connection con=mycon.getConnection();
    %>
    
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
    try
 	{
	 
    	PreparedStatement ps=null;
		
    	Statement statement = con.createStatement() ;

	     resultset = statement.executeQuery("select * from locality");
	     %> 
						<div class="desc">
						
						<form method="post" enctype="multipart/form-data">
						<div class="form-group">
			                <textarea cols="30" rows="4" name="add" class="form-control" placeholder="Address"></textarea>
			              </div>			              		
			              <div class="form-group">			              
			                <input type="text" class="form-control" name="city" placeholder="City">
			              </div>	
			              	<div class="form-group">
							<select class="form-control" id="sel1" name="locality"> <option value="-1">Select Locality</option>
							   <%  while(resultset.next()){ %> 
								<option><%= resultset.getString(2)%></option>
								<% } %>
							</select>
							</div>
							<div class="form-group">
                			<input type="text" name="price" placeholder="Price...." class="form-control" id="inputEmail3">       
                  			</div>		
                  			<div class="form-group">   
							<select class="form-control" id="sel1" name="room"> 
							<option value="-1">Select Your Room</option>
							<option>RK</option>
							<option>1BHK</option>
							<option>2BHK</option>
							<option>3BHK</option>
						    </select>
						    </div>  
						    <div class="form-group">
							<label for="sel1" class="col-sm-2 control-label">Furnished</label>
							     <div class="checkbox">
							      <label>
							        <input type="checkbox" name="furnished">
							      </label>
							   </div>
							</div>            
							<div class="form-group">
                			<input type="text" name="sqft" placeholder="Sqft...." class="form-control" id="inputEmail3">
                  			</div>	         		
			              <div class="form-group">
			              	<button type="submit" class="btn btn-primary py-3 px-5" value="Post" name="postbtn">Post</button>                
			              </div>
			             
			            </form>
						</div>
					</div>
				</div>
			</div>
			</div>
			</div>

<%
 
		
		//String Add = request.getParameter("add");
	//	String city = request.getParameter("add");
	String mail=null;
	FileInputStream fis = null;
 	String email=(String)session.getAttribute("email");
 	Statement st = null;
 	String sql="select Cust_ID from cust_table where Email_ID='"+email+"'";
 	st = con.createStatement();
 	resultset = st.executeQuery(sql);
 	while(resultset.next())
 	{
 		 mail = resultset.getString("Cust_ID");
 		 System.out.println(mail);
 	}
    
	String address = request.getParameter("add");
	if((address==null) || (address.equals("")))
	{}
	else
	{
	System.out.println(address);
	String city = request.getParameter("city");
	String image_src = request.getParameter("image");
	System.out.println(city);
	String locality = request.getParameter("locality");
	System.out.println(locality);
	int price =Integer.parseInt(request.getParameter("price"));
	System.out.println(price);
	String bedroom = request.getParameter("room");
	System.out.println(bedroom);
	String furnished="no";
	 
	 if(request.getParameter("furnished") != null)
	 	furnished="yes";
	 
	
	System.out.println(furnished);
	int area = Integer.parseInt(request.getParameter("sqft"));
	System.out.println(area);
	
	File image = new File(image_src);
	
	ps=con.prepareStatement("insert into post_room(Cust_ID,Address,City,Locality,Price,Bedroom,Furnished,Area,images_1) values (?,?,?,?,?,?,?,?,?)");
	
	ps.setString(1,mail);
	ps.setString(2,address);
	ps.setString(3,city);
	ps.setString(4,locality);
	ps.setInt(5,price);
	ps.setString(6,bedroom);
	ps.setString(7,furnished);
	ps.setInt(8,area);
	fis = new FileInputStream(image);
    ps.setBinaryStream(9, (InputStream) fis, (int) (image.length()));
	
	int r = ps.executeUpdate();
	%>
	<script type="text/javascript">
	alert("<h1>Thank you for posting</h1>");
	</script>
	<%
	response.sendRedirect("index.jsp");
	//out.println("<h1>Thank you for posting</h1>");
	/*String button=request.getParameter("postbtn");
	if(button.equals("post"))
	{
	//response.sendRedirect("Ownerpostroom.jsp");
	out.println("<h1>Thank you for posting</h1>");
	} */
	
	}
 }
 catch(Exception e)
 {
	 System.out.println(e);
 }
 %>	
			
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