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

The Person is:<br>
<jsp:useBean id="person" type="foo.Person" class="foo.Employee" >
	<jsp:setProperty name="person" property="name" value='<%= request.getParameter("hobby") %>' />
</jsp:useBean>
<%-- person.setName(request.getParameter("hobby")); --%>
<%-- Person is = (Person) request.getAttribute("person"); 
	out.println(is.getName());
	

--%>

<jsp:getProperty property="name" name="person"/>
</body>
</html>