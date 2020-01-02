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
<title>RentalWelcomePage</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
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

<body style="background-image:url(images/bg17.jpg)">

<form action="" method="post">

<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <%String name=(String)session.getAttribute("name");  %>
          <a class="navbar-brand" href="#">Welcome <%=name %></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            
            
            <li><a href="Logout.jsp">Logout</a></li>
            
          </ul>
          
        </div>
      </div>
    </nav>
    
    <%
    String email = (String)session.getAttribute("email");
    System.out.println(email);
    //if(email.equals(null))
    if (session.getAttribute("email") == null || session.getAttribute("email").equals(""))
    {%>
    	<script>
    	window.location("login_new.jsp");
    	</script>
    	<%
    }
    %>
    
   
    <% 
    try
	{
	
	PreparedStatement ps=null;
	ResultSet rs=null;
	Statement statement=null;
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/room_for_rental", "root", "");
	if(con != null)
		statement=con.createStatement();
	rs=statement.executeQuery("select count(Room_ID) from shortlist_table,cust_table where cust_table.Cust_ID = shortlist_table.Cust_ID and cust_table.Email_ID = '" + session.getAttribute("email") + "'");
	rs.next();
	int c=rs.getInt(1);
    %>
    <br><br><br><br>
    <center>
    	<h3><% if(request.getParameter("insert") != null) out.println(request.getParameter("insert"));%></h3>
    	<h3><% if(request.getParameter("feedback") != null) out.println(request.getParameter("feedback"));%></h3>
    	<h3><% if(request.getParameter("changepass") != null) out.println(request.getParameter("changepass"));%></h3>
</center>
    <div class="container-fluid">
     <div class="row">
      <div class="col-sm-3 col-md-2 sidebar">
      <ul class="nav nav-sidebar">
         <li><button class="btn btn-primary" type="button">
         Shortlist<span class="badge"><%=c %></span>
</button></li>
         <li><a href="Newpostreq.jsp">Post Requirement</a></li>
          <li><a href="managerequirement.jsp">Manage Requirement</a></li>
            <li><a href="Getalert.jsp">Get Alerts</a></li>
			<li><a href="profile.jsp">Profile</a></li>
			<li><a href="changepassword.jsp">ChangePassword</a></li>
			<li><a href="Feedbackpage.jsp">Feedback</a></li>
	</ul>
      </div>
     </div>
     
     <%!String button,button1; %>
     
     <%
     button=request.getParameter("btn");
     button1 = request.getParameter("btnpost");
     System.out.println(button);
     //out.println("Welcome"+name);
     if(button.equals("ChangePassword"))
     {
     response.sendRedirect("ProfileEdit.html");
     }
     else if(button1.equals("Post"))
     {
     		response.sendRedirect("postrequirement.jsp");
     	}
          	}
     catch(Exception e)
     {
     	System.out.println(e);
     }
     %>
    </div>
</form>
</body>
</html>