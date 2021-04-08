package com.klef;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import java.io.*;

/**
 * Servlet implementation class signup
 */
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		PrintWriter writer = response.getWriter();
		int id = Integer.parseInt(request.getParameter("sid"));
		String email = request.getParameter("umail");
		String password = request.getParameter("psw");
		String rpassword = request.getParameter("rpsw");
		String gender = request.getParameter("gender");
		
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ep","root","root");  
			String sa = "select * from signup";
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sa);
			int x=0;
		     while(rs.next()){
		             if(id == rs.getInt(2)) {
		            	 x++;
		             }
		             
		          
			
		     }
		     if(x==1) {
		    	 String q2 = "<p style='border:2px solid #00bb00;box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border-radius: 5px; padding: 10px;'>";
		          	q2 += "Account already exists.";
		          	q2 += "<a href='signin.html'>Try logging in.</a>";
		          	q2 += "</p>";
		          	writer.print(q2);
		     }
		     if(x==0) {
		    	 String s1 = "insert into signup values(?,?,?,?,?)";
		  			PreparedStatement ps = con.prepareStatement(s1);
		  			
		  			ps.setString(1,name);
		  			ps.setInt(2,id);
		  			ps.setString(3,email);
		  			ps.setString(4,password);
		  			ps.setString(5,gender);
		  			ps.executeUpdate();
		  			
		  			//response.sendRedirect("index.html");  
		  			String q = "<h1>SUCCESS</h1><p style='border:2px solid #00bb00;box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border-radius: 5px; padding: 10px;'>";
		          	q += "Account created Succesfully.";
		          	q += "<a href='signup.html'>GO Home</a>";
		          	q += "</p>";
		          	writer.print(q);
		  			con.close();
		     }
		     
			
			
		}
		catch(Exception e) {
			
			String z = "<h1>Error #404</h1><p style='border:2px solid #fb625e;box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border-radius: 5px; padding: 10px;'>";
        	z += e;
        	z += "</p>";
        	
        	
        	String b = "<p><a href='signup.html'>GO BACK</a></p>;";
        	
        	writer.println(z+b);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
