package tryMySQL;

import java.sql.DriverManager;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;
import java.io.*;
import java.util.*;
import java.text.*;


public class test {
	 public static void main(String[] args) throws Exception {
	        Connection conn = null;
	        String sql;
	        // MySQL的JDBC UR L编写方式：jdbc:mysql://主机名称：连接端口/数据库的名称?参数=值
	        // 避免中文乱码要指定useUnicode和characterEncoding
	        // 执行数据库操作之前要在数据库管理系统上创建一个数据库，名字自己定，
	        // 下面语句之前就要先创建javademo数据库
	        String url = "jdbc:mysql://173.194.108.109:3306/coen691?"
	                + "user=yangyu&password=8888";
	        
	        long ct = System.currentTimeMillis();
	        String t = String.valueOf(ct);
	        long dt = 1458180989194l;
	        
	        ArrayList<String> timestampB = new ArrayList<String>();
	        ArrayList<String> cpu0B = new ArrayList<String>();
	        ArrayList<String> cpu1B = new ArrayList<String>();
	        ArrayList<String> cpu2B = new ArrayList<String>();
	        ArrayList<String> cpu3B = new ArrayList<String>();
	        
	        System.out.println(ct);
	        System.out.println(t);
	                               
	        Date nowTime = new Date(1458333952857l);
	        SimpleDateFormat sdFormatter = new SimpleDateFormat("hh:mm:ss MMM d'th', yyyy",Locale.ENGLISH);
	        String retStrFormatNowDate = sdFormatter.format(nowTime);
	        
	        System.out.println("time1"+retStrFormatNowDate);
	        
	        nowTime = new Date(1458333961780l);
	        sdFormatter = new SimpleDateFormat("hh:mm:ss MMM d'th', yyyy",Locale.ENGLISH);
	        retStrFormatNowDate = sdFormatter.format(nowTime);

	        System.out.println("time2"+retStrFormatNowDate);

	        nowTime = new Date(ct);
	        sdFormatter = new SimpleDateFormat("hh:mm:ss MMM d'th', yyyy",Locale.ENGLISH);
	        retStrFormatNowDate = sdFormatter.format(nowTime);

	        System.out.println("time3"+retStrFormatNowDate);
	        
	        System.out.println(nowTime);
	        System.out.println(sdFormatter);
	        System.out.println(retStrFormatNowDate);
	        /*
	        try {
	            // 之所以要使用下面这条语句，是因为要使用MySQL的驱动，所以我们要把它驱动起来，
	            // 可以通过Class.forName把它加载进去，也可以通过初始化来驱动起来，下面三种形式都可以
	            Class.forName("com.mysql.jdbc.Driver");// 动态加载mysql驱动
	            // or:
	            // com.mysql.jdbc.Driver driver = new com.mysql.jdbc.Driver();
	            // or：
	            // new com.mysql.jdbc.Driver();
	 
	            System.out.println("成功加载MySQL驱动程序");
	            // 一个Connection代表一个数据库连接
	            conn = DriverManager.getConnection(url);
	            // Statement里面带有很多方法，比如executeUpdate可以实现插入，更新和删除等
	            Statement stmt = conn.createStatement();
	            
	                //System.out.println("创建数据表成功");
	                
	                sql = "select * from cmd where host='flask' and flag='true'";
	                ResultSet rs = stmt.executeQuery(sql);// executeQuery会返回结果的集合，否则返回空值
	                System.out.println("ID\ttime\tvalue");
	                String result = "";
	                if(rs.next() == true){
	                	
	                	result = "not finished";
	                	//System.out.println(rs.getString("name")+rs.getString("password"));
	                }else{
	                	result = "finished";
	                }
	                
	                System.out.println(result);
	                
	                //while (rs.next()) {
	                //    System.out.println(rs.getInt("ID")+"\t"+rs.getString("time")+"\t"+rs.getString("value") );//+ "\t" + rs.getString() 入如果返回的是int类型可以用getInt()
	                //}
	                rs.close();
		        	stmt.close();
	            
	        } catch (SQLException e) {
	            System.out.println("MySQL操作错误");
	            e.printStackTrace();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	        	
	            conn.close();
	        }
	        */
	        /*
	        url = "jdbc:mysql://173.194.82.26:3306/javademo?"
	                + "user=yangyu&password=8888";
	        
	        Class.forName("com.mysql.jdbc.Driver");// 动态加载mysql驱动
            // or:
            // com.mysql.jdbc.Driver driver = new com.mysql.jdbc.Driver();
            // or：
            // new com.mysql.jdbc.Driver();

	        
	        try {
	            long timeNow = System.currentTimeMillis();
	            //Class.forName("com.mysql.jdbc.Driver");// 动态加载mysql驱动
	        	//Class.forName("com.mysql.jdbc.GoogleDriver");
	            System.out.println("success connect");
	            conn = DriverManager.getConnection(url);
	            Statement stmt = conn.createStatement();
	            for(int i = 0;i<cpu0B.size();i++){
	            	long mem = Math.round(Math.random()*100);
	            	long network_tx = Math.round(Math.random()*100);
	            	long network_rx = Math.round(Math.random()*100);
	            	sql = "insert into tryunhand (timestamp,cpu0,cpu1,cpu2,cpu3,mem,network_tx,network_rx) values('"+timestampB.get(i)+"','"+cpu0B.get(i)+"','"+cpu1B.get(i)+"',"
	            		+ "'"+cpu2B.get(i)+"','"+cpu3B.get(i)+"','"+mem+"','"+network_tx+"','"+network_rx+"')";
	            	Boolean rs = stmt.execute(sql);
	            }
	           
	            
	            timeNow += 5000;
	           
	             System.out.println("finish");
	                
	            	stmt.close();
	            	conn.close();
	            
	        } catch (SQLException e) {
	            System.out.println("MySQL操作错误");
	            e.printStackTrace();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            
	        }
	        
	        */
	 /*
	        try {
	            // 之所以要使用下面这条语句，是因为要使用MySQL的驱动，所以我们要把它驱动起来，
	            // 可以通过Class.forName把它加载进去，也可以通过初始化来驱动起来，下面三种形式都可以
	            Class.forName("com.mysql.jdbc.Driver");// 动态加载mysql驱动
	            // or:
	            // com.mysql.jdbc.Driver driver = new com.mysql.jdbc.Driver();
	            // or：
	            // new com.mysql.jdbc.Driver();
	 
	            System.out.println("成功加载MySQL驱动程序");
	            // 一个Connection代表一个数据库连接
	            conn = DriverManager.getConnection(url);
	            // Statement里面带有很多方法，比如executeUpdate可以实现插入，更新和删除等
	            Statement stmt = conn.createStatement();
	            sql = "create table sampleValue("
	            		+ "ID int unsigned not null auto_increment primary key,"
	            		+ "time char(10) not null,"
	            		+ "value char(10) not null)";
	            int result = stmt.executeUpdate(sql);// executeUpdate语句会返回一个受影响的行数，如果返回-1就没有成功
	            if (result != -1) {
	                System.out.println("创建数据表成功");
	                int minutes = 0;
	                int hours = 0;
	                for(int i = 0;i<256;i++){
	                	String minValue,hourValue,timeValue;
	                	
	                	if(minutes<10){
	                		minValue = "0"+minutes;
	                	}else{
	                		minValue = minutes+"";
	                	}
	                	
	                	if(hours<10){
	                		hourValue = "0"+hours;
	                	}else{
	                		hourValue = hours+"";
	                	}
	                	timeValue = hourValue+":"+minValue;
	                	
	                	long valValue = Math.round(Math.random()*100);
	                	
	                	sql = "insert into sampleValue(time,value) values('"+timeValue+"','"
	                	+valValue+"')";
	                	result = stmt.executeUpdate(sql);
	                	
	                	minutes += 5;
	                	if(minutes>=60){
	                		minutes -= 60;
	                		hours +=1;
	                		if(hours >= 24){
	                			hours -=24;
	                		}
	                	}
	                	
	                }
	                //sql = "insert into student2(NO,name) values('2012001','陶伟基')";
	                //result = stmt.executeUpdate(sql);
	                //sql = "insert into student2(NO,name) values('2012002','周小俊')";
	                //result = stmt.executeUpdate(sql);
	                sql = "select * from sampleValue";
	                ResultSet rs = stmt.executeQuery(sql);// executeQuery会返回结果的集合，否则返回空值
	                System.out.println("ID\ttime\tvalue");
	                while (rs.next()) {
	                    System.out.println(rs.getInt("ID")+"\t"+rs.getString("time")+"\t"+rs.getString("value") );//+ "\t" + rs.getString() 入如果返回的是int类型可以用getInt()
	                }
	                rs.close();
		        	stmt.close();
	            }
	        } catch (SQLException e) {
	            System.out.println("MySQL操作错误");
	            e.printStackTrace();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	        	
	            conn.close();
	        }
	 */
	    }

}
