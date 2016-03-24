package com.example;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;
import java.util.*;

public class CheckCookie extends HttpServlet {
	

	public void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws IOException, ServletException{


		doGet(request,response);
	}

	public void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws IOException, ServletException{
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			
			for(int i = 0;i<cookies.length;i++){
				Cookie cookie = cookies[i];
				if(cookie.getName().equals("username")){
					String username = cookie.getValue();
					out.println("Hello "+username+cookie.getMaxAge());
					break;
				}
			}
		}
	}


}
