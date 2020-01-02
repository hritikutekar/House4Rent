<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import = "java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<title>View User</title>
</head>
<body style="background-image:url(images/back8.jpg)">
<form action="viewuser.jsp">
<div class="table-responsive">
<table class="table table-bordered ">
<caption>
<center>
<h3><font color="black">
<b>User List</b></font></h3>
</center>
</caption>

<!--  <table class="table table-striped">-->
			<thead>
			<tr style="background:blue-lighten">
			<td style=" color:black"><center><b>Customer ID</center></b></td>
					<td style=" color:black"><b><center>Name</center></b></td>
					<td style=" color:black"><b><center>Gender</center></b></td>
					<td style=" color:black"><b><center>DOB</center></b></td>
					<td style=" color:black"><b><center>Address</center></b></td>
					<td style=" color:black"><b><center>Mobile</center></b></td>
					<td style=" color:black"><b><center>Email ID</center></b></td>
			</tr>
			</thead>
			
<tbody>
<%
int custid=0;
try
{
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/room_for_rental", "root", "");
	//if(con != null)
	//	out.println(con);
	
	Statement st=con.createStatement();
	rs = st.executeQuery("select Cust_ID,Name,Gender,Dob,Address,Mobile,Email_ID from cust_table");
	%>
 
 <%
 while(rs.next())
 {
	 	  %>
	 
 <tr>
 <td><%=custid = rs.getInt(1) %></td>
 <td><%=rs.getString(2)%></td>
 <td><%=rs.getString(3)%></td>
 <td><%=rs.getString(4)%></td>
 <td><%=rs.getString(5)%></td>
 <td><%=rs.getString(6)%></td>
 <td><%=rs.getString(7)%></td>
  </tr>
       
   <%
	}
 %>
	</tbody>
	</table>
	</div>
	<% 
}
	catch(Exception e)
{
		out.println(e);
		}
		%>
</form>
</body>
</html>