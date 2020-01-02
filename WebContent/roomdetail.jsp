<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.oxcytech.*"%>
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
        <title>Room Details </title>
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

     
<div class="container">	
	<%int roomid=0;
		int custid=0;
           try
           {
        	   ResultSet rs=null;
				Statement statement=null;
				
				Integer room_id=(Integer)session.getAttribute("room");
				System.out.println(room_id);
				
				 statement=con.createStatement();
				 rs=statement.executeQuery("select Address,City,Locality,Price,Bedroom,Furnished,Area from post_room where Room_ID='"+room_id+"'");
           %>
	<div class="row">
		<div class="well well-sm">
			<h3><%="Camp" %></h3>
		</div>
		<div class="col-sm-4 col-md-8">
			<div class="thumbnail">
				<section class="slider">
					<div class="flexslider">
						<ul class="slides">
							<li data-thumb="images/two.jpg"><img src="images/two1.jpg"  alt='Ad Image' /></li>						</ul>
					</div>
				</section>
				
								<div class="well well-sm">
				
			
				</div>
				<div class="caption">
					<p style="white-space: pre-wrap;">
					<TABLE class="table table-striped">
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
					while(rs.next())
					{%>
					
					<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getInt(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getInt(7)%></td>
					</tr>
						
				<%	}%>
					
					</TABLE>
					</tr>
  <div class="form-group">
    <div class="col-sm-10">
    
   <a href=<%="\"fav.jsp?roomid="+roomid+"&custid="+custid+"\""%>> <input class="btn" type="button" value="Shortlist" name="favbtn"></a>
	<!--<INPUT Type="BUTTON" VALUE="Home Page" ONCLICK="href='fav.jsp'"> -->
  </div>
    </div>
</p>
				</div>
				
				
						<%}
           catch(Exception e)
           {System.out.println(e);}
					
					%>
			</div>
			
		
			
		<div class="well well-sm"><h4>Sponsored Links</h4><a href='http://www.google.com' target='_blank'><b>Title Detail 1</b> Description 1 google.com</a></div><div class="well well-sm"><table></table>				<br>
			
				<script>
					var frmvalidator  = new Validator("commentform");
					frmvalidator.EnableOnPageErrorDisplay();
					frmvalidator.EnableMsgsTogether();
					
					frmvalidator.addValidation("comment","req","Please add some text in comment box");
					
					function loginValidation()
					{
						var frm = document.forms["commentform"];
						
						if(frm.valid.value == 1)
						{
							return true;
						}
						else
						{
							sfm_show_error_msg('Please login to add comment',frm.valid);
							return false;
						}
					}
					
					frmvalidator.setAddnlValidationFunction(loginValidation);
				</script>
			</div>
		</div>
		
		<div class="col-sm-4  blog-sidebar">
			<div class="sidebar-module sidebar-module-inset">
				<div class="well well-sm"><h3><a href='usershow.php?user=99b96a86f7ae7599df11b73b83737c89'>Stretch Gym</a></h3><h4>8888782507</h4></div><div class="well well-sm"><h4 id='address'>Washington Place New york city New York United States</h4></div>						<div class="caption">
							
						</div>
							</div>
			<br>
			<div class="sidebar-module">
				<form method="post" name="spamform" action="" role="form">
					<div class="form-group">
						<div id='spamform_reason_errorloc' class="error_strings"></div>
						<textarea class="form-control" name="reason" rows="3" placeholder="REPORT AS SPAM"></textarea>
						<div id='spamform_spam_valid_errorloc' class="error_strings"></div>
					</div>
					<input type="submit" class="btn btn-default" value="Spam"/>
					<input type="hidden" name="id" id="adid" value="3" />
					<input type="hidden" name="at" id="at" value="restaurant_ad" />
					<input type="hidden" name="spam_valid" id="check" value="0" />
				</form>
				<script>
					var frmvalidator  = new Validator("spamform");
					frmvalidator.EnableOnPageErrorDisplay();
					frmvalidator.EnableMsgsTogether();
					
					frmvalidator.addValidation("reason","req","Please specify reason for spam");
					
					function loginValidation()
					{
						var frm = document.forms["spamform"];
						
						if(frm.spam_valid.value == 1)
						{
							return true;
						}
						else
						{
							sfm_show_error_msg('Please login to add spam',frm.spam_valid);
							return false;
						}
					}
					
					frmvalidator.setAddnlValidationFunction(loginValidation);
				</script>
			</div>
			
			
		</div>
	</div>

					
      

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
