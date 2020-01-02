<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
	
	String gender = request.getParameter("ugender");
	
	ps=con.prepareStatement("insert into genderdemo values (?)");
	 ps.setString(1, gender);
	 ps.executeUpdate();
	 out.println("Data saved successfully");
}
catch(Exception e)
{
	System.out.println(e);
}
%>