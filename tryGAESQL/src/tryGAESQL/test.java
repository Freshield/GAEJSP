package tryGAESQL;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.utils.SystemProperty;

public class test extends javax.servlet.http.HttpServlet 
implements javax.servlet.Servlet {
int ID = 1;
/* (non-Java-doc)
* @see javax.servlet.http.HttpServlet#HttpServlet()
*/
public test() {
	super();
	
}   
protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	    throws ServletException, IOException {
        Connection conn = null;
        String sql;
        // MySQL的JDBC UR L编写方式：jdbc:mysql://主机名称：连接端口/数据库的名称?参数=值
        // 避免中文乱码要指定useUnicode和characterEncoding
        // 执行数据库操作之前要在数据库管理系统上创建一个数据库，名字自己定，
        // 下面语句之前就要先创建javademo数据库
        String url = "jdbc:mysql://127.0.0.1:3306/javademo";
        String userid = "yangyu";
        String password = "8888";
        try {
            if (SystemProperty.environment.value() ==
                SystemProperty.Environment.Value.Production) {
              // Load the class that provides the new "jdbc:google:mysql://" prefix.
              Class.forName("com.mysql.jdbc.GoogleDriver");
              //url = "jdbc:mysql://yangyufreshield:3306/javademo";
              url = "jdbc:google:mysql://vimms-yangyu:yangyufreshield/javademo?user=root";
              System.out.println("here1");
              response.getWriter().write("here1");
            } else {
              // Local MySQL instance to use during development.
              Class.forName("com.mysql.jdbc.Driver");
              url = "jdbc:mysql://173.194.82.26:3306/javademo?user=yangyu&password=8888";
              System.out.println("here2");
              response.getWriter().write("here2");
              // Alternatively, connect to a Google Cloud SQL instance using:
              // jdbc:mysql://ip-address-of-google-cloud-sql-instance:3306/guestbook?user=root
            }
          } catch (Exception e) {
            e.printStackTrace();
            return;
          }
 
        try {
            // 之所以要使用下面这条语句，是因为要使用MySQL的驱动，所以我们要把它驱动起来，
            // 可以通过Class.forName把它加载进去，也可以通过初始化来驱动起来，下面三种形式都可以
           // Class.forName("com.mysql.jdbc.Driver");// 动态加载mysql驱动
            // or:
            // com.mysql.jdbc.Driver driver = new com.mysql.jdbc.Driver();
            // or：
            // new com.mysql.jdbc.Driver();
        	
            System.out.println("成功加载MySQL驱动程序");
            response.getWriter().write(" load driver success ");
            // 一个Connection代表一个数据库连接
            conn = DriverManager.getConnection(url);
            // Statement里面带有很多方法，比如executeUpdate可以实现插入，更新和删除等
            Statement stmt = conn.createStatement();
            //sql = "create table sampleValue("
            //		+ "ID int unsigned not null auto_increment primary key,"
            //		+ "time char(10) not null,"
            //		+ "value char(10) not null,"
            //		+ "flag char(10) null)";
            sql = "create table Command("
            		+ "ID int unsigned not null auto_increment primary key,"
            		+ "CMD char(10) not null,"
            		+ "flag char(10) not null)";
            int result = stmt.executeUpdate(sql);// executeUpdate语句会返回一个受影响的行数，如果返回-1就没有成功
            if (result != -1) {
                System.out.println("创建数据表成功");
                response.getWriter().write(" create table success ");
                /*int minutes = 0;
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
                	
                }*/
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
	        	 conn.close();
            }
        } catch (SQLException e) {
            System.out.println("MySQL操作错误");
            response.getWriter().write(" mysql error ");
            response.getWriter().write(e.toString());
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write(e.toString());
        } finally {
        	
           
        }
 
    }
protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	    throws ServletException, IOException {
		// TODO Auto-generated method stub
	}   

}
