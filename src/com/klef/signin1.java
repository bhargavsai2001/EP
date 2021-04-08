package com.klef;
import java.sql.*;
import java.io.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class signin1
 */
public class signin1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public int n;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signin1() {
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
		response.setContentType("text/html;charset=UTF-8");

		doGet(request, response); 
		    PrintWriter out = response.getWriter();  
		          

		    n =Integer.parseInt(request.getParameter("sid"));
		    
		    String p=request.getParameter("psw");  
		          
		    if(login.validate(n, p)){  
		    	HttpSession session = request.getSession();
		    	session.setAttribute("Sid", n);
		    			    	
		        RequestDispatcher rd=request.getRequestDispatcher("logred");  
		        rd.forward(request,response);  
		    }  
		    else{  
		        out.print("<script>window.alert('Sorry username or password error')</script>");  
		        RequestDispatcher rd=request.getRequestDispatcher("signup.html");  
		        rd.include(request,response);  
		    }  
		          
		    out.close();  
	}

}
