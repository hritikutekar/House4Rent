<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fav page</title>
</head>
<body>
<form action ="" method="post">
<% 
try
	{
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	Statement statement=null;
	int p1=0,p2=0;
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/room_for_rental", "root", "");
	if(con != null)
		System.out.println(con);
	 statement = con.createStatement() ;
	
	// String q="select Room_ID,Cust_ID from post_room where Locality='"+loc+"' or Price between '"+p1+"'and'"+p2+"' or Bedroom='"+r+"'";
	//int c1=(Integer)session.getAttribute("room");
	String button;
  button=request.getParameter("favbtn");
	int c1=Integer.parseInt(request.getParameter("roomid"));
	System.out.println(c1);
	//int c=(Integer)session.getAttribute("room"); 
	int c=Integer.parseInt(request.getParameter("custid"));
		out.println(c);
ps=con.prepareStatement("insert into shortlist_table (Room_ID,Cust_ID) values(?,?)");
	   ps.setInt(1,c1);
	  ps.setInt(2,c);
	 ps.executeUpdate();
	      response.sendRedirect("Login.jsp");
	}

catch(Exception e)
{
		 System.out.println(e);
	 }
	      %>
	     
	      </form>
	      
</body>
</html>