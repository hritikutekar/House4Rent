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
<title>PostOwner</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">

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
        
<body style="background-image:url(images/bg18.jpg)">
<center><h2>Manage Post</h2>
<TABLE cellpadding="15" border="1" style="background-color: #ffffcc;">
<%
int roomid=0;
int custid=0;
try
{
	
	PreparedStatement ps=null;
	ResultSet rs=null;
	Statement st=null;
	
	    Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/room_for_rental", "root", "");
		if(con != null)
			System.out.println(con);
		
		String email=(String)session.getAttribute("email");
			//out.println(email);
			st = con.createStatement();
			rs=st.executeQuery("select Cust_ID from cust_table where Email_ID='"+email+"'");
			while(rs.next())
			{
				custid=rs.getInt(1);
				//out.println(custid);
			}
			
		st = con.createStatement() ;
			
		rs = st.executeQuery("select Room_ID,Address,City,Locality,Price,Bedroom,Furnished,Area,Verification,Status from post_room where Cust_ID='"+custid+"'");
		%>
		<tr>
 <th>Address</th>
 <th>City</th>
 <th>Locality</th>
 <th>Price</th>
 <th>Bedroom</th>
 <th>Furnished</th>
 <th>Area</th>
 <th>Status</th>
 <th>Verification</th>
 
 </tr>
 
 <%
 while(rs.next()){
	 roomid = rs.getInt(1);
		//out.println(roomid);
		session.setAttribute("room", roomid);
 %>
 
  <tr>
 <td><%=rs.getString(2)%></td>
 <td><%=rs.getString(3)%></td>
 <td><%=rs.getString(4)%></td>
 <td><%=rs.getInt(5)%></td>
 <td><%=rs.getString(6)%></td>
 <td><%=rs.getString(7)%></td>
 <td><%=rs.getInt(8)%></td>
<td>
 	<% if(rs.getString(10).equals("available"))
	 		out.println("<font color='green'>" + rs.getString(10) + "</font>");
 		else
 			out.println("<font color='red'>" + rs.getString(10) + "</font>");
	 %>
 </td>
 <td>
 	<% if(rs.getString(9).equals("unverify"))
	 		out.println("<font color='red'>" + rs.getString(9) + "</font>");
 		else
 			out.println("<font color='green'>" + rs.getString(9) + "</font>");
	 %>
 </td>
 

 
 
 <td><%	  
	 	if(rs.getString(10).equals("available"))
	 		out.println("<a href='ownerpostmanage.jsp?available_id=" + roomid + "' class='btn btn-primary'>Available</a>");
	 	else 			
            out.println("<a href='ownerpostmanage.jsp?booked_id=" + roomid + "' class='btn btn-primary'>Booked</a>");
 %></td>
 
 <td><a href='updateownerpost.jsp?req=<%=roomid%>' class='btn btn-primary'>Edit</a></td>
 <td><a href='ownerpostmanage.jsp?del=<%=roomid%>' class='btn btn-primary' onClick="return confirm('Are you sure?')" >Delete</a></td>
 
  </tr>


 
 <%
 String del = request.getParameter("del");
	
	if (del != null) { 


		int r = st.executeUpdate("DELETE from post_room WHERE Room_ID='"+del+"'");
		if(r>0)
		{
			response.sendRedirect("ownerpostmanage.jsp");
		}
		

	}
	
	
	String available_id = request.getParameter("available_id");
	 String booked_id = request.getParameter("booked_id");
	 
	if (available_id != null) { 


		st.executeUpdate("update post_room set Status='booked' where Room_ID='"+available_id+"'");
		
			response.sendRedirect("ownerpostmanage.jsp");
		
		

	}
	else if (booked_id != null) { 


		st.executeUpdate("update post_room set Status='available' where Room_ID='"+booked_id+"'");
		
			response.sendRedirect("ownerpostmanage.jsp");
		
		

	}
 }
 
	}
catch(Exception e)
{
	System.out.println(e);
	}
%>
</TABLE>
</center>
</body>
</html>