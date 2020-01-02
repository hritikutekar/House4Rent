<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
     <%ResultSet resultset =null;%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Requirement</title>
 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

       <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="navbar.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

<body>

    <h3 class="sub-header">Update Requirement</h3><br>
       <div class="jumbotron">
       <form action="updateownerpost.jsp" method="post">
  <div class="form-group">
  
   
	  <% 
    try
 	{
    	int custid=0;
    	int requirementid=0;
	    Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		Statement st=null;
		int p1=0,p2=0;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/room_for_rental", "root", "");
		if(con != null)
			System.out.println(con);
		
		//String email=(String)session.getAttribute("email"); 
	    String req = request.getParameter("req");
		st = con.createStatement();
		rs =st.executeQuery("select Cust_ID,Address,City,Locality,Price,BedRoom,Furnished,Area from post_room where Room_ID='"+req+"'");
		 
	    while(rs.next())
		  {
		 	 custid = rs.getInt(1);
		 	 	Statement statement = con.createStatement() ;

	     resultset = statement.executeQuery("select * from locality");
	     %>
	  
	  <label for="exampleInputName2">Address</label>
    <div class="col-xs-4">
			<textarea class="form-control"  rows="3"  name="address" ><%=rs.getString(2)%></textarea>
			</br></br>
    <label for="exampleInputName2">City</label>
    <input type="text" class="form-control" id="exampleInputName2" placeholder="City" name="city" value="<%=rs.getString(3)%>"></br></br>
	 </div>
    </div></br></br>
	 
    
   <div class="form-group">
	  <label for="exampleInputName2" class="col-sm-2 control-label">Locality</label>
	  <div class="col-xs-4">
   <select class="form-control" id="sel1" name="locality" >
    <%  while(resultset.next()){
    	
    	
    	if(rs.getString(4).equals(resultset.getString(2)))
    		out.println("<option selected>" + resultset.getString(2) + "</option>");
    	else
    		out.println("<option>" + resultset.getString(2) + "</option>");
    		
         } %>
        </select>
         </div>
    </div></br></br>
    <div class="form-group">
    <label for="exampleInputName2">Price</label>
    <div class="col-xs-4">
    <input type="text" class="form-control" id="exampleInputName2" placeholder="Price" name="price" value="<%=rs.getInt(5)%>"></br></br>
    </div>
    </div>
    
    <div class="form-group">
  <label>BedRoom</label>
   <div class="col-xs-4">
  <select class="form-control" id="sel1" name="room"> 
  <%
   if(rs.getString(6).equals("RK"))
	   out.println("<option selected>RK</option>");
    else
    	out.println("<option>RK</option>");
    
    if(rs.getString(6).equals("1BHK"))
      out.println("<option selected>1BHK</option>");
    else
    	out.println("<option>1BHK</option>");
    
    if(rs.getString(6).equals("2BHK"))
       out.println("<option selected>2BHK</option>");
    else
    	out.println("<option>2BHK</option>");
    
    if(rs.getString(6).equals("3BHK"))
      out.println("<option selected>3BHK</option>");
    else
    	out.println("<option>3BHK</option>");
  %>
  
       </select>
       </div>
  </div>
  
 <div class="form-group">
  <label>Furnished</label>
  <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label>
         <%
   if(rs.getString(7).equals("yes"))
	   out.println("<input type='checkbox' name='furnished'checked > &nbsp &nbsp &nbsp &nbsp");
    else
    	out.println("<input type='checkbox' name='furnished' > &nbsp &nbsp &nbsp &nbsp");
  %>
         
        </label>
     </div></div>
    
  <div class="form-group">
   <label for="sell" class="col-sm-2 control-label">Area</label>
    <div class="col-xs-4">
    <input type="text" class="form-control" id="exampleInputName2" placeholder="Sqft" name="sqft" value=<%=rs.getInt(8)%> >&nbsp &nbsp &nbsp &nbsp
	</div>
   </div>
   <br>
    
 <input type="hidden" name="req" value="<%=request.getParameter("req")%>" />
  
  
	<div class="form-group">
 <input type="submit" value="Save" name="savebtn" align="middle">
  </div>
  </form>
</div>

 <%
		  }
	    
 if(request.getMethod().equalsIgnoreCase("POST")){
	 

	// int c=Integer.parseInt(request.getParameter("custid"));
	//	out.println(c);
	 String address=request.getParameter("address");
	 //System.out.println(address);
	 String city=request.getParameter("city");
	 String locality=request.getParameter("locality");
	 String req1=request.getParameter("req");
	 int price=Integer.parseInt(request.getParameter("price"));
	 String room=request.getParameter("room");
	 String furnished="no";
	 
	 if(request.getParameter("furnished") != null)
	 	furnished="yes";
	 
	 int sqft=Integer.parseInt(request.getParameter("sqft"));
	 String button1 = request.getParameter("savebtn");	
		System.out.println(button1);
if(button1.equals("Save"))
{
		ps=con.prepareStatement("Update post_room set Address=?,City=?,Locality=?,Price=?,Bedroom=?,Furnished=?,Area=? where Room_ID=?");
		
		ps.setString(1,address);
		ps.setString(2,city);
		ps.setString(3,locality);
		ps.setInt(4,price);
		ps.setString(5,room);
		ps.setString(6,furnished);
		ps.setInt(7,sqft);
		ps.setInt(8,Integer.parseInt(req1));
		ps.executeUpdate();
		response.sendRedirect("ownerpostmanage.jsp");
		
	}
	 else 
	 {
		 out.println("nooooooo");
	 }
 }  
		  }
 catch(Exception e)
 {
	 e.printStackTrace();
 }
 %>


        
 <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
    
    </body>
 </html>

    

   