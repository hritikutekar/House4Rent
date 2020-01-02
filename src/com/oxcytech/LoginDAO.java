package com.oxcytech;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
 
public class LoginDAO {
	public static String loginCheck(LoginBean loginBean){
		String query="select * from login_table where Email_ID=? and Password=?";
		
		try{
			ConnectionFile mycon=new ConnectionFile();
			Connection con=mycon.getConnection();
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,loginBean.getEmail());
			ps.setString(2,loginBean.getPassword());
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()){
				return "true";
			}
			else{
				return "false";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "error";
	}
}