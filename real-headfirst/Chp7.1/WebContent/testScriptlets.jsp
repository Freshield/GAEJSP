<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% int x=2; %>
<% int y=5+x; %>
<% out.println(x+"<br>"); %>
<% out.println(y+"<br>"); %>

<% ArrayList list = new ArrayList();
   list.add(new String("foo"));
   
   %>
<%= list.get(0)+"<br>" %>

<%! int w = 42; %>
<% int w = 22; %>
<%= w+"<br>" %>

<%
	Float one = new  Float(42.5);
	pageContext.setAttribute("foo", one);
%>
<%= pageContext.getAttribute("foo")+"<br>" %>

<%
	Float two = new Float(22.4);
	pageContext.setAttribute("foo", two,PageContext.SESSION_SCOPE);
%>
<%= session.getAttribute("foo")+"<br>" %>

<%
	Float three = new Float(24.4);
	pageContext.setAttribute("mail", three,PageContext.APPLICATION_SCOPE);
%>
<%= application.getAttribute("mail")+"<br>" %>
<%= pageContext.findAttribute("foo")+"<br>" %>


</body>
</html>