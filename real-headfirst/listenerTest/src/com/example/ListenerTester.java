package com.example;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;

public class ListenerTester extends HttpServlet {
	

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
		
		out.println("test context attributes set by listener<br>");
		
		Dog dog = (Dog) getServletContext().getAttribute("dog");
		
		out.println(dog.getBreed());
	}


}
