<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
     <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="icon" href="../../favicon.ico">
   <title>Login Page</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
 <link rel="stylesheet" href="css/font-awesome.min.css">
 <link rel="stylesheet" href="css/form-elements.css">
  <link rel="stylesheet" href="css/style.css">
    <!-- Custom styles for this template -->
    <link href="navbar-fixed-top.css" rel="stylesheet">
    
    <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body style="background-image:url(images/back8.jpg)">

<!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">RoomForRental</a>
        </div>
        
      </div>
    </nav><br><br>
    
     
      
             <div class="top-content">
             <div class="inner-bg">
             <div class="container">
              <div class="row">
              <div class="col-sm-8 col-sm-offset-2 text">
              <h1><strong>Admin Login</strong></h1>
              </div>
              </div>
              
             
               <div class="col-sm-5 ">
               <div class="form-top">
               <div class="form-top-left">
               <p>Fill login details</p>
                </div>
                <div class="form-top-right">
                 <i class="fa fa-pencil"></i>
                </div>
                </div>
               
                <div class="form-bottom">
                <form action = "Adminlogin.jsp" method="post">
                
                 <div class="form-group">
         <label class="sr-only" for="form-first-name">Username</label>
        <input type="text" name="adminemail" placeholder="Username...." class="form-control" id="inputEmail3">
        <!--     <input type="text" class="form-control" id="inputEmail3" placeholder="Email" name="adminemail">-->
                  </div>
        
        <div class="form-group">
     <!--  <label for="inputEmail3" class="col-sm-2 control-label">Password</label>-->
     <label class="sr-only" for="form-first-name">Password</label>
      <input type="password" style="height:50px" name="adminpassword" placeholder="  Password...." class="form-control" id="inputEmail3">       
        <!--  <input type="password" class="form-control" id="inputEmail3" placeholder=" Password" name="adminpassword">-->
        </div>
        
        <button type="submit" class="btn">Login</button>&nbsp
        
        <a href=#>Forgot Password</a>
         </div><br>
         
   <!--     <div class="form-group">
          <div class="col-sm-10">
          &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
  <input class="btn btn-default" type="submit" value="Login"> 
          </div>
         </div>--> 
         </form>
       </div>
       </div>
        </div>
        </div>
        </div>
        </div>
                
<%
try
{
	Connection con=null;
	PreparedStatement ps=null;
	String username=null;
	String adminpass=null;
	
    
    Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/room_for_rental", "root", "");
	//out.println(con);
	
	String email = request.getParameter("adminemail"); 
        String pwd = request.getParameter("adminpassword");
    
    
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select Email_ID,Password from adminregistration");
    while(rs.next())
    {
    	 username = rs.getString(1);
    	     adminpass = rs.getString(2);
         
    }
    
    if((email.equals(username)) && (pwd.equals(adminpass)))
    {
    	//String s ="select Email_ID,Password from adminregistration where adminregistration.Email_ID=adminregistration.Email_ID";
    	//rs = st.executeQuery(s);
    	//ps.setString(1, email);
    	response.sendRedirect("Adminpanel.html");
        
    }
    else
    {
    	out.println("Invalid password <a href='Adminlogin.jsp'>try again</a>");
    }
    
}catch(Exception e)
    {
    	System.out.println(e);
    }

%>

</body>
</html>