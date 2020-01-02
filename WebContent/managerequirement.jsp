<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.oxcytech.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
        ConnectionFile mycon=new ConnectionFile();
		Connection con=mycon.getConnection();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<title>View Post</title>

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
              <a class="navbar-brand" href="#"><b>Welcome</b></a>
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

<body style="background-image:url(images/bg18.jpg)"><br>
<center>
	 	<h3><% if(request.getParameter("update") != null) out.println(request.getParameter("update"));%></h3>
    	<h3><% if(request.getParameter("delete") != null) out.println(request.getParameter("delete"));%></h3>
	
</center>
<div class="container">
<div class="row">	
<center><h2>Manage Requirement</h2>
 <TABLE class="table table-bordered ">
 <%
 int requirementid=0;
 try{
 	
	PreparedStatement ps=null;
	ResultSet rs=null;
	Statement st=null;
	
	    Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/room_for_rental", "root", "");
		if(con != null)
			System.out.println(con);
		
		// ps = con.prepareStatement("select Address,City,Locality,Price,Bedroom,Furnished,Area_to,Area_from,Status,Verified from post_room");
		 st = con.createStatement() ;
	   			
		rs = st.executeQuery("select r.Requirement_ID,r.Address,r.City,r.Locality,r.Budget from requirement_table r,cust_table c WHERE r.Cust_ID = c.Cust_ID and c.Email_ID='" + session.getAttribute("email") + "'");
 %>
  
 <tr style="background:black">
 <th style="color:white"><center><b>Address</b></center></th>
 <th style="color:white"><center><b>City</b></center></th>
 <th style="color:white"><center><b>Locality</b></center></th>
 <th style="color:white"><center><b>Budget</b></center></th>
 <th style="color:white" width="200"><center><b>Action</b></center></th>
 
 </tr>
 <%
 while(rs.next()){
	 requirementid = rs.getInt(1);
		//out.println(requirementid);
 %>
 <tr style="color:black">
 <td><center><%=rs.getString(2)%></center></td>
 <td><center><%=rs.getString(3)%></center></td>
 <td><center><%=rs.getString(4)%></center></td>
 <td><center><%=rs.getInt(5)%></center></td>
<td><center><a href='updaterequirement.jsp?req=<%=requirementid%>' class='btn btn-primary'>Edit</a>
&nbsp &nbsp &nbsp
<a href='managerequirement.jsp?del=<%=requirementid%>' class='btn btn-primary' onClick="return confirm('Are you sure?')" >Delete</a>
 
 </tr>
 <%
 
 String del = request.getParameter("del");
	
	if (del != null) { 


		int r = st.executeUpdate("DELETE from requirement_table WHERE Requirement_ID='"+del+"'");
		if(r>0)
		{
			response.sendRedirect("managerequirement.jsp?delete=Post Requirement deleted successfully");
		}
		

	}
		}
	%>
 </TABLE></center>


<%

}
 catch(Exception e)
 {
	 System.out.println(e);
 }
%>
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