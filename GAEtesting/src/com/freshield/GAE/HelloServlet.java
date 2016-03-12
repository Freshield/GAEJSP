package com.freshield.GAE;

import java.io.IOException;




import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.io.PrintWriter;

import org.json.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;







import com.google.appengine.api.search.query.ExpressionParser.var_return;
import com.google.appengine.api.utils.SystemProperty;


/**
 * Servlet implementation class for Servlet: HelloServlet
 *
 */
 public class HelloServlet extends javax.servlet.http.HttpServlet 
     implements javax.servlet.Servlet {
	 int ID = 1;
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public HelloServlet() {
		super();
		
	}   	
	 
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, 
	     HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	    throws ServletException, IOException {
		/*
		String theValue = "";
		Connection conn = null;
        String sql;
        String url = "jdbc:mysql://173.194.82.26:3306/javademo?"
               + "user=yangyu&password=8888";
        try {
            if (SystemProperty.environment.value() ==
                SystemProperty.Environment.Value.Production) {
              // Load the class that provides the new "jdbc:google:mysql://" prefix.
              Class.forName("com.mysql.jdbc.GoogleDriver");
              //url = "jdbc:mysql://yangyufreshield:3306/javademo";
              url = "jdbc:google:mysql://vimms-yangyu:yangyufreshield/javademo?user=root";
              System.out.println("helloservlet_here1");
             
            } else {
              // Local MySQL instance to use during development.
              Class.forName("com.mysql.jdbc.Driver");
              url = "jdbc:mysql://173.194.82.26:3306/javademo?user=yangyu&password=8888";
              System.out.println("helloservlet_here2");
              
              // Alternatively, connect to a Google Cloud SQL instance using:
              // jdbc:mysql://ip-address-of-google-cloud-sql-instance:3306/guestbook?user=root
            }
          } catch (Exception e) {
            e.printStackTrace();
            return;
          }
        System.out.println("helloservlet_success begin");
        try {
        	
        	long timeNow = System.currentTimeMillis();
        	ArrayList<String> cpu = new ArrayList<String>();
        	ArrayList<String> network = new ArrayList<String>();
        	ArrayList<String> ID = new ArrayList<String>();
        	ArrayList<String> mem = new ArrayList<String>();
        	ArrayList<String> timestamp = new ArrayList<String>();
        	int amount = 0;
            //Class.forName("com.mysql.jdbc.Driver");// 动态加载mysql驱动
        	//Class.forName("com.mysql.jdbc.GoogleDriver");
            //url = "jdbc:google:mysql://vimms-project:userinfo/realTimeValue?user=yangyu&password=8888&useUnicode=true&characterEncoding=UTF8";
            System.out.println("success connect");
            conn = DriverManager.getConnection(url);
            Statement stmt = conn.createStatement();
            sql = "select * from performance_worth where timestamp>=1457836809045";
            System.out.println(sql);
            ResultSet rs = stmt.executeQuery(sql);// executeQuery会返回结果的集合，否则返回空值
            String temp = "";
                while (rs.next()) {
                	cpu.add(rs.getString("cpu"));
                	network.add(rs.getString("network"));
                	ID.add(rs.getString("id"));
                	mem.add(rs.getString("mem"));
                	timestamp.add(rs.getString("timestamp"));
                	amount++;
                }
                
                for(int i = 0;i<amount;i++){
                	String temped = cpu.get(i);
                	cpu.set(i, "{\"cpu\":\""+temped+"\"}");
                	temped = network.get(i);
                	network.set(i, "{\"network\":\""+temped+"\"}");
                	 temped = ID.get(i);
                	 ID.set(i, "{\"ID\":\""+temped+"\"}");
                	 temped = mem.get(i);
                	 mem.set(i, "{\"mem\":\""+temped+"\"}");
                	 temped = timestamp.get(i);
                	 timestamp.set(i, "{\"timestamp\":\""+temped+"\"}");
                }
                System.out.println(cpu);
                System.out.println(network);
                System.out.println(ID);
                System.out.println(mem);
                System.out.println(timestamp);
                rs.close();
	        	stmt.close();
	        	conn.close();
	        
	        	theValue = "{\"jamount\":\""+amount+"\","
	        			+ "\"jcpu1\":"+cpu+","
	        			+"\"jmem1\":"+mem+","
	        			+"\"jnetwork1\":"+network+","
	        			+"\"jtimestamp1\":"+timestamp+","
	        			+"\"jID1\":"+ID
	        			+"}";
	        	System.out.println(theValue);
	    		JSONObject JSONvalue = new JSONObject(theValue);
	    		System.out.println(JSONvalue);
	    		 //response.setCharacterEncoding("UTF-8");//设置Response的编码方式为UTF-8

	    		    //response.setHeader("Content-type","text/html;charset=UTF-8");//向浏览器发送一个响应头，设置浏览器的解码方式为UTF-8,其实设置了本句，也默认设置了Response的编码方式为UTF-8，但是开发中最好两句结合起来使用

	    		    //response.setContentType("text/html;charset=UTF-8");同上句代码作用一样

	    		    PrintWriter writer = response.getWriter();

	    		    writer.write(JSONvalue.toString());
            
        } catch (SQLException e) {
            System.out.println("helloservlet_MySQL操作错误");
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            
        }
        */
	}  	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, 
	     HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	    throws ServletException, IOException {
		long timeNow = System.currentTimeMillis();
		//store the info get
		
		response.setContentType("charset=UTF-8");
	    PrintWriter writer = response.getWriter();
		System.out.println("helloservlet_post");
		String rtimestamp = request.getParameter("timestamp");
		String rname = request.getParameter("name");
		System.out.println(rtimestamp);
		if(rtimestamp.equals("0")){
			rtimestamp = "1457836774045";
		}
		System.out.println(rtimestamp);
		System.out.println(rname);
		

		//connect to the database
		String theValue = "";
		Connection conn = null;
        String sql;
        String url = "jdbc:mysql://173.194.82.26:3306/javademo?"
               + "user=yangyu&password=8888";
        try {
            if (SystemProperty.environment.value() ==
                SystemProperty.Environment.Value.Production) {
              // Load the class that provides the new "jdbc:google:mysql://" prefix.
              Class.forName("com.mysql.jdbc.GoogleDriver");
              //url = "jdbc:mysql://yangyufreshield:3306/javademo";
              url = "jdbc:google:mysql://vimms-yangyu:yangyufreshield/javademo?user=root";
              System.out.println("helloservlet_here3");
             
            } else {
              // Local MySQL instance to use during development.
              Class.forName("com.mysql.jdbc.Driver");
              url = "jdbc:mysql://173.194.82.26:3306/javademo?user=yangyu&password=8888";
              System.out.println("helloservlet_here4");
              
              // Alternatively, connect to a Google Cloud SQL instance using:
              // jdbc:mysql://ip-address-of-google-cloud-sql-instance:3306/guestbook?user=root
            }
          } catch (Exception e) {
            e.printStackTrace();
            return;
          }
        System.out.println("helloservlet_success begin");
        try {
        	
        	
        	ArrayList<String> cpu = new ArrayList<String>();
        	ArrayList<String> network = new ArrayList<String>();
        	ArrayList<String> ID = new ArrayList<String>();
        	ArrayList<String> mem = new ArrayList<String>();
        	ArrayList<String> timestamp = new ArrayList<String>();
        	int amount = 0;
            //Class.forName("com.mysql.jdbc.Driver");// 动态加载mysql驱动
        	//Class.forName("com.mysql.jdbc.GoogleDriver");
            //url = "jdbc:google:mysql://vimms-project:userinfo/realTimeValue?user=yangyu&password=8888&useUnicode=true&characterEncoding=UTF8";
            System.out.println("success connect");
            conn = DriverManager.getConnection(url);
            Statement stmt = conn.createStatement();
            sql = "select * from performance_"+rname+" where timestamp>"+rtimestamp;
            System.out.println(sql);
            ResultSet rs = stmt.executeQuery(sql);// executeQuery会返回结果的集合，否则返回空值
            String temp = "";
                while (rs.next() && (amount <5)) {
                	cpu.add(rs.getString("cpu"));
                	network.add(rs.getString("network"));
                	ID.add(rs.getString("id"));
                	mem.add(rs.getString("mem"));
                	timestamp.add(rs.getString("timestamp"));
                	amount++;
                	
                }
                
                for(int i = 0;i<amount;i++){
                	String temped = cpu.get(i);
                	cpu.set(i, "{\"cpu\":\""+temped+"\"}");
                	temped = network.get(i);
                	network.set(i, "{\"network\":\""+temped+"\"}");
                	 temped = ID.get(i);
                	 ID.set(i, "{\"ID\":\""+temped+"\"}");
                	 temped = mem.get(i);
                	 mem.set(i, "{\"mem\":\""+temped+"\"}");
                	 temped = timestamp.get(i);
                	 timestamp.set(i, "{\"timestamp\":\""+temped+"\"}");
                }
                System.out.println(cpu);
                System.out.println(network);
                System.out.println(ID);
                System.out.println(mem);
                System.out.println(timestamp);
                rs.close();
	        	stmt.close();
	        	conn.close();
	        
	        	theValue = "{\"jamount\":\""+amount+"\","
	        			+ "\"jcpu1\":"+cpu+","
	        			+"\"jmem1\":"+mem+","
	        			+"\"jnetwork1\":"+network+","
	        			+"\"jtimestamp1\":"+timestamp+","
	        			+"\"jID1\":"+ID
	        			+"}";
	        	System.out.println(theValue);
	    		JSONObject JSONvalue = new JSONObject(theValue);
	    		System.out.println(JSONvalue);
	    		 //response.setCharacterEncoding("UTF-8");//设置Response的编码方式为UTF-8

	    		    //response.setHeader("Content-type","text/html;charset=UTF-8");//向浏览器发送一个响应头，设置浏览器的解码方式为UTF-8,其实设置了本句，也默认设置了Response的编码方式为UTF-8，但是开发中最好两句结合起来使用

	    		    //response.setContentType("text/html;charset=UTF-8");同上句代码作用一样

	    		    //PrintWriter writer = response.getWriter();

	    		    writer.write(JSONvalue.toString());
            
        } catch (SQLException e) {
            System.out.println("helloservlet_MySQL操作错误");
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            
        }
		
		
		
	}   	  	    
}