package com.example;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;
import java.util.*;


public class HobbyPage extends HttpServlet {


	public void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws IOException, ServletException{


		doGet(request,response);
	}

	public void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws IOException, ServletException{
		
		response.setContentType("text/html");
		String hobby = request.getParameter("hobby");
		ArrayList names = new ArrayList();
		names.add("Fred");
		names.add("Pradeep");
		names.add("Philippe");
		
		request.setAttribute("names", names);
		
		RequestDispatcher view = request.getRequestDispatcher("tester.jsp");
		view.forward(request, response);
		
	}

}
