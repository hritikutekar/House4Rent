<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Html Page</title>
</head>
<body>
<form action="">
<font>Username<input type = "text" name = "name"></font>
</font><br>
<input type = "submit" name = "submit" value = "submit" >
</form>
<%
String name=request.getParameter("name");
Cookie cookie = new Cookie ("name",name);
response.addCookie(cookie);
cookie.setMaxAge(50 * 50); //Time is in Minutes
%>
<a href="cookie3.jsp">Continue</a>
</body>
</html>