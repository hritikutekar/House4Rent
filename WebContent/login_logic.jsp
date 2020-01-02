<%@page import="com.oxcytech.LoginDAO"%>
<jsp:useBean id="loginBean" class="com.oxcytech.LoginBean" scope="session"/>
<jsp:setProperty name="loginBean" property="*"/>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.oxcytech.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%

 
%>	

<%
try
{
	Connection con=null;
	PreparedStatement ps=null;
	String utypes=null;
	String uemail=null;
	 String pass=null;
	 String name=null;
	
	 String utype = request.getParameter("usertype"); 
	 String email = request.getParameter("email"); 
    //out.println(email);
    String pwd = request.getParameter("password");
   // out.println(pwd);
    Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/room_for_rental", "root", "");
	//out.println("connected");
	
 /*  Statement st = con.createStatement();
   ResultSet rs1 = st.executeQuery("select usertype from registration where Email_ID='"+email+"'");
  while(rs1.next())
  {
 	 utype = rs1.getString(1);
  }*/
  
 
    
    String query = "select Email_ID, password from login_table where Email_ID = ? and password = ?";
    ps = con.prepareStatement(query);
     ps.setString(1, email);
     ps.setString(2, pwd);
     ResultSet rs=ps.executeQuery();
     //ResultSet rs = st.executeQuery("select * from login_table");
    // ResultSet rs=null;
    while(rs.next())
    {
    	 uemail = rs.getString(1);
         pass = rs.getString(2);
        
    }
    
    if((email.equals(uemail)) && (pwd.equals(pass)))
    {
    	String sql="select name from registration,login_table where registration.Email_ID = ? and login_table.Email_ID=registration.Email_ID";
    	ps = con.prepareStatement(sql);
    	ps.setString(1, email);
    	ResultSet r =ps.executeQuery();
    
    	while(r.next())
    	{
    		 name = r.getString(1);
    		 
       	}
    	
    	Statement statement=null;
    	statement = con.createStatement() ;
	    rs = statement.executeQuery("select * from cust_table where Email_ID='"+email+"'");
	    String gender=null;
	    String cust_id=null;
	    while(rs.next())
    	{
	    	gender=rs.getString(3);
	    	cust_id=rs.getString(1);
    		 
       	}
	    
   		
  	   System.out.println( "Session ID="+session.getId());
  	
    	session.setAttribute("name",name);
    	
    	//String name=(String)session.getAttribute("name");
    	session.setAttribute("email", email);
    	session.setAttribute("utype", utype);
    	session.setAttribute("gender", gender);
    	session.setAttribute("cust_id", cust_id);
    	
    		String result=LoginDAO.loginCheck(loginBean);
    		 
    		if(result.equals("true")){
    			session.setAttribute("email",loginBean.getEmail());
    			response.sendRedirect("elen/index.jsp");
    		}
    		 
    		if(result.equals("false")){
    			response.sendRedirect("index.jsp?status=false");
    		}
    		 
    		if(result.equals("error")){
    		    response.sendRedirect("index.jsp?status=error");
    		}
    		
    	}

    //rs = st.executeQuery("select * from registration where email='" + email + "' and password='" + pwd + "'");
    /*if (rs.next()) {
        session.setAttribute("email", email);
       
        
        response.sendRedirect("Adminpanel.html");
    } else {
        out.println("Invalid password <a href='Login.html'>try again</a>");
    }*/
    
}catch(Exception e)
    {
    	System.out.println(e);
    }

%>

