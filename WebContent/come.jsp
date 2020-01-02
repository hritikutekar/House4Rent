<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
String emailchk=(String)session.getAttribute("email"); 
if (emailchk==null) {
	response.sendRedirect("Login.jsp");
}
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WelcomePage</title>
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
    
<body>
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
 Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	Statement statement=null;
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/room_for_rental", "root", "");
	if(con != null)
		statement=con.createStatement();
	rs=statement.executeQuery("select count(Room_ID) from shortlist_table where Cust_ID=1");
	rs.next();
	int c=rs.getInt(1);
		%>
    <br><br><br><br>
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
          	<li><a href="profile.jsp">Profile</a></li>
			<li><a href="changepassword.jsp">ChangePassword</a></li>
			<li><a href="Ownerpostroom.jsp">Post Room</a></li>
			<li><a href="ownerpostmanage.jsp">Manage Post</a></li>	
			<li><a href="Feedbackpage.jsp">Feedback</a></li>
			<li><a href="#">Boost</a></li>
			          </ul>
          
        </div>
        </div>
       
<%!String button,button1; %>
<% 
//String str=(String)session.getAttribute("email");
	
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
		response.sendRedirect("Ownerpostroom.jsp");
	}
	}
catch(Exception e)
{
	System.out.println(e);
}

%>
</form>
</body>
</html>