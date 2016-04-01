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

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;







import com.google.appengine.api.utils.SystemProperty;


public class CMDflag extends javax.servlet.http.HttpServlet 
implements javax.servlet.Servlet {
int ID = 1;
/* (non-Java-doc)
* @see javax.servlet.http.HttpServlet#HttpServlet()
*/
public CMDflag() {
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
	//generate the timestamp
	
	long timeNow = System.currentTimeMillis();
	
	//store the info get
	
	response.setContentType("charset=UTF-8");
    PrintWriter writer = response.getWriter();
	System.out.println("cmdflag_post");
	String vm1 = request.getParameter("vm1");
	String vm2 = request.getParameter("vm2");
	String vm3 = request.getParameter("vm3");
	String vm4 = request.getParameter("vm4");
	System.out.println(vm1);
	System.out.println(vm2);
	System.out.println(vm3);
	System.out.println(vm4);
	
	
	//to get into sql
	String theValue = "";// = "{"
	//		+ "'value':'"+Math.round((Math.random()*600))+"'}";
	//about sql databse
	Connection conn = null;
   String sql;
   String url = "jdbc:mysql://mysql://173.194.108.109:3306/coen691?"
          + "user=yangyu&password=8888&useUnicode=true&characterEncoding=UTF8";
   try {
       if (SystemProperty.environment.value() ==
           SystemProperty.Environment.Value.Production) {
         // Load the class that provides the new "jdbc:google:mysql://" prefix.
         Class.forName("com.mysql.jdbc.GoogleDriver");
         
         url = "jdbc:google:mysql://vimms-project:userinfo/coen691?user=root";
         System.out.println("cmdinsert_here1");
        
       } else {
         // Local MySQL instance to use during development.
         Class.forName("com.mysql.jdbc.Driver");
         url = "jdbc:mysql://173.194.108.109:3306/coen691?user=yangyu&password=8888";
         System.out.println("cmdinsert_here2");
         
         // Alternatively, connect to a Google Cloud SQL instance using:
         // jdbc:mysql://ip-address-of-google-cloud-sql-instance:3306/guestbook?user=root
       }
     } catch (Exception e) {
       e.printStackTrace();
       return;
     }
   System.out.println("cmdflag_success begin");
   try {
       
       //Class.forName("com.mysql.jdbc.Driver");// 动态加载mysql驱动
   	//Class.forName("com.mysql.jdbc.GoogleDriver");
       System.out.println("cmdflag_success connect");
       conn = DriverManager.getConnection(url);
       Statement stmt = conn.createStatement();
       String resultVm3 = "";
       
       if(vm3.equals("true")){
       sql = "select * from cmd where host='flask' and flag='true'";
       System.out.println(sql);
       ResultSet rs = stmt.executeQuery(sql);// executeQuery会返回结果的集合，否则返回空值
       System.out.println(rs);
       if(rs.next() == true){
       	resultVm3 = "not_yet";
       	//System.out.println(rs.getString("name")+rs.getString("password"));
       }else{
       	resultVm3 = "finished";
       }
       }   
       
       String resultVm4 = "";
       if(vm4.equals("true")){
       sql = "select * from cmd where host='flake' and flag='true'";
       System.out.println(sql);
       ResultSet rs = stmt.executeQuery(sql);// executeQuery会返回结果的集合，否则返回空值
       System.out.println(rs);
       if(rs.next() == true){
       	resultVm4 = "not_yet";
       	//System.out.println(rs.getString("name")+rs.getString("password"));
       }else{
       	resultVm4 = "finished";
       }
       }   
       
       	stmt.close();
       	conn.close();
       
       	theValue = "{'vm3':'"+resultVm3+"','vm4':'"+resultVm4+"'}";

   		JSONObject JSONvalue = new JSONObject(theValue);
   		System.out.println(JSONvalue);
   		 //response.setCharacterEncoding("UTF-8");//设置Response的编码方式为UTF-8

   		    //response.setHeader("Content-type","text/html;charset=UTF-8");//向浏览器发送一个响应头，设置浏览器的解码方式为UTF-8,其实设置了本句，也默认设置了Response的编码方式为UTF-8，但是开发中最好两句结合起来使用

   		    //response.setContentType("text/html;charset=UTF-8");同上句代码作用一样

   		    //PrintWriter writer = response.getWriter();

   		    writer.write(JSONvalue.toString());
       
   } catch (SQLException e) {
       System.out.println("cmdinsert_MySQL操作错误");
       e.printStackTrace();
   } catch (Exception e) {
       e.printStackTrace();
   } finally {
       
   }
}   	  	    
}
