<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.oxcytech.*"%>
    <%ResultSet resultset =null;%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
      ConnectionFile mycon=new ConnectionFile();
	  Connection con=mycon.getConnection();
%>

<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="icon" href="../../favicon.ico">

    <title>Post Room</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="navbar.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
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
        </nav><br><br>

<body style="background-image:url(images/bg9.jpg)">
<div class="container">	
<div class="row">
<form action="Ownerpostroom.jsp" method="post">
<div class="col-sm-5 ">
<div class="form-top">
 <div class="form-top-left">
 <p>Fill Your Room Details</p>
 </div>
 <div class="form-top-right">
                 <i class="fa fa-pencil"></i>
                </div>
</div>
<div class="form-bottom">
<div class="form-group">
<textarea class="form-control" placeholder="Address...." name="add"></textarea>
</div>

<div class="form-group">
                <input type="text" name="city" placeholder="City...." class="form-control" id="inputEmail3">
                         </div>
                        
    <% 
    try
 	{
	 
    	PreparedStatement ps=null;
		
    	Statement statement = con.createStatement() ;

	     resultset = statement.executeQuery("select * from locality");
	     %> 
	     
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
          <input type="checkbox" name="furnished"> &nbsp &nbsp &nbsp &nbsp
        </label>
     </div>
  </div>
  
  <div class="form-group">
                <input type="text" name="sqft" placeholder="Sqft...." class="form-control" id="inputEmail3">
       
                  </div>
                  
                   <button type="submit" class="btn" value="Post" name="postbtn">Post</button>&nbsp
                  <button type="submit" class="btn" value="Cancel" name="cancelbtn">Cancel</button>
            <%
 
		
		//String Add = request.getParameter("add");
	//	String city = request.getParameter("add");
	String mail=null;
 	String email=(String)session.getAttribute("email");
 	out.println(email);
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
	
	
	ps=con.prepareStatement("insert into post_room(Cust_ID,Address,City,Locality,Price,Bedroom,Furnished,Area) values (?,?,?,?,?,?,?,?)");
	
	ps.setString(1,mail);
	ps.setString(2,address);
	ps.setString(3,city);
	ps.setString(4,locality);
	ps.setInt(5,price);
	ps.setString(6,bedroom);
	ps.setString(7,furnished);
	ps.setInt(8,area);
	
	int r = ps.executeUpdate();
	%>
	<script type="text/javascript">
	alert("<h1>Thank you for posting</h1>");
	</script>
	<%
	response.sendRedirect("come.jsp");
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
 
 
  <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
    
    </body>
 </html>