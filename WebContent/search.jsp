<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="">
<%
try{
	Cookie cookie = null;
	Cookie[] cookies = null;
 cookies = request.getCookies();
 if( cookies != null )
 {
for (int i=0; i<cookies.length; i++)

    cookie = cookies[i];
    out.print("Name : " + cookie.getName( ) + ",  ");
    out.print("Value: " + cookie.getValue( )+" <br/>");
{
//if(cookies[i].getName().equals("city"))
//{
	//out.println("City"+cookies[i].getValue());
	//}
//else if(cookies[i].getName().equals("rooms"))
//{
	//out.println("Room"+cookies[i].getValue());
//}
}
//out.println("City"+cookies[i].getValue());
	
}
 else {  out.println("<h2>No cookies founds</h2>");
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
