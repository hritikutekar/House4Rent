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
<html lang="en">
<head>
<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Post Requirement</title>
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

<!-- Fixed navbar -->
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
              <a  href="#">Welcome</a>
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
    <form>
    <div class="col-sm-5 ">
    <div class="form-top">
    <div class="form-top-left">
 <p>Send Your Feedback</p>
 </div>
 
 <div class="form-top-right">
                 <i class="fa fa-pencil"></i>
                </div>
    </div>
    
    <div class="form-bottom">
    <%String name=(String)session.getAttribute("name");
    String email=(String)session.getAttribute("email");
	out.println(email);%>
    <div class="form-group">
                <input type="text" name="name" placeholder="" class="form-control" id="inputEmail3" value=<%=name %>>
                         </div>
                         
                         <div class="form-group">
                <textarea  name="feedback" placeholder="Message...." class="form-control" id="inputEmail3"></textarea>
                          </div>
                          
                          <button type="submit" class="btn" value="Send" name="feedbackbtn">Send</button>&nbsp
                  <button type="submit" class="btn" value="Cancel" name="cancelbtn">Cancel</button>
               
  <%
  try
  {
	  
		PreparedStatement ps=null;
		Statement st=null;
		ResultSet rs=null;
		int c=0,r=0;
		
		
  				st = con.createStatement();
    		  rs = st.executeQuery("select Cust_ID from cust_table where Email_ID='"+email+"'");
    		  System.out.println(rs);
    		 
    		  while(rs.next())
    		 	{
    		 		  c = Integer.parseInt(rs.getString("Cust_ID"));
    		 		 System.out.println(c);
    		 	}
    		  
    		  st = con.createStatement();
    		  rs = st.executeQuery("select Room_ID from post_room where Cust_ID='"+c+"'");
    		  System.out.println(rs);    		
    		  
    		  while(rs.next())
    		 	{
    		 		  r = Integer.parseInt(rs.getString("Room_ID"));
    		 		 System.out.println(r);
    		 	} 
    		  
  			// int r = (Integer)session.getAttribute("Room_ID");
    		// System.out.println(r);
    		// int c =(Integer)session.getAttribute("Cust_ID");
    		// System.out.println(c);
    		 
    		  
    			
    			//st = con.createStatement();
    			//rs = st.executeQuery("select Cust_ID,Room_ID from post_room where");
    			//String name=request.getParameter("name");
    			String msg = request.getParameter("feedback");
    			ps = con.prepareStatement("insert into feedback_table values(?,?,?)");
    			ps.setInt(1,c);
    			ps.setInt(2,r);
    			ps.setString(3,msg);
    			ps.executeUpdate();
    			
    			response.sendRedirect("Rentalcome.jsp?feedback=Feedback sent successfully");
  }
  catch(Exception e)
  {
 	 System.out.println(e);
  }
    			 			
  %>
  </div>
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