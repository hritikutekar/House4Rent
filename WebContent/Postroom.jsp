<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Owner post room</title>
 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Post Room</title>

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

    <h3 class="sub-header">Post Room Form</h3><br>
       <div class="jumbotron">
  <div class="form-group">
  
<label for="exampleInputName2">Address</label>
    <div class="col-xs-4">
			<textarea class="form-control"  rows="3" placeholder="Address"></textarea>
			</br></br>
    <label for="exampleInputName2">City</label>
    <input type="text" class="form-control" id="exampleInputName2" placeholder="City"></br></br>
	  <label for="exampleInputName2">Locality</label>
    <input type="text" class="form-control" id="exampleInputName2" placeholder="Locality"></br></br>
	<label for="exampleInputName2">Price</label>
    <input type="text" class="form-control" id="exampleInputName2" placeholder="Price"></br></br>
	<label for="sell">Budget </label>
    <input type="text" class="form-control" id="exampleInputName2" placeholder="Rupee">&nbsp &nbsp &nbsp &nbsp
	<label for="sell">To</label>
    <input type="text" class="form-control" id="exampleInputName2" placeholder="Rupee"></br></br>
	
 <label for="sel1">BedRoom</label>
  <select class="form-control" id="sel1"> <option></option>
    <option>Select Room</option>
    <option>RK</option>
    <option>1BHK</option>
<option>2BHK</option>
<option>3BHK</option>	</select></br></br>
 </br>
 <div>
 <label for="sel1">Furnished</label>
     <div class="col-sm-offset-2 col-xs-4">
      <div class="checkbox">
        <label>
          <input type="checkbox"> &nbsp &nbsp &nbsp &nbsp
        </label>
		<label>
          <input type="checkbox">
        </label>
      </div>
    </div>
	  </div><br><br>
  
  <label for="sell">Area</label>
    <input type="text" class="form-control" id="exampleInputName2" placeholder="Sqft">&nbsp &nbsp &nbsp &nbsp
	
  <div class="form-group">
    <label for="exampleInputFile">Upload Image</label>
    <input type="file" id="exampleInputFile">
    <p class="help-block"></p>
  </div><br><br>
	&nbsp &nbsp &nbsp &nbsp <button type="button" class="btn btn-default">Post</button>
	&nbsp &nbsp &nbsp &nbsp <button type="button" class="btn btn-default">Cancel</button>
  </div>
  </div>

        <% 
        Connection con=null;
    	PreparedStatement ps=null;
    	Class.forName("com.mysql.jdbc.Driver");
    	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/room_for_rental", "root", "");
    	if(con != null)
    		System.out.println(con);

            Statement statement = con.createStatement();

            String add = request.getParameter("add");  

            ResultSet resultset = 
                statement.executeQuery("select * from post_room_table where Address = '" + add + "'") ; 

            if(!resultset.next()) {
                out.println("Sorry, could not find that post_room_table.");
            }
        %>

        
</body>
</html>





    

   