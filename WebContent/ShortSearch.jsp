<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.oxcytech.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
      ConnectionFile mycon=new ConnectionFile();
	  Connection con=mycon.getConnection();
%>

<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Short Search </title>
        <meta name="description" content="company is a free job board template">
        <meta name="author" content="Ohidul">
        <meta name="keyword" content="html, css, bootstrap, job-board">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">

        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/fontello.css">
        <link rel="stylesheet" href="css/animate.css">        
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/owl.theme.css">
        <link rel="stylesheet" href="css/owl.transitions.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="responsive.css">
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
    </head>
    <body>

        <div id="preloader">
            <div id="status">&nbsp;</div>
        </div>
        <!-- Body content -->
		
  <nav class="navbar navbar-default">
          <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#"><img src="img/logo.png" alt=""></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			    <ul class="main-nav nav navbar-nav navbar-right">
     
               
              </ul>
              <div class="button navbar-right">
                  <button class="navbar-btn nav-button wow bounceInRight login" data-wow-delay="0.8s">Login</button>
                  <button class="navbar-btn nav-button wow fadeInRight" data-wow-delay="0.6s">Sign up</button>
              </div>
          
            </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
        </nav>


        <nav class="navbar navbar-default">
          <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
             <div class="row">
                    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-sm-12">
                    
                        <div class="search-form wow pulse" data-wow-delay="0.8s">
                            <form action="" class=" form-inline" method="post">
                                <div class="form-group">
                                     <!-- <input type="text" class="form-control" placeholder="Job Key Word">-->
                                     
                                     <% 
                                     int roomid=0;
                 					int custid=0;
   								 try
 									{
    	
										PreparedStatement ps=null;
										ResultSet rs=null;
										Statement statement=null;
										int p1=0,p2=0;
										String city,rooms,loc=null;
										int price=0;
									     statement = con.createStatement() ;
	    							    rs = statement.executeQuery("select * from locality");
	   							  %>
	   							  
	   							  <select name="locality" id="" class="form-control">
                                        <option value="-1">Select Your Locality</option>
                                        <%  while(rs.next()){ %>
                                        <option><%= rs.getString(2)%></option>
                                         <% } %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select name="price" id="" class="form-control">
                                        <option value="-1">Select Your Budget</option>
                                        <option value="1">1000 - 5000</option>
                                        <option value="2">5001 - 10000</option>
                                        <option value="3">10001 - 20000</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select name="room" id="" class="form-control">
                                        <option value="-1">Select Your Rooms</option>
                                        <option>RK</option>
  										<option>1BHK</option>
  										<option>2BHK</option>
  										<option>3BHK</option>
                                    </select>
                                </div>
                                <input type="submit" class="btn" value="Search">


                            </form>
                        </div>
                    </div>
                </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
         
            </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
        </nav>
        
        <%
        statement = con.createStatement() ;
	    rs = statement.executeQuery("select * from locality");
        int i=0;
 		while(rs.next()){
 			
 			i++;
 			
 		}
 		%>
        
	<div class="well well-sm">Rooms <%=i %></div>
				
					
				<%
				 								 if ("POST".equalsIgnoreCase(request.getMethod())) {
	   									 // Form was submitted.
	
 		 							 loc=request.getParameter("locality");
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
		 							 else if(p==3)
		 							 {
		 								 p1=10001;
		 								 p2=20000;
		 								 }
		 							 
		 // ps = con.prepareStatement("select (Room_ID,Address,City,Locality,Price,Bedroom,Furnished,Area_to,Area_from)from post_room where Locality=?,Price=?,Bedroom=?)");
		  statement=con.createStatement();
		 // String q="select Room_ID,Cust_ID,Address,City,Locality,Price,Bedroom,Furnished,Area from post_room where Locality='"+loc+"' and Price between '"+p1+"'and'"+p2+"' and Bedroom='"+r+"' and Status='available' and Verification='verified'";
		 String q="select Room_ID,Cust_ID,Locality,Price,Bedroom from post_room where Locality='"+loc+"' or Price between '"+p1+"'and'"+p2+"' or Bedroom='"+r+"' and Status='available' and Verification='verified'";

		//  System.out.println(q);
		  rs=statement.executeQuery(q);
		  
		     %>
			
										
						
						<%
 					while(rs.next()){
 						%>
 						<div class="well well-lg">
 						<div class="media">
 							<a class="pull-left" href="restaurantview.php?id=3"><img class="media-object" src="img/how-work1.png" width='120px' alt='Ad Image'></a>
 							<div class="media-body">
 								<h4 class="media-heading"><a href="roomdetail.jsp"><%=loc %></a></h4>
 								<TABLE class="table table-striped">
 								<tr>
 								<th>Locality</th>
 								<th>Price</th>
 								<th>Rooms</th>
 								</tr>
 								
 								<tr> <td><%=rs.getString(3)%></td>
  <td><%=rs.getString(4)%></td>
  <td><%=rs.getString(5)%></td>
  </tr>
  </TABLE>		
  <div class="form-group">
    <div class="col-sm-10">
    
   <a href=<%="\"fav.jsp?roomid="+roomid+"&custid="+custid+"\""%>> <input class="btn" type="button" value="Shortlist" name="favbtn"></a>
	<!--<INPUT Type="BUTTON" VALUE="Home Page" ONCLICK="href='fav.jsp'"> -->
  </div>
    </div><br><br>
  		</div>
				</div>
			</div>
  
 		<%						
	 roomid = rs.getInt(1);
		//out.println(roomid);
		custid = rs.getInt(2);
		//out.println(custid);
		
		session.setAttribute("room",roomid);
		  session.setAttribute("cust",custid);
 					}
 
 								 }
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		finally
		{
			
		}
		%>
						
			
			
										
      

        <div class="content-area">
          
           
         <div class="footer-area">
            <div class="container">
           
                <div class="row footer-copy">
                    <p><span>(C) room4rental, All rights reserved</span> |  <a href="about.html">about us</a></span> | <a href="contact.us">contact us</a></span> </p>
                </div>
            </div>
        </div>
		
		
		
		
		
		
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/wow.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
