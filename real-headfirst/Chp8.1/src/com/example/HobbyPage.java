package com.example;

import javax.servlet.*;

import javax.servlet.http.*;

import foo.*;

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
		/*
		response.setContentType("text/html");
		String hobby = request.getParameter("hobby");
		ArrayList names = new ArrayList();
		names.add("Fred");
		names.add("Pradeep");
		names.add("Philippe");
		
		Person p = new Employee();
		
		p.setName(hobby);
		
		request.setAttribute("person", p);
		
		request.setAttribute("names", names);*/
		
		foo.Person p = new foo.Person();
		p.setName("evan");
		
		foo.Dog dog = new foo.Dog();
		dog.setName("spike");
		p.setDog(dog);
		
		request.setAttribute("person", p);
		
		RequestDispatcher view = request.getRequestDispatcher("tester.jsp");
		view.forward(request, response);
		
	}

}