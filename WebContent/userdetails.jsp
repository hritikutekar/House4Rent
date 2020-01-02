<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<title>Delete User</title>
</head>
<body>
<form action="deleteuser.jsp">
<TABLE cellpadding="15" border="1">
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
	if(request.getParameter("user")!=null)
		rs = st.executeQuery("select c.Cust_ID,c.Name,c.Gender,c.Dob,c.Address,c.Mobile,c.Email_ID from cust_table c, registration r where r.Email_ID = c.Email_ID");
	
	else if(request.getParameter("profile")!=null)
		rs = st.executeQuery("select Cust_ID,Name,Gender,Dob,Address,Mobile,Email_ID from cust_table where Email_ID='" + request.getParameter("profile") + "'");
	else
		;
%>

<tr>

 <th>Name</th>
 <th>Gender</th>
 <th>Dob</th>
 <th>Address</th>
 <th>Mobile</th>
 <th>Email_ID</th>

</tr>

 <%
 
 while(rs.next())
 {
	 custid = rs.getInt(1);
	// out.println(custid);
 %>
 
 <tr>
 
 <td><%=rs.getString(2)%></td>
 <td><%=rs.getString(3)%></td>
 <td><%=rs.getString(4)%></td>
 <td><%=rs.getString(5)%></td>
 <td><%=rs.getString(6)%></td>
 <td><%=rs.getString(7) %></td>
 <td><a href='userdetails.jsp?del=<%=custid%>' class='btn btn-primary' onClick="return confirm('Are you sure?')" >Delete</a></td>
  </tr>
  
  <%
		}
	%>
		</TABLE>
		
		
	<%
	String del = request.getParameter("del");
		
		if (del != null) { 


			int r = st.executeUpdate("DELETE from cust_table WHERE Cust_ID='"+del+"'");
			if(r>0)
			{
				response.sendRedirect("userdetails.jsp");
			}
			

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