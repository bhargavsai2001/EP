package com.klef;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class delete
 */
public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html;charset=UTF-8");
		    PrintWriter out = response.getWriter();  
		          

		    int did =Integer.parseInt(request.getParameter("did"));
		    
		    try {
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ep","root","root");  
				String s1 = "DELETE FROM ballot WHERE id=?";
				PreparedStatement ps = con.prepareStatement(s1);
				
				ps.setInt(1,did);  
				ps.executeUpdate();
				
				//response.sendRedirect("index.html");  
				String q = "<p align='center' style='border:2px solid green;box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border-radius: 5px; padding: 10px;'>";
				q += "Vote Deleted!</p><br>";
				q += "<a href='admin.jsp' align='center'>GO BACK</a>";
				out.print(q);
				//response.sendRedirect("admin.jsp");
	        	
				con.close();
			}
			catch(Exception e) {
				
				String z = "<h1>Error #404</h1><p style='border:2px solid #fb625e;box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border-radius: 5px; padding: 10px;'>";
	        	z += e;
	        	z += "</p>";
	        	
	        	
	        	String b = "<p><a href='admin.jsp'>GO BACK</a></p>;";
	        	
	        	out.println(z+b);
			}
		          
		   
		          
		    out.close();  
	}

}
