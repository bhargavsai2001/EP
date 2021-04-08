package com.klef;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class adlog
 */
public class adlog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adlog() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 response.setContentType("text/html");  
		    PrintWriter out = response.getWriter();  
		          

		    long sky =Integer.parseInt(request.getParameter("sckey"));
		    long osky = 20012001;
		          
		    if(sky==osky){  
		    	HttpSession session = request.getSession();
		    	session.setAttribute("adlog", "Admin");
		        RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");  
		        rd.forward(request,response);  
		        
		    }  
		    else{  
		        out.print("<script>window.alert('WRONG SCECRET KEY')</script>");  
		        RequestDispatcher rd=request.getRequestDispatcher("adminlogin.jsp");  
		        rd.include(request,response);  
		    }  
		          
		    out.close();  
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
