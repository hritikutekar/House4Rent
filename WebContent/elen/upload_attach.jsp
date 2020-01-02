<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.oxcytech.*" %>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert an Image into MySQL Database</title>
    </head>
    <body>
        <h1>Insert an Image into MySQL Database!</h1>
        <%
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            ConnectionFile mycon=new ConnectionFile();
        	Connection con=mycon.getConnection();
            FileInputStream fis = null;
 
            try {
                File image = new File("C:/Users/Ashu/Desktop/Project/Web Application/RoomForRentalApplication/WebContent/images/about_image.jpg");
                pstmt = con.prepareStatement("update `post_room` set images_1=? where Room_ID=37");
                fis = new FileInputStream(image);
                pstmt.setBinaryStream(1, (InputStream) fis, (int) (image.length()));
 
                int count = pstmt.executeUpdate();
                if (count > 0) {
                    System.out.println("The image has been inserted successfully");
                } else {
                    System.out.println("The image did not insert successfully");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                try {
                    if (rs != null) {
                        rs.close();
                        rs = null;
                    }
                    if (pstmt != null) {
                        pstmt.close();
                        pstmt = null;
                    }
                    if (con != null) {
                        con.close();
                        con = null;
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
 
        %>
    </body>
</html>