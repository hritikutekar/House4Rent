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
        <link rel="stylesheet" href="css/fontello.css">
        <link rel="stylesheet" href="css/animate.css">        
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/owl.theme.css">
        <link rel="stylesheet" href="css/owl.transitions.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/form-elements.css">
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

		
		<form action="" method="post">
		<div class="col-sm-5 ">
		<div class="form-top">
 <div class="form-top-left">
 <p>Fill Requirement details</p>
 </div>
 <div class="form-top-right">
                 <i class="fa fa-pencil"></i>
                </div>
</div>
<div class="form-bottom">
	<!--  	<div class="form-group">
		<label for="exampleInputName2">Address</label><br>
		<div class="col-sm-4">
		<textarea class="form-control"  rows="3" placeholder="Address" name="address"></textarea>
		</div>
		</div><br><br><br>-->
		<div class="form-group">
                <textarea  name="address" placeholder="Address...." class="form-control" id="inputEmail3"></textarea>
                          </div>
		
		<!--  <div class="form-group">
    <label for="exampleInputName2">City</label><br><br>
     <div class="col-sm-4">
    <input type="text" class="form-control" id="exampleInputName2" placeholder="City" name="city"></br></br>
	 </div><br>
    </div></br></br>-->
    
                  <div class="form-group">
                <input type="text" name="city" placeholder="City...." class="form-control" id="inputEmail3">
                         </div>
		
<% ResultSet rs=null;
    try
 	{
	 
		PreparedStatement ps=null;
		
		Statement statement = con.createStatement() ;

	     rs = statement.executeQuery("select * from locality order by locality");
	     %>
	     
	     <div class="form-group">
	 
   <select class="form-control" id="sel1" name="locality"> <option value="-1">Select Locality</option> 
    <%  while(rs.next()){ %>
            <option><%= rs.getString(2)%></option>
        <% } %>
        </select>
           </div>
    
     
 <!--    <div class="form-group">
    <label for="exampleInputName2">Budget</label><br>
    <div class="col-sm-4">
    <input type="text" class="form-control" id="exampleInputName2" placeholder="Price" name="budget">
    </div>
    </div></br></br> -->
    
    			<div class="form-group">
                <input type="text"  name="budget" placeholder="Budget...." class="form-control" id="inputEmail3">
                         </div>
    
    
                  <button type="submit" class="btn" value="Post" name="postbtn">Post</button>&nbsp
                  <button type="submit" class="btn" value="Cancel" name="cancelbtn">Cancel</button>
    
    </div>
    </div>
    </form>
</div>
</div><br><br>
<%
 
		
		//String Add = request.getParameter("add");
	//	String city = request.getParameter("add");
	String mail=null;
 	String email=(String)session.getAttribute("email");
 	out.println(email);
 	Statement st = null;
 	String sql="select Cust_ID from cust_table where Email_ID='"+email+"'";
 	st = con.createStatement();
 	rs = st.executeQuery(sql);
 	while(rs.next())
 	{
 		 mail = rs.getString("Cust_ID");
 		 System.out.println(mail);
 	}
    
	String address = request.getParameter("address");
	if((address==null) || (address.equals("")))
	{}
	else
	{
	System.out.println(address);
	String city = request.getParameter("city");
	System.out.println(city);
	String locality = request.getParameter("locality");
	System.out.println(locality);
	int budget =Integer.parseInt(request.getParameter("budget"));
	System.out.println(budget);
	
	ps=con.prepareStatement("insert into requirement_table(Cust_ID,Address,City,Locality,Budget) values (?,?,?,?,?)");
	
	ps.setString(1,mail);
	ps.setString(2,address);
	ps.setString(3,city);
	ps.setString(4,locality);
	ps.setInt(5,budget);
	

	int r = ps.executeUpdate();
	%>
	<script type="text/javascript">
	alert("<h1>Thank you for posting</h1>");
	</script>
	<%
	response.sendRedirect("Rentalcome.jsp?insert=Post Requirement submitted successfully");
	//out.println("<h1>Thank you for posting</h1>");
	/*String button=request.getParameter("postbtn");
	if(button.equals("post"))
	{
	//response.sendRedirect("Ownerpostroom.jsp");
	out.println("<h1>Thank you for posting</h1>");
	} */
	
	}%>
	
	<%}
	catch(Exception e)
	{System.out.println(e);}%>
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