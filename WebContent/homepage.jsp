<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home page</title>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
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
</head>
<body>
<form action ="" method="post">
<% int roomid=0;
   int custid=0;
    try
 	{
    	
	 	Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		Statement statement=null;
		int p1=0,p2=0;
		String city,rooms=null;
		int price=0;
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/room_for_rental", "root", "");
		if(con != null)
			System.out.println(con);
		
		 statement = con.createStatement() ;
	     rs = statement.executeQuery("select * from locality");
	     %>
	     
	      
    <div class="form-group">
	  <label for="exampleInputName2" class="col-sm-2 control-label">Locality</label>
	  <div class="col-xs-4">
   <select class="form-control" id="sel1" name="locality"> <option value="-1">Select Locality</option>  
    <%  while(rs.next()){ %>
            <option><%= rs.getString(2)%></option>
        <% } %>
        </select>
         </div>
    </div></br></br>
    
    <div class="form-group">
	<label for="exampleInputName2" class="col-sm-2 control-label">Budget</label>
	 <select name="price" >
	 <option value="-1">Select Budget</option>
   <option value="1">1000 - 5000</option>
   <option value="2">5001 - 10000</option>
   </select>
    </div>
    
    <div class="form-group">
  <label for="sel1" class="col-sm-2 control-label">BedRoom</label>
   <div class="col-xs-4">
  <select class="form-control" id="sel1" name="room"> 
  <option value="-1">Select Room</option>
  <option>RK</option>
  <option>1BHK</option>
  <option>2BHK</option>
  <option>3BHK</option>
       </select>
       </div>
  </div><br>
 
  <div class="form-group">
  <button type="submit" class="btn btn-default" name="searchbtn" value="search">Search</button>
  </div>
  <%
  if ("POST".equalsIgnoreCase(request.getMethod())) {
	    // Form was submitted.
	
 		 String loc=request.getParameter("locality");
		  int p=Integer.parseInt(request.getParameter("price"));
		  String r =request.getParameter("room");
		 
		  if(p==1)
		  {
			   p1=1000;
			   p2=5000;
		  }
		  else if(p==2)
		  {
			   p1=5001;
			   p2 =10000;
		  }
		 // ps = con.prepareStatement("select (Room_ID,Address,City,Locality,Price,Bedroom,Furnished,Area_to,Area_from)from post_room where Locality=?,Price=?,Bedroom=?)");
		  statement=con.createStatement();
		  String q="select Room_ID,Cust_ID,Address,City,Locality,Price,Bedroom,Furnished,Area from post_room where Locality='"+loc+"' and Price between '"+p1+"'and'"+p2+"' and Bedroom='"+r+"' and Status='available' and Verification='verified'";
		  System.out.println(q);
		  rs=statement.executeQuery(q);
		  
  
		   %>
	<TABLE cellpadding="15" border="1" style="background-color: #ffffcc;">	  
 <tr>
 <th>Address</th>
 <th>City</th>
 <th>Locality</th>
 <th>Price</th>
 <th>Bedroom</th>
 <th>Furnished</th>
 <th>Area</th>
 
  </tr>
  <%
 while(rs.next()){
	 roomid = rs.getInt(1);
		//out.println(roomid);
		custid = rs.getInt(2);
		//out.println(custid);
		session.setAttribute("room",roomid);
		  session.setAttribute("cust",custid);
 %>
 
  <tr>
 <td><%=rs.getString(3)%></td>
 <td><%=city=rs.getString(4)%></td>
 <td><%=rooms=rs.getString(5)%></td>
 <td><%=price=rs.getInt(6)%></td>
 <td><%=rs.getString(7)%></td>
 <td><%=rs.getString(8)%></td>
 <td><%=rs.getInt(9)%></td>
 
 <td>
  <div class="form-group">
    <div class="col-sm-10">
    
   <a href=<%="\"fav.jsp?roomid="+roomid+"&custid="+custid+"\""%>> <input class="btn btn-default" type="button" value="Shortlist" name="favbtn"></a>
	<!--<INPUT Type="BUTTON" VALUE="Home Page" ONCLICK="href='fav.jsp'"> -->
  </div>
    </div><br><br></td>
 </tr>
 
 <% 
 Cookie c = new Cookie ("city",city);
 Cookie ro = new Cookie ("room",rooms);
 //Cookie cookie2 = new Cookie ("range",price);
 response.addCookie(c);
 response.addCookie(ro);
 c.setMaxAge(60*60*24);
 ro.setMaxAge(60*60*24);
 //Time is in Minutes
 		}
  }
 	}
  catch(Exception e)
  {
		 System.out.println(e);
	 }
 %>
 
 </TABLE>
	 </form>
</body>
</html>