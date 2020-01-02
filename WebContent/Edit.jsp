<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.oxcytech.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
        ConnectionFile mycon=new ConnectionFile();
		Connection con=mycon.getConnection();
%>

<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->

<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Page</title>
    
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <meta name="description" content="company is a free job board template">
        <meta name="author" content="Ohidul">
        <meta name="keyword" content="html, css, bootstrap, job-board">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/form-elements.css">
        <link rel="stylesheet" href="css/fontello.css">
        <link rel="stylesheet" href="css/animate.css">        
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/owl.theme.css">
        <link rel="stylesheet" href="css/owl.transitions.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="responsive.css">
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
        
        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png">

</head>

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
              <a class="navbar-brand" href="#"><img src="img/logo.png" alt=""></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			    <ul class="main-nav nav navbar-nav navbar-right">
     
               
              </ul>
              <div class="button navbar-right">
                  <button class="navbar-btn nav-button wow fadeInRight" data-wow-delay="0.6s">Logout</button>
              </div>
          
            </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
        </nav><br>

<body style="background-image:url(images/bg9.jpg)">
<div class="container">
<div class="row">
<form action="" method="post">
<div class="col-sm-5 ">
<div class="form-top">
 <div class="form-top-left">
 <p>Edit Your Profile</p>
 </div>
 <div class="form-top-right">
 </div>
</div>
<%
try
{
	int custid=0;
	PreparedStatement ps=null;
	ResultSet rs=null;
	Statement st=null;
	int p1=0,p2=0;
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/room_for_rental", "root", "");
	if(con != null)
		System.out.println(con);
	
	String email=(String)session.getAttribute("email"); 	
	st = con.createStatement();
	rs =st.executeQuery("select Cust_ID,Name,Gender,Dob,Address,Mobile from cust_table where Email_ID='"+email+"'");
	 
	  while(rs.next())
	  {
	 	 custid = rs.getInt(1);
	 	 
	 	 %>
	 	 
	 	 <div class="form-bottom">
	 	 <div class="form-group">
<img src="images/templatemo_image_01.jpg" alt="image" /><br>
</div>

<div class="form-group">
                <input type="text" style="color:black" name="name"  value="<%=rs.getString(2)%>" placeholder="" class="form-control" id="inputEmail3" class="resizedTextbox">
                </div>
                
                <div class="form-group">
                <input type="text" style="color:black" name="gender"  value="<%=rs.getString(3)%>" placeholder="" class="form-control" id="inputEmail3" class="resizedTextbox">
                </div>
                
                <div class="form-group">
                <input type="text" style="color:black" name="dob"  value="<%=rs.getString(4)%>" placeholder="" class="form-control" id="inputEmail3" class="resizedTextbox">
                </div>
                
               <div class="form-group">
               <textarea   style="color:black" name="address"  placeholder="" class="form-control" id="inputEmail3" class="resizedTextbox"><%=rs.getString(5)%></textarea>
               </div>
                
                <div class="form-group">
                <input type="text" style="color:black" name="mobile"  value="<%=rs.getString(6)%>" placeholder="" class="form-control" id="inputEmail3" class="resizedTextbox">
                </div>
                
                <button type="submit" class="btn" value="Save" name="savebtn">Save</button>&nbsp
                <button type="submit" class="btn" value="Cancel" name="cancelbtn">Cancel</button>
	 	 </div>

<%
	}
   %>
   
   
   <%
	
	
	// int c=Integer.parseInt(request.getParameter("custid"));
	//	out.println(c);
	 String name=request.getParameter("name");
	 System.out.println(name);
	 String gender=request.getParameter("gender");
	 String dob=request.getParameter("dob");
	 String address=request.getParameter("address");
	 String mobile=request.getParameter("mobile");
	 
	 String button1 = request.getParameter("savebtn");	
	 if(button1.equals("Save"))
	 {
		ps=con.prepareStatement("Update cust_table set Name=?,Gender=?,Dob=?,Address=?,Mobile=? where Email_ID=?");
		
		ps.setString(1,name);
		ps.setString(2,gender);
		ps.setString(3,dob);
		ps.setString(4,address);
		ps.setString(5,mobile);
		ps.setString(6,email);
	
		ps.executeUpdate();
		response.sendRedirect("profile.jsp?edit=Your Profile is successfully updated");
		
	 }
	 else 
	 {
		 out.println("nooooooo");
	 }
	 	
		 
}
catch(Exception e)
{
	System.out.println(e);
}

%>
   
</div>
</form>
</div>
</div><br><br>

 <div class="footer-area">
            <div class="container">
           
                <div class="row footer-copy">
                    <p><span>(C) room4rental, All rights reserved</span> |  <a href="about.html">about us</a></span> | <a href="contact.us">contact us</a></span> </p>
                </div>
            </div>
        </div>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/wow.js"></script>
        <script src="js/main.js"></script>
 
 
 
 
        
	 
	 	 
</body>
</html>