<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
About to be bad...
<c:catch var="myException">
	Inside the catch...
	<% int x = 10/0; %>
</c:catch>

If you see this, we survived.<br>
<c:if test="${ myException != null }">
	There was an exception:${ myException.message }<br>
</c:if>

</body>
</html>