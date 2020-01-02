<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<%
String emailchk=(String)session.getAttribute("email");

//redirect user to home page if already logged in
if(emailchk==null){
    response.sendRedirect("Login.jsp");
}
%>

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Customer Page</title>

    <!-- Icons font css2-->
    <link href="vendor2/mdi-font/css2/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor2/font-awesome-4.7/css2/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- vendor2 css2-->
    <link href="vendor2/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor2/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main css2-->
    <link href="css2/main.css" rel="stylesheet" media="all">
</head>
<%
String cemail=(String)session.getAttribute("email"); 
String cname=(String)session.getAttribute("name"); 
%>
<body>
    <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title">Registration Form</h2>
                    <form method="POST" action="cust.jsp">
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Name</label>
                                    <input class="input--style-4" type="text" placeholder="Name" name="name" value=<%=cname %>>
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Address</label>
                                    <textarea class="form-control" rows="3" cols="50" name="address"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">DOB</label>
                                    <div class="input-group-icon">
                                        <input class="input--style-4 js2-datepicker" type="date" placeholder="DOB" name="dob">
                                        <i class="zmdi zmdi-calendar-note input-icon js2-btn-calendar"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Gender</label>
                                    <div class="p-t-10">
                                        <label class="radio-container m-r-45">Male
                                            <input type="radio" name="gender" id="optionsRadios1" value="male" checked>
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">Female
                                            <input type="radio" name="gender" id="optionsRadios2" value="female">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Email</label>
                                    <input class="input--style-4" type="email" id="inputEmail3" placeholder="Email" name="email" value=<%=cemail %>>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Phone Number</label>
                                    <input class="input--style-4" type="text" id="inputEmail3" placeholder="Contact" name="contact">
                                </div>
                            </div>
                        </div>
                        <div class="p-t-15">
                        <input class="btn btn--radius-2 btn--blue" type="submit" value="Submit">
                        </div>
                        <div class="p-t-15">
                        <input class="btn btn--radius-2 btn--blue" style="Padding : 5px;" type="submit" value="Cancel">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery js2-->
    <script src="vendor2/jquery/jquery.min.js"></script>
    <!-- vendor2 js2-->
    <script src="vendor2/select2/select2.min.js"></script>
    <script src="vendor2/datepicker/moment.min.js"></script>
    <script src="vendor2/datepicker/daterangepicker.js"></script>

    <!-- Main js2-->
    <script src="js2/global.js"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<%

try
{
	Connection con=null;
	PreparedStatement ps=null;
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/room_for_rental", "root", "");
	if(con != null)
		System.out.println(con);
	
	//String id = request.getParameter("id");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String dob = request.getParameter("dob");
	String add = request.getParameter("address");
	String contact = request.getParameter("contact");
	String email = request.getParameter("email");
	
	
	ps=con.prepareStatement("insert into cust_table(Name,Gender,Dob,Address,Mobile,Email_ID) values (?,?,?,?,?,?)");
	
	// ps.setString(1,id);
	ps.setString(1,name);
	ps.setString(2,gender);
	ps.setString(3,dob);
	ps.setString(4,add);
	ps.setString(5,contact);
	ps.setString(6,email);
	
	int r = ps.executeUpdate();
	
	
	session.setAttribute("name", name);
	session.setAttribute("email",email);
	
	response.sendRedirect("come.jsp");
	
	//out.println("Welcome" + session.getAttribute("name"));
	if(r>1)
		out.println(r);
	
}
catch(Exception e)
{
	System.out.println(e);
}
%>

<!-- end document-->