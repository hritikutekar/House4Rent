<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<title>View Post</title>
</head>
<body>
<center><h2>View Post</h2>
 <TABLE cellpadding="15" border="1" style="background-color: #ffffcc;">
 <%
 int roomid=0;
 try{
 	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	Statement st=null;
	
	    Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/room_for_rental", "root", "");
		if(con != null)
			System.out.println(con);
		
		// ps = con.prepareStatement("select Address,City,Locality,Price,Bedroom,Furnished,Area_to,Area_from,Status,Verified from post_room");
		 st = con.createStatement() ;
	   			
		rs = st.executeQuery("select p.Room_ID,p.Address,p.City,p.Locality,p.Price,p.Bedroom,p.Furnished,p.Area,p.Status,p.Verification,c.Email_ID from post_room p,cust_table c where c.Cust_ID = p.Cust_ID");
 %>
  
 <tr>
 <th>Email ID</th>
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
 %>
 <tr>
 <td><a href="userdetails.jsp?profile=<%=rs.getString(11)%>"><%=rs.getString(11)%></a></td>
 <td><%=rs.getString(2)%></td>
 <td><%=rs.getString(3)%></td>
 <td><%=rs.getString(4)%></td>
 <td><%=rs.getInt(5)%></td>
 <td><%=rs.getString(6)%></td>
 <td><%=rs.getString(7)%></td>
 <td><%=rs.getInt(8)%></td>
 <td>
 	<% if(rs.getString(9).equals("available"))
	 		out.println("<font color='green'>" + rs.getString(9) + "</font>");
 		else
 			out.println("<font color='red'>" + rs.getString(9) + "</font>");
	 %>
 </td>
 <td>
 	<% if(rs.getString(10).equals("unverify"))
	 		out.println("<font color='red'>" + rs.getString(10) + "</font>");
 		else
 			out.println("<font color='green'>" + rs.getString(10) + "</font>");
	 %>
 </td>
 <td>
 <%	  
	 	if(rs.getString(10).equals("unverify"))
		 		out.println("<a href='viewpost.jsp?ur_id=" + roomid + "' class='btn btn-primary'>UnVerify</a>");
	 	else
	 			out.println("<a href='viewpost.jsp?vr_id=" + roomid + "' class='btn btn-primary'>Verified</a>");
 %>
 </td>
 </tr>
 <%
		}
	%>
	
 </TABLE>
</center>

<%
String ur_id = request.getParameter("ur_id");
 String vr_id = request.getParameter("vr_id");
 
if (ur_id != null) { 


	int r = st.executeUpdate("update post_room set Verification='verified' where Room_ID='"+ur_id+"'");
	if(r>0)
	{
		response.sendRedirect("viewpost.jsp");
	}
	

}
else if (vr_id != null) { 


	int r = st.executeUpdate("update post_room set Verification='unverify' where Room_ID='"+vr_id+"'");
	if(r>0)
	{
		response.sendRedirect("viewpost.jsp");
	}
	

}
//button=request.getParameter("Verified");

}
 catch(Exception e)
 {
	 System.out.println(e);
 }
%>
</body>
</html>