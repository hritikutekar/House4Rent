<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Post Page</title>

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
<form action="Addpost.jsp" method="post">
<TABLE cellpadding="15" border="1">
<%
int roomid=0;
try{
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	    Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/room_for_rental", "root", "");
		//out.println("connected");
		
		// ps = con.prepareStatement("select Address,City,Locality,Price,Bedroom,Furnished,Area_to,Area_from,Status,Verified from post_room");
		
		Statement st=con.createStatement();
		rs = st.executeQuery("select Room_ID,Address,City,Locality,Price,Bedroom,Furnished,Area_to,Area_from,Status,Verified from post_room");
%>

<tr>
 <th>Address</th>
 <th>City</th>
 <th>Locality</th>
 <th>Price</th>
 <th>Bedroom</th>
 <th>Furnished</th>
 <th>Area_to</th>
 <th>Area_from</th>
 <th>Status</th>
 <th>Verified</th>
 </tr>
 
 <%
 while(rs.next()){
	 roomid = rs.getInt(1);
	 out.println(roomid);
 %>
 <tr>
 <td><%=rs.getString(2)%></td>
 <td><%=rs.getString(3)%></td>
 <td><%=rs.getString(4)%></td>
 <td><%=rs.getInt(5)%></td>
 <td><%=rs.getString(6)%></td>
 <td><%=rs.getString(7)%></td>
 <td><%=rs.getInt(8)%></td>
 <td><%=rs.getInt(9)%></td>
 <td><%=rs.getString(10)%></td>
 <td><%=rs.getInt(11)%></td>
 <td><input type="submit" value="Add" name="addpost"></td>
  </tr>

 <%
		}

	%>

  <%
}
catch(Exception e)
 {
	 System.out.println(e);
 }

%>
</TABLE>


</form>

</body>
</html>