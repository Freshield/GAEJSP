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
This is a hyperlink with URL rewriting enabled.

<a href="<c:url value='/tester5.jsp'/>">Click here</a><br>
<c:set var="last" value="hidden cursor"></c:set>
<c:set var="first" value="crouching pixels"></c:set>

<c:url value="/tester5.jsp" var="inputURL">
	<c:param name="firstName" value="${ first }"></c:param>
	<c:param name="lastName" value="${ last }"></c:param>
</c:url>
The url is:${ inputURL }

</body>
</html>