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
<title>Change Password</title>
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
              <a href="#">Welcome</a>
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
 <p>Change Your Password</p>
 </div>
 <div class="form-top-right">
                 <i class="fa fa-pencil"></i>
   </div>
</div>

<div class="form-bottom">
 <div class="form-group">
                <input type="password" style="height:50px" name="oldpass" placeholder="  Old Password...." class="form-control" id="inputEmail3">
        </div>
        
        <div class="form-group">
                <input type="password" style="height:50px" name="newpass" placeholder="  New Password...." class="form-control" id="inputEmail3">
        </div>
        
        <div class="form-group">
                <input type="password" style="height:50px" name="pass" placeholder="  Confirm Password...." class="form-control" id="inputEmail3">
        </div>
        <button type="submit" class="btn">Change Password</button>&nbsp
        
        <button type="reset" class="btn">Reset</button>&nbsp
       
</div>

<%
String oldpass,confirmPassword,newPassword,email,password,btn;
try
{
	email=(String)session.getAttribute("email");
	System.out.println(email);
	PreparedStatement ps=null;
	
	Statement stmt=con.createStatement();
	
	ResultSet rs=stmt.executeQuery("Select password from login_table where Email_ID='"+email+"'");
	rs.next();
	password=rs.getString(1);
	
	 oldpass = request.getParameter("oldpass");
	 newPassword = request.getParameter("newpass");
	 
	 if(password.equalsIgnoreCase(oldpass))
	 {
		 System.out.println("inserting");
			 ps =con.prepareStatement("update registration set Password=? where Email_ID=?");
			ps.setString(1,newPassword);
			ps.setString(2,email);
			ps.executeUpdate();
			 ps =con.prepareStatement("update login_table set Password=? where Email_ID=?");
			 ps.setString(1,newPassword);
				ps.setString(2,email);
			ps.executeUpdate();
			
			String utype=(String)session.getAttribute("utype");
			//String utype = session.getAttribute("utype");
	    	if(utype.equals("Rental"))
	    	{	
	    	response.sendRedirect("Rentalcome.jsp?changepass=Password changed successfully");
	    	}
	    	else if(utype.equals("Owner"))
	    	{	
	        	response.sendRedirect("come.jsp?changepass=Password changed successfully");
	        	}
			//response.sendRedirect("Rentalcome.jsp?changepass=Password changed successfully");
	 }
	 

}
catch(Exception e)
{
	out.println(e);
}

%>

</div>
</form>
</div>
</div><br><br><br>
<div class="footer-area">
            <div class="container">
           
                <div class="row footer-copy">
                    <p><span>(C) room4rental, All rights reserved</span> |  <a href="about.html">about us</a></span> | <a href="contact.us">contact us</a></span> </p>
                </div>
            </div>
        </div>
</body>
</html>