<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
	rs = st.executeQuery("select Cust_ID,Name,Gender,Dob,Address,Mobile,Email_ID from cust_table");
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
	 out.println(custid);
 %>
 
 <tr>
 <td><%=rs.getString(2)%></td>
 <td><%=rs.getString(3)%></td>
 <td><%=rs.getString(4)%></td>
 <td><%=rs.getString(5)%></td>
 <td><%=rs.getInt(6)%></td>
 <td><%=rs.getString(7) %></td>
 <td></td>
  </tr>
  
  <%
		}
	%>
		</TABLE>
		<%
 String button;
button=request.getParameter("deleteuser");
if(button.equals("delete"))
{
	int r = st.executeUpdate("delete from cust_table where Cust_ID='"+custid+"'");
	//int r = st.executeUpdate("update  set Verified=1 where Room_ID='"+custid+"'");
	if(r>0)
	{
		out.println("deleted");
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