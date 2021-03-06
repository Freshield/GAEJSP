package guestbook;

import java.io.*;
import java.sql.*;

import javax.servlet.http.*;

import com.google.appengine.api.utils.SystemProperty;

public class guestbookservlet extends HttpServlet {
  
	
	public guestbookservlet() {
		super();
		
	}  
	
	public void doGet(HttpServletRequest req,HttpServletResponse resp)throws IOException{
		try{
			super.doGet(req, resp);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
  public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    String url = null;
    try {
      if (SystemProperty.environment.value() ==
          SystemProperty.Environment.Value.Production) {
        // Load the class that provides the new "jdbc:google:mysql://" prefix.
        Class.forName("com.mysql.jdbc.GoogleDriver");
        url = "jdbc:google:mysql://vimms-yangyu:yangyufreshield/guestbook?user=yangyu&password=8888";
        System.out.println("here1");
      } else {
        // Local MySQL instance to use during development.
        Class.forName("com.mysql.jdbc.Driver");
        url = "jdbc:mysql://127.0.0.1:3306/guestbook?user=root";
        System.out.println("here2");
        // Alternatively, connect to a Google Cloud SQL instance using:
        // jdbc:mysql://ip-address-of-google-cloud-sql-instance:3306/guestbook?user=root
      }
    } catch (Exception e) {
      e.printStackTrace();
      return;
    }

    PrintWriter out = resp.getWriter();
    try {
      Connection conn = DriverManager.getConnection(url);
      System.out.println("成功加载MySQL驱动程序");
      
    	//Connection conn = DriverManager.getConnection(
    	//	    "jdbc:google:mysql://vimms-yangyu:yangyufreshield/guestbook",
    	//	    "yangyu", "8888");
      try {
    	  
    	  String sql = "create table sampleValue("
    	      		+ "ID int unsigned not null auto_increment primary key,"
    	      		+ "time char(10) not null,"
    	      		+ "value char(10) not null)";
          Statement stmt = conn.createStatement();
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
              	
              	sql = "insert into entries(time,value) values('"+timeValue+"','"
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
        
      } finally {
        conn.close();
      }
    } catch (SQLException e) {
    	System.out.println("MySQL操作错误");
      e.printStackTrace();
    }
    
  }
  
      
      
      
    
}