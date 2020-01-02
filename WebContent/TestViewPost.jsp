<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    <%!
	    private String host;
		private String port;
		private String user;
		private String pass;
		
    	public void jspInit(){
    		// reads SMTP server setting from web.xml file
    		ServletContext context = getServletContext();
    		host = context.getInitParameter("host");
    		port = context.getInitParameter("port");
    		user = context.getInitParameter("user");
    		pass = context.getInitParameter("pass");
    	}
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
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
<title>Veiw Post Test</title>
</head>
<body style="background-image:url(images/back8.jpg)">
<center>
		<h3><% if(request.getAttribute("Message") != null) out.println(request.getAttribute("Message"));%></h3>
		<h3><% if(request.getParameter("verify") != null) out.println(request.getParameter("verify"));%></h3>
		<h3><% if(request.getParameter("unverify") != null) out.println(request.getParameter("unverify"));%></h3>
	</center>
<div class="table-responsive">
<table class="table table-bordered ">
<caption>
<center>
<h3><font color="black">
<b>Post List</b></font></h3>
</center>
</caption>

<!--  <table class="table table-striped">-->
			<thead>
			<tr>
			<td style=" color:black"><center><b>RoomID</center></b></td>
					<td style=" color:black"><b><center>Email id</center></b></td>
					<td style=" color:black"><b><center>Address</center></b></td>
					<td style=" color:black"><b><center>City</center></b></td>
					<td style=" color:black"><b><center>Locality</center></b></td>
					<td style=" color:black"><b><center>Price</center></b></td>
					<td style=" color:black"><b><center>Rooms</center></b></td>
					<td style=" color:black"><b><center>Furnished</center></b></td>
					<td style=" color:black"><b><center>Area</center></b></td>
					<td style=" color:black"><b><center>Status</center></b></td>
					<td style=" color:black"><b><center>Verification</center></b></td>
					<td style=" color:black"><b><center>Action</center></b></td>
			</tr>
			</thead>
			
			<tbody>
			<%
			int roomid=0;
			String email;
			try
			{
				Connection con=null;
				PreparedStatement ps=null;
				ResultSet rs=null;
				//ResultSet rs1=null;
				Statement st=null;
				

			    Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/room_for_rental", "root", "");
				if(con != null)
					System.out.println(con);
				
				st = con.createStatement();
				rs = st.executeQuery("select p.Room_ID,p.Address,p.City,p.Locality,p.Price,p.Bedroom,p.Furnished,p.Area,p.Status,p.Verification,c.Email_ID from post_room p,cust_table c where c.Cust_ID = p.Cust_ID");
				
				//rs1= st.executeQuery("SELECT Email_ID,Cust_ID from cust_table c where c.Email_ID=?");
				
				
				while(rs.next()){
					
			
				%>
				
				<tr>
				<td><%= roomid = rs.getInt(1) %>
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
		 				out.println("<a href='TestViewPost.jsp?ur_id=" + roomid + "' class='btn btn-primary'>Verify</a>");
	 				else
	 				out.println("<a href='TestViewPost.jsp?vr_id=" + roomid + "' class='btn btn-primary'>UnVerify</a>");
				 %>
				 
				 <a href='EmailForm.jsp?req=<%=rs.getString(11)%>' class='btn btn-primary'>Send Mail</a></td>
				 </tr>	
				 <%} %>	
			
			</tbody>
</table>
</div>

<%
		String ur_id = request.getParameter("ur_id");
		String vr_id = request.getParameter("vr_id");
		
		if (ur_id != null) { 


			int r = st.executeUpdate("update post_room set Verification='verified' where Room_ID='"+ur_id+"'");
			if(r>0)
			{
				String city = "",locality = "";
				
				rs = st.executeQuery("select Address,City,Locality,Price from post_room where Room_ID="+ur_id);
				
				if(rs.next()) {
					city =rs.getString("City");
					locality =rs.getString("Locality");
				}
				
				PreparedStatement psCompare = con.prepareStatement("SELECT c.Email_ID FROM cust_table c,requirement_table r WHERE r.Cust_ID = c.Cust_ID and r.City = ? and r.Locality = ?");
				
				psCompare.setString(1,city);
				psCompare.setString(2,locality);
				
				ResultSet rsCompare = psCompare.executeQuery();
				
				while(rsCompare.next()) {
					try {
						com.oxcytech.EmailUtility.sendEmail(host, port, user, pass, rsCompare.getString("Email_ID"), "Get Alert Room For Your Requirement","Room is available according to your requirement. Please visit www.room4rental.com for further details.");
					} catch (Exception ex) {
						ex.printStackTrace();
					} 
				}
				
				response.sendRedirect("TestViewPost.jsp?verify=Room verified successfully");
			}
			

		}
		else if (vr_id != null) { 


			int r = st.executeUpdate("update post_room set Verification='unverify' where Room_ID='"+vr_id+"'");
			if(r>0)
			{
				response.sendRedirect("TestViewPost.jsp?unverify=Room unverified successfully");
			}
			

		}
	}//Try close
			catch(Exception e)
			{
				System.out.println(e);
			}

%>
</body>
</html>