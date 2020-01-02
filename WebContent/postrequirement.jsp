<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
     <%ResultSet resultset =null;%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Post Requirement</title>
 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Post Requirement</title>

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

    <h3 class="sub-header">Post Requirement</h3><br>
       <div class="jumbotron">
       <form action="postrequirement.jsp" method="post">
      <div class="col-lg-8">
  <div class="form-group">
     <label for="exampleInputName2">Address</label><br>
    <div class="col-sm-4">
			<textarea class="form-control"  rows="3" placeholder="Address" name="address"></textarea>
			</div><br><br>
			<div>
			</br></br>
			<div class="form-group">
    <label for="exampleInputName2">City</label><br><br>
     <div class="col-sm-4">
    <input type="text" class="form-control" id="exampleInputName2" placeholder="City" name="city"></br></br>
	 </div><br>
    </div></br></br>
	 
	  <% 
    try
 	{
	 Connection con=null;
		PreparedStatement ps=null;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/room_for_rental", "root", "");
		if(con != null)
			System.out.println(con);
		Statement statement = con.createStatement() ;

	     resultset = statement.executeQuery("select * from locality");
	     %>
	  
	  
    
   <div class="form-group">
	  <label for="exampleInputName2" class="col-sm-4 control-label">Locality</label><br><br>
	  <div class="col-sm-4">
   <select class="form-control" id="sel1" name="locality"> <option value="-1"></option>  
    <%  while(resultset.next()){ %>
            <option><%= resultset.getString(2)%></option>
        <% } %>
        </select>
         </div><br>
    </div></br></br>
    
    <div class="form-group">
    <label for="exampleInputName2">Budget</label><br>
    <div class="col-sm-4">
    <input type="text" class="form-control" id="exampleInputName2" placeholder="Price" name="budget">
    </div>
    </div></br></br>
    
   
	<div class="form-group">
  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp<button type="submit" class="btn btn-default" name="postbtn" value="post">Post</button>
  </div>
  </form>
</div>

<%
 
		
		//String Add = request.getParameter("add");
	//	String city = request.getParameter("add");
	String mail=null;
 	String email=(String)session.getAttribute("email");
 	out.println(email);
 	Statement st = null;
 	String sql="select Cust_ID from cust_table where Email_ID='"+email+"'";
 	st = con.createStatement();
 	resultset = st.executeQuery(sql);
 	while(resultset.next())
 	{
 		 mail = resultset.getString("Cust_ID");
 		 System.out.println(mail);
 	}
    
	String address = request.getParameter("address");
	if((address==null) || (address.equals("")))
	{}
	else
	{
	System.out.println(address);
	String city = request.getParameter("city");
	System.out.println(city);
	String locality = request.getParameter("locality");
	System.out.println(locality);
	int budget =Integer.parseInt(request.getParameter("budget"));
	System.out.println(budget);
	
	ps=con.prepareStatement("insert into requirement_table(Cust_ID,Address,City,Locality,Budget) values (?,?,?,?,?)");
	
	ps.setString(1,mail);
	ps.setString(2,address);
	ps.setString(3,city);
	ps.setString(4,locality);
	ps.setInt(5,budget);
	

	int r = ps.executeUpdate();
	%>
	<script type="text/javascript">
	alert("<h1>Thank you for posting</h1>");
	</script>
	<%
	response.sendRedirect("Rentalcome.jsp");
	//out.println("<h1>Thank you for posting</h1>");
	/*String button=request.getParameter("postbtn");
	if(button.equals("post"))
	{
	//response.sendRedirect("Ownerpostroom.jsp");
	out.println("<h1>Thank you for posting</h1>");
	} */
	
	}
 }
 catch(Exception e)
 {
	 System.out.println(e);
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

    

   