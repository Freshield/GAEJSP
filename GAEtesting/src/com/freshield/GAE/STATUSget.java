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


public class STATUSget extends javax.servlet.http.HttpServlet 
implements javax.servlet.Servlet {
int ID = 1;
/* (non-Java-doc)
* @see javax.servlet.http.HttpServlet#HttpServlet()
*/
public STATUSget() {
	super();
	
}   	

/* (non-Java-doc)
* @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, 
    HttpServletResponse response)
*/
protected void doGet(HttpServletRequest request, HttpServletResponse response) 
   throws ServletException, IOException {
	//generate the timestamp
	
		//long timeNow = System.currentTimeMillis()/1000;
		
		//store the info get
		
		response.setContentType("charset=UTF-8");
	    PrintWriter writer = response.getWriter();
		System.out.println("statusget_get");
		
		//to get into sql
		String theValue = "";// = "{"
		//		+ "'value':'"+Math.round((Math.random()*600))+"'}";
		//about sql databse
		Connection conn = null;
	   String sql;
	   String url = "jdbc:mysql://173.194.108.109:3306/coen691?"
	          + "user=yangyu&password=8888&useUnicode=true&characterEncoding=UTF8";
	   try {
	       if (SystemProperty.environment.value() ==
	           SystemProperty.Environment.Value.Production) {
	         // Load the class that provides the new "jdbc:google:mysql://" prefix.
	         Class.forName("com.mysql.jdbc.GoogleDriver");
	         
	         url = "jdbc:google:mysql://vimms-project:userinfo/coen691?user=root";
	         System.out.println("statusget_here1");
	        
	       } else {
	         // Local MySQL instance to use during development.
	         Class.forName("com.mysql.jdbc.Driver");
	         url = "jdbc:mysql://173.194.108.109:3306/coen691?user=yangyu&password=8888";
	         System.out.println("statusget_here2");
	         
	         // Alternatively, connect to a Google Cloud SQL instance using:
	         // jdbc:mysql://ip-address-of-google-cloud-sql-instance:3306/guestbook?user=root
	       }
	     } catch (Exception e) {
	       e.printStackTrace();
	       return;
	     }
	   System.out.println("statusget_success begin");
	   try {
		   String jVM1_name = "";
		   String jVM1_status = "";
		   String jVM2_name = "";
		   String jVM2_status = "";
		   String jPM1_name = "";
		   String jPM1_status = "";
		   String jPM2_name = "";
		   String jPM2_status = "";
		   ArrayList<String> VMs = new ArrayList<String>();
		   ArrayList<String> PMs = new ArrayList<String>(); 
		   String timeTemp = "";
		   
		   
		   long timeNow = System.currentTimeMillis();
		   //cause the pm unhand problem
		   //timeNow = 1458243590409l;
	       //Class.forName("com.mysql.jdbc.Driver");// 动态加载mysql驱动
	   	//Class.forName("com.mysql.jdbc.GoogleDriver");
		   System.out.println("statusget_success connect");
           conn = DriverManager.getConnection(url);
           Statement stmt = conn.createStatement();
           
           
           //get all data from vm_table
           sql = "select * from vm_table where vmname='flask'";
           System.out.println(sql);
           ResultSet rs = stmt.executeQuery(sql);// executeQuery会返回结果的集合，否则返回空值
           System.out.println(rs);
           String temp = "";
           if(rs.next()) {
           	System.out.println(rs);
           	temp = rs.getString("vmname");
           	System.out.println(temp);
           	VMs.add(temp);
           	temp = rs.getString("status").toLowerCase();
           	
           	timeTemp = rs.getString("timestamp");
           	if((timeNow - Long.parseLong(timeTemp))>18000){
           		temp = "unknow";
           	
           	}
           	
           	System.out.println(temp);
           	VMs.add(temp);
           	System.out.println(VMs);
           	
            }
           
           

           sql = "select * from vm_table where vmname='flake'";
           System.out.println(sql);
           rs = stmt.executeQuery(sql);// executeQuery会返回结果的集合，否则返回空值
           System.out.println(rs);
           temp = "";
           if(rs.next()) {
           	System.out.println(rs);
           	temp = rs.getString("vmname");
           	System.out.println(temp);
           	VMs.add(temp);
           	temp = rs.getString("status").toLowerCase();
           	
           	timeTemp = rs.getString("timestamp");
           	if((timeNow - Long.parseLong(timeTemp))>18000){
           		temp = "unknow";
           	
           	}
           	
           	System.out.println(temp);
           	VMs.add(temp);
           	System.out.println(VMs);
           	
           	
            }
           
         
           
         //get all data from host_table
           sql = "select * from host_table where hostname='worth'";
           System.out.println(sql);
           rs = stmt.executeQuery(sql);// executeQuery会返回结果的集合，否则返回空值
           System.out.println(rs);
           temp = "";
           if(rs.next()) {
           	temp = rs.getString("hostname");
           	System.out.println(temp);
           	PMs.add(temp);
           	temp = rs.getString("status").toLowerCase();
           	
           	timeTemp = rs.getString("timestamp");
           	if((timeNow - Long.parseLong(timeTemp))>18000){
           		temp = "unknow";
           	
           	}
           	
           	System.out.println(temp);
           	PMs.add(temp);
           	System.out.println(PMs);
           	
           	
            }
           
           
           sql = "select * from host_table where hostname='unhand'";
           System.out.println(sql);
           rs = stmt.executeQuery(sql);// executeQuery会返回结果的集合，否则返回空值
           System.out.println(rs);
           temp = "";
           
           
           if(rs.next()) {
           	temp = rs.getString("hostname");
           	System.out.println(temp);
           	PMs.add(temp);
           	temp = rs.getString("status").toLowerCase();
           	
           	timeTemp = rs.getString("timestamp");
           	if((timeNow - Long.parseLong(timeTemp))>18000){
           		temp = "unknow";
           	
           	}
           	
           	System.out.println(temp);
           	PMs.add(temp);
           	System.out.println(PMs);
           	
           	
            }
           
           
           System.out.println(VMs.size());
           jVM1_name = VMs.get(0);
           jVM1_status = VMs.get(1);
           jVM2_name = VMs.get(2);
           jVM2_status = VMs.get(3);

           jPM1_name = PMs.get(0);
           jPM1_status = PMs.get(1);
           jPM2_name = PMs.get(2);
           jPM2_status = PMs.get(3);
           
               
               rs.close();
	        	stmt.close();
	        	conn.close();
	        	TimeZone.setDefault(TimeZone.getTimeZone("GMT-5:00"));
	        	Date nowTime = new Date(System.currentTimeMillis());
		        SimpleDateFormat sdFormatter = new SimpleDateFormat("MMM d'th', yyyy",Locale.ENGLISH);
		        String jTime = sdFormatter.format(nowTime);
	        
	        	theValue = "{'vm1_name':'"+jVM1_name+"','vm1_status':'"+jVM1_status+"',"
	        			+"'vm2_name':'"+jVM2_name+"','vm2_status':'"+jVM2_status+"',"
	        			+"'pm1_name':'"+jPM1_name+"','pm1_status':'"+jPM1_status+"',"
	        			+"'pm2_name':'"+jPM2_name+"','pm2_status':'"+jPM2_status+"',"
	        			+"'time_now':'"+jTime+"',"
	        			+"}";

	    		JSONObject JSONvalue = new JSONObject(theValue);
	    		System.out.println(JSONvalue);
	    		 //response.setCharacterEncoding("UTF-8");//设置Response的编码方式为UTF-8

	    		    //response.setHeader("Content-type","text/html;charset=UTF-8");//向浏览器发送一个响应头，设置浏览器的解码方式为UTF-8,其实设置了本句，也默认设置了Response的编码方式为UTF-8，但是开发中最好两句结合起来使用

	    		    //response.setContentType("text/html;charset=UTF-8");同上句代码作用一样

	    		    //PrintWriter writer = response.getWriter();

	    		    writer.write(JSONvalue.toString());
	       
	   } catch (SQLException e) {
	       System.out.println("statusget_MySQL操作错误");
	       e.printStackTrace();
	   } catch (Exception e) {
	       e.printStackTrace();
	   } finally {
	       
	   }
	
   
}  	

/* (non-Java-doc)
* @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, 
    HttpServletResponse response)
*/
protected void doPost(HttpServletRequest request, HttpServletResponse response) 
   throws ServletException, IOException {
	
}   	  	    
}
