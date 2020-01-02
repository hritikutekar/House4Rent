<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Feedback</title>

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
<body><h2>View Feedback</h2>
<form action="" method="post">
<%
int custid=0;
try
{
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null,rs1=null;
	Statement st=null;
	
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/room_for_rental", "root", "");
	//if(con != null)
	//	out.println(con);
	
	
	 st=con.createStatement();
	rs =st.executeQuery("select f.Cust_ID,c.Email_ID,f.Message from feedback_table f,cust_table c where c.Cust_ID = f.Cust_ID");
			
		%>
<center><table 	cellpadding="15" border="1">
<tr>
<td>Email ID</td>
<td>Message</td>
</tr>

 <%
 while(rs.next())
 {
	 custid = rs.getInt(1);
	 //out.println(custid);
	  %>
 <tr>
 <td><a href="userdetails.jsp?profile=<%=rs.getString(2)%>"><%=rs.getString(2)%></a></td>
 <td><%=rs.getString(3)%></td>
 </tr>
 
 <%} %>
 
 </table></center>

<% 
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</form>
</body>
</html>