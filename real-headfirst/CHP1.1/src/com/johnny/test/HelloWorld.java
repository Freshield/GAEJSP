package com.johnny.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloWorld extends HttpServlet implements javax.servlet.Servlet{
	   /* (non-Java-doc)
		 * @see javax.servlet.http.HttpServlet#HttpServlet()
		 */
		public HelloWorld() {
			super();
		}   	
		
		/* (non-Java-doc)
		 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, 
		     HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		    throws ServletException, IOException {
			//response.getWriter().write("Hello, world 1112!");
			
			PrintWriter out = response.getWriter();
			java.util.Date today = new java.util.Date();
			out.print("<html>"
					+ "<body>"
					+ "<h1 align=center>HF\'s Chapter1 Servlet</h1>"
					+ "<br>"+today+"</body></html>");
			
			
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