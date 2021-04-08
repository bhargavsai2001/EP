package com.klef;
import java.sql.*;
import java.io.*;
public class login {
	public static boolean validate(int id,String pass){  
		
		boolean status=false;  
		
		try{  
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ep","root","root");       
		PreparedStatement ps=con.prepareStatement("select * from signup where sid=? and password=?");  
		ps.setInt(1,id);  
		ps.setString(2,pass);  
		      
		ResultSet rs=ps.executeQuery();  
		status=rs.next();  
		          
		}
		catch(Exception e)
		{
			System.out.println(e);
		}  
		return status;  
	}

	

}
