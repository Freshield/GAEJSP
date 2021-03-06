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
		out.println("test session attributes<br>"+counter);
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null){
			for(int i = 0;i<cookies.length;i++){
			Cookie cookietemp = cookies[i];
			if(cookietemp.getName().equals("username")){
				String username = cookietemp.getValue();
				out.println("Hello "+username);
				break;
			}
		}
		}
		
		

		
		 
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(15*60);
		
		Cookie cookie = new Cookie("username", "yangyu");
		
		cookie.setMaxAge(30*60);
		
		System.out.println(cookie.getMaxAge());
		
		response.addCookie(cookie);
		
		out.println("<html><body>");
		out.println("<a href=\""+response.encodeURL("SessionTest.do")+"\">click me</a>");
		out.println("</html></body>");
	}

}
