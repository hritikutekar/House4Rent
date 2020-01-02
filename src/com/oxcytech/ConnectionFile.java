package com.oxcytech;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFile {
	
static Connection con = null;
	
	public static Connection getConnection() {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/room_for_rental","root","");
		}
		catch(ClassNotFoundException cnfe){
			cnfe.printStackTrace();
		}
		catch (SQLException se) {
			se.printStackTrace();
		}
		
		return con;
	}



public static void main(String args[])
{
	Connection con=ConnectionFile.getConnection();
	System.out.println(con);
}
}

