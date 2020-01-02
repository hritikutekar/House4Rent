<%@page import="com.oxcytech.LoginDAO"%>
<jsp:useBean id="loginBean" class="com.oxcytech.LoginBean" scope="session"/>
<jsp:setProperty name="loginBean" property="*"/>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.oxcytech.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    
<!-- New design -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Bluesky template project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="styles/responsive.css">
<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
      
<script src="js/vendor/modernizr-2.6.2.min.js"></script>
</head>
<body>

<%
String emailchk=(String)session.getAttribute("email");

//redirect user to home page if already logged in
if(emailchk!=null){
    response.sendRedirect("Rentalcome.jsp");
}

String status=request.getParameter("status");

if(status!=null){
	if(status.equals("false")){
		   out.print("Incorrect login details!");	           		
	}
	else{
		out.print("Some error occurred!");
	}
}
%>

<!-- Body content -->

<div class="super_container">

<!-- Header -->

<header class="header">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="header_content d-flex flex-row align-items-center justify-content-start">
					<div class="logo">
						<a href="#"></a>
					</div>
					<nav class="main_nav">
						<ul>
							<li><a href="index.jsp">Home</a></li>
							<li><a href="properties.jsp?local=1&&set=0">Properties</a></li>
							<li><a href="about.html">About us</a></li>
							<li><a href="contact.html">Contact</a></li>
						</ul>			            	
					</nav>
					
				</div>
			</div>
		</div>
	</div>
</header>
</div>

<div class="limiter">
<div class="container-login100">
	<div class="wrap-login100 p-t-50 p-b-90">
		<form action="login_logic.jsp" method="POST" class="login100-form validate-form flex-sb flex-w">
			<span class="login100-form-title p-b-51">
				Login
			</span>
			
			
			
			<div class="wrap-input100 validate-input m-b-16" data-validate = "Username is required">
				<input class="input100" type="text" id="inputEmail3" name="email" placeholder="Email">
				<span class="focus-input100"></span>
			</div>
			
			<div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
				<input class="input100" type="password" id="inputEmail3" placeholder="Password" name="password">
				<span class="focus-input100"></span>
			</div>
			
			<div class="flex-sb-m w-full p-t-3 p-b-24">

			<div>
				<a href="Register.jsp" class="txt1">
					New User? Sign Up
				</a>
			</div>
			</div>

			<div class="container-login100-form-btn m-t-17">
				<button type="submit" class="login100-form-btn">
					Login
				</button>
			</div>

		</form>
	</div>
</div>
</div>


<div id="dropDownSelect1"></div>
    




   <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>

</body>
</html>



