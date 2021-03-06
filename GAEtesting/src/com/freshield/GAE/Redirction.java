package com.freshield.GAE;
import java.io.IOException;


import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.*;

import com.google.appengine.api.utils.SystemProperty;


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
	System.out.println("redirection_post");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String url = "jdbc:mysql://173.194.108.109:3306/coen691?"
            + "user=yangyu&password=8888&useUnicode=true&characterEncoding=UTF8";
	Connection conn = null;
    String sql;
	//get the data from databases
	try {
        // 之所以要使用下面这条语句，是因为要使用MySQL的驱动，所以我们要把它驱动起来，
        // 可以通过Class.forName把它加载进去，也可以通过初始化来驱动起来，下面三种形式都可以
		try {
            if (SystemProperty.environment.value() ==
                SystemProperty.Environment.Value.Production) {
              // Load the class that provides the new "jdbc:google:mysql://" prefix.
              Class.forName("com.mysql.jdbc.GoogleDriver");
              //url = "jdbc:mysql://yangyufreshield:3306/javademo";
              url = "jdbc:google:mysql://vimms-project:userinfo/coen691?user=root";
              System.out.println("redirection_here1");
             
            } else {
              // Local MySQL instance to use during development.
              Class.forName("com.mysql.jdbc.Driver");
              url = "jdbc:mysql://173.194.108.109:3306/coen691?user=yangyu&password=8888";
              System.out.println("redirection_here2");
              
              // Alternatively, connect to a Google Cloud SQL instance using:
              // jdbc:mysql://ip-address-of-google-cloud-sql-instance:3306/guestbook?user=root
            }
          } catch (Exception e) {
            e.printStackTrace();
            return;
          }
        // or:
        // com.mysql.jdbc.Driver driver = new com.mysql.jdbc.Driver();
        // or：
        // new com.mysql.jdbc.Driver();

        System.out.println("redirection_成功加载MySQL驱动程序");
        // 一个Connection代表一个数据库连接
        conn = DriverManager.getConnection(url);
        // Statement里面带有很多方法，比如executeUpdate可以实现插入，更新和删除等
        Statement stmt = conn.createStatement();
        
            sql = "select * from userprofile where name='"+username+"'";
            ResultSet rs = stmt.executeQuery(sql);// executeQuery会返回结果的集合，否则返回空值
            String theValue = "{'value':'error'}";
            if(rs.next() == true){
            	if(rs.getString("password").equals(password)){
            		theValue = "{'value':'"+response.encodeURL("/dashboard.do")+"'}";
            		HttpSession session = request.getSession();
            		session.setMaxInactiveInterval(24*60*60);
            		if(session.isNew()){
            			session.setAttribute("username", username);
            		}else {
            			session.setAttribute("username", username);
					}
            		
            	}else {
            		theValue = "{'value':'error'}";
				}
            }else{
            	theValue = "{'value':'error'}";
            }
            JSONObject JSONvalue = new JSONObject(theValue);
    		
    		writer.write(JSONvalue.toString());
            
            //while (rs.next()) {
            //    System.out.println(rs.getInt("ID")+"\t"+rs.getString("time")+"\t"+rs.getString("value") );//+ "\t" + rs.getString() 入如果返回的是int类型可以用getInt()
            //}
            rs.close();
        	stmt.close();
            conn.close();
        
    } catch (SQLException e) {
        System.out.println("redirection_MySQL操作错误");
        e.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
    	
    }
	
	
}   	  	    
}