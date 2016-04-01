package com.freshield.GAE;

import java.io.*;
import java.util.*;
import java.text.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;
import java.io.PrintWriter;

import org.json.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;








import javax.servlet.http.HttpSession;

import com.google.appengine.api.utils.SystemProperty;


public class dashboard extends javax.servlet.http.HttpServlet 
implements javax.servlet.Servlet {
int ID = 1;
/* (non-Java-doc)
* @see javax.servlet.http.HttpServlet#HttpServlet()
*/
public dashboard() {
	super();
	System.out.println("here");
	
}   	

/* (non-Java-doc)
* @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, 
    HttpServletResponse response)
*/
protected void doGet(HttpServletRequest request, HttpServletResponse response) 
   throws ServletException, IOException {
	
	System.out.println("get");
   
}  	

/* (non-Java-doc)
* @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, 
    HttpServletResponse response)
*/
protected void doPost(HttpServletRequest request, HttpServletResponse response) 
   throws ServletException, IOException {
	//generate the timestamp
	
	long timeNow = System.currentTimeMillis();
	
	//store the info get
	System.out.println("cmdflag_post");
	response.setContentType("charset=UTF-8");
    PrintWriter writer = response.getWriter();
	System.out.println("cmdflag_post");
	String machines = request.getParameter("user");
	System.out.println(machines);
	if(machines != null){
		HttpSession session = request.getSession();
		
		if(session.isNew()){
			session.setAttribute("username", "");
		}else {
			
		}
		RequestDispatcher view = request.getRequestDispatcher(response.encodeURL("/dashboard.jsp"));
		view.forward(request, response);
	}
	
}
}