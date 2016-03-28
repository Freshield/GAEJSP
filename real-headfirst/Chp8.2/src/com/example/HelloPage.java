package com.example;

import javax.servlet.*;
import javax.servlet.http.*;

import foo.*;

import java.io.*;
import java.util.*;


public class HelloPage extends HttpServlet {


	public void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws IOException, ServletException{


		doGet(request,response);
	}

	public void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws IOException, ServletException{
		
		foo.Person p = new foo.Person();
		p.setName("Leelu");
		foo.Dog d = new foo.Dog();
		d.setName("Clyde");
		foo.Toy t1 = new foo.Toy();
		t1.setName("stick");
		foo.Toy t2 = new foo.Toy();
		t2.setName("neighbor's cat");
		foo.Toy t3 = new foo.Toy();
		t3.setName("Barbie doll head");
		d.setToys(new foo.Toy[] {t1,t2,t3});
		p.setDog(d);
		request.setAttribute("person", p);
		RequestDispatcher view = request.getRequestDispatcher("tester.jsp");
		view.forward(request, response);
		
	}

}
