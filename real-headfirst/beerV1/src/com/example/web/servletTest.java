package com.example.web;

import javax.servlet.*;

import javax.servlet.http.*;

import com.example.model.BeerExpert;

import java.io.*;
import java.util.*;

public class servletTest extends HttpServlet {
	

	public void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws IOException, ServletException{


		String client = request.getHeader("User-Agent");
		System.out.println(client);
	}

	public void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws IOException, ServletException{


		String client = request.getHeader("Host");
		System.out.println(client);
		
		HttpSession session = request.getSession();
		System.out.println(session);
		
		String theMethod = request.getMethod();
		System.out.println(theMethod);
		
		String address = request.getRequestURI();
		System.out.println(address);

		int localport = request.getLocalPort();
		System.out.println(address);

		int serverport = request.getServerPort();
		System.out.println(serverport);
		
		System.out.println(getServletConfig().getInitParameter("adminEmail"));
		
		response.sendRedirect("http://baidu.com");
		
		
	}


}
