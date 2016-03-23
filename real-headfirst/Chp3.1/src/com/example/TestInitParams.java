package com.example;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;
import java.util.*;

public class TestInitParams extends HttpServlet {
	
	public void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws IOException, ServletException{


		String client = request.getHeader("User-Agent");
		System.out.println(client);
	}

	public void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws IOException, ServletException{

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("test init parameters<br>");
		
		Enumeration e = getServletConfig().getInitParameterNames();
		while(e.hasMoreElements()){
			out.println("<br>param name= "+e.nextElement()+"<br>");
		}
		
		out.println("main email is "+getServletConfig().getInitParameter("mainEmail"));
		out.println("<br>");
		out.println("admin email is "+getServletConfig().getInitParameter("adminEmail"));
		
	}

}
