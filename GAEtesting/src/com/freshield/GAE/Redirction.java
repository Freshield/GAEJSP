package com.freshield.GAE;
import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.*;

public class Redirction extends javax.servlet.http.HttpServlet 
implements javax.servlet.Servlet {

/* (non-Java-doc)
* @see javax.servlet.http.HttpServlet#HttpServlet()
*/
public Redirction() {
	super();
	
}   	

/* (non-Java-doc)
* @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, 
    HttpServletResponse response)
*/
protected void doGet(HttpServletRequest request, HttpServletResponse response) 
   throws ServletException, IOException {
	
   
}  	

/* (non-Java-doc)
* @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, 
    HttpServletResponse response)
*/
protected void doPost(HttpServletRequest request, HttpServletResponse response) 
   throws ServletException, IOException {
	// TODO Auto-generated method stub
	response.setContentType("charset=UTF-8");
    PrintWriter writer = response.getWriter();
	System.out.println("post");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	

	
	if(username.equals("hao_wei")){
		
		if(password.equals("123456"))
		{
			String theValue = "{'value':'dashboard.html'}";
		JSONObject JSONvalue = new JSONObject(theValue);
		System.out.println("yes");
		writer.write(JSONvalue.toString());
		}
		
	}else{
		String theValue = "{'value':'error'}";
		JSONObject JSONvalue = new JSONObject(theValue);
		System.out.println("no");
		writer.write(JSONvalue.toString());
	}
	
	
}   	  	    
}