package com.example.web;

import javax.servlet.*;

import javax.servlet.http.*;

import java.io.*;
import java.util.*;


public class Tester extends HttpServlet {


	public void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws IOException, ServletException{


		doGet(request,response);
	}

	public void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws IOException, ServletException{
		System.out.println("here");
		
		PrintWriter out = response.getWriter();
		out.println("Hello world");
		
		//RequestDispatcher view = request.getRequestDispatcher("tester.jsp");
		//view.forward(request, response);
		
	}

}
