package com.klef;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;    
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ballot
 */
public class ballot extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ballot() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String vote = request.getParameter("vote");
		
		PrintWriter writer = response.getWriter();
		
		HttpSession session = request.getSession();
		int id = (int) session.getAttribute("Sid");
		//int id = Integer.parseInt(request.getParameter("sid"));
		
		String ver = request.getParameter("ver");
		
			try {
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ep","root","root");  
				String s1 = "insert into ballot values(?,?,?)";
				PreparedStatement ps = con.prepareStatement(s1);
				
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
				LocalDateTime now = LocalDateTime.now();  
				
				
				
				
				ps.setInt(1, id);
				ps.setString(2,vote);
				ps.setString(3,dtf.format(now));
				
			
				ps.executeUpdate();
				
				//response.sendRedirect("index.html");  
				String q = "<h1>SUCCESS</h1><p style='border:2px solid #00bb00;box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border-radius: 5px; padding: 10px;'>";
	        	q += "Vote placed Sucessfuly!";
	        	q += "<a href='index.html'>GO Home</a>";
	        	q += "</p>";
	        	writer.print(q);
				con.close();

		}
		catch(Exception e) {
			
			String z = "<p align='center' style='border:2px solid #fb625e;box-shadow: red 0px 3px 8px; border-radius: 5px; padding: 10px;'>";
			String er="ALREADY VOTED!";
			z += er;
        	z += "</p>";
        	//rgba(0, 0, 0, 0.24)
        	
        	String b = "<p><a href='ballot.jsp'>GO BACK</a></p>";
        	
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
