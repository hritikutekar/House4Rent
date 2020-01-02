<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Page</title>
</head>
<body>

</body>
</html>
<%

try
{
	Connection con=null;
	PreparedStatement ps=null;
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/room_for_rental", "root", "");
	if(con != null)
		System.out.println(con);
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String dob = request.getParameter("dob");
	String add = request.getParameter("address");
	int contact = Integer.parseInt(request.getParameter("contact"));
	String email = request.getParameter("email");
	
	
	ps=con.prepareStatement("insert into customer_table values (?,?,?,?,?,?,?)");
	
	ps.setString(1,id);
	ps.setString(2,name);
	ps.setString(3,gender);
	ps.setString(4,dob);
	ps.setString(5,add);
	ps.setInt(6,contact);
	ps.setString(7,email);
	
	int r = ps.executeUpdate();
	
	
	session.setAttribute("name", name);
	session.setAttribute("email",email);
	
	response.sendRedirect("Welcome.jsp");
	
	//out.println("Welcome" + session.getAttribute("name"));
	if(r>1)
		out.println(r);
	
}
catch(Exception e)
{
	System.out.println(e);
}
%>