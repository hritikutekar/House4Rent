<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Welcome Page</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="navbar-fixed-top.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<form action="">
 <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">UserName</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            
            
            <li><a href="Logout.jsp">Logout</a></li>
            
          </ul>
          
        </div>
      </div>
    </nav>
<br><br><br><br>
<div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            
            <li><a href="#">Recent Searches</a></li>
            <li><a href="#">Shortlist</a></li>
            <li><a href="#">Get Alerts</a></li>
			<li><a href="#">Profile</a></li>
			
          </ul>
          
        </div>
        </div>
 <div class="form-group">
  <input class="btn btn-default" type="submit" value="ChangePassword" name="btn">
  </div>
  
  <div class="form-group">
  <input class="btn btn-default" type="submit" value="Post" name="btnpost">
  </div>
  </form>
  </div>
<%!String button; %>

<%
if(session.getAttribute("email") == null || session.getAttribute("email").equals(""))
{
	response.sendRedirect("Login.jsp");
}
button=request.getParameter("btn");
System.out.println(button);
String name=(String)session.getAttribute("name"); 
out.println("Welcome"+name);
if(button.equals("ChangePassword"))
{
response.sendRedirect("ProfileEdit.html");
}
%>

</body>
</html>