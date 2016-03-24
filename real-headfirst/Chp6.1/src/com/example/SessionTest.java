package com.example;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;
import java.util.*;

public class SessionTest extends HttpServlet {
	int counter = 0;

	public void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws IOException, ServletException{


		String client = request.getHeader("User-Agent");
		System.out.println(client);
	}

	public void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws IOException, ServletException{
		counter ++;

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("test session attributes<br>");
		
		HttpSession session = request.getSession();
		
		if(session.isNew()){
			out.println("This is a new session. counter="+counter);
		}else{
			out.println("Welcome back! counter="+counter);
		}
	}

}
