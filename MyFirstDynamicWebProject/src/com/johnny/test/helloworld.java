package com.johnny.test;


import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class helloworld extends HttpServlet implements javax.servlet.Servlet{
	   /* (non-Java-doc)
		 * @see javax.servlet.http.HttpServlet#HttpServlet()
		 */
		public helloworld() {
			super();
		}   	
		
		/* (non-Java-doc)
		 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, 
		     HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		    throws ServletException, IOException {
			response.getWriter().write("Hello, world 1112!");
		}  	
		
		/* (non-Java-doc)
		 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, 
		     HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		    throws ServletException, IOException {
			// TODO Auto-generated method stub
		} 
}
