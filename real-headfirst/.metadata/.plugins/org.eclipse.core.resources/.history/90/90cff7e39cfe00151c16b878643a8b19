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
		
		Map favoriteMusic = new HashMap();
		
		favoriteMusic.put("am","zero 7");
		favoriteMusic.put("su","tahiti");
		favoriteMusic.put("dj","bt");
		favoriteMusic.put("mu","frou frou");
		
		String[] musicType = {"am","su","dj","mu"};

		request.setAttribute("musicList", favoriteMusic);
		request.setAttribute("musicType", musicType);
		
		RequestDispatcher view = request.getRequestDispatcher("META-INF/tester.jsp");
		view.forward(request, response);
		
	}

}
