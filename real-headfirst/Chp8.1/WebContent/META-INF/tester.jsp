<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

The Person is:${ person.name }<br>
<%-- person.setName(request.getParameter("hobby")); --%>
<%-- Person is = (Person) request.getAttribute("person"); 
	out.println(is.getName());
	
<jsp:useBean id="person" class="foo.Person" scope="request">
	<% System.out.println("here"); %>
</jsp:useBean>

<jsp:getProperty name="person" property="dog" />


--%>
	Dog's name is:${ musicList[musicType[0]] }<br>
	${ musicList["am"] }<br>
	${ musicList.mu }
</body>
</html>