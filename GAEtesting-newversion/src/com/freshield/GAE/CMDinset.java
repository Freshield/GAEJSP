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


public class CMDinset extends javax.servlet.http.HttpServlet 
implements javax.servlet.Servlet {
int ID = 1;
/* (non-Java-doc)
* @see javax.servlet.http.HttpServlet#HttpServlet()
*/
public CMDinset() {
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
	System.out.println("cmdinsert_post");
	String command = request.getParameter("command");
	String name = request.getParameter("name");
	System.out.println(command);
	System.out.println(name);
	
	
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
   System.out.println("cmdinsert_success begin");
   try {
       
       //Class.forName("com.mysql.jdbc.Driver");// ��̬����mysql����
   	//Class.forName("com.mysql.jdbc.GoogleDriver");
       System.out.println("cmdinsert_success connect");
       conn = DriverManager.getConnection(url);
       Statement stmt = conn.createStatement();
       sql = "insert into cmd (timestamp,cmd,host,flag) values('"+timeNow+"','"+command+"','"+name+"','true')";
       System.out.println(sql);
       Boolean rs = stmt.execute(sql);// executeQuery�᷵�ؽ���ļ��ϣ����򷵻ؿ�ֵ
       System.out.println(rs);
           
       	stmt.close();
       	conn.close();
       String temp = "The command "+command+" insert success.";
       	theValue = "{'value':'"+temp+"'}";

   		JSONObject JSONvalue = new JSONObject(theValue);
   		System.out.println(JSONvalue);
   		 //response.setCharacterEncoding("UTF-8");//����Response�ı��뷽ʽΪUTF-8

   		    //response.setHeader("Content-type","text/html;charset=UTF-8");//�����������һ����Ӧͷ������������Ľ��뷽ʽΪUTF-8,��ʵ�����˱��䣬ҲĬ��������Response�ı��뷽ʽΪUTF-8�����ǿ������������������ʹ��

   		    //response.setContentType("text/html;charset=UTF-8");ͬ�Ͼ��������һ��

   		    //PrintWriter writer = response.getWriter();

   		    writer.write(JSONvalue.toString());
       
   } catch (SQLException e) {
       System.out.println("cmdinsert_MySQL��������");
       e.printStackTrace();
   } catch (Exception e) {
       e.printStackTrace();
   } finally {
       
   }
}   	  	    
}