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
<%-- String pref = (String) session.getAttribute("userPref");
	if(pref.equals("performance")){
		out.println("now you can stop even if you <em>do</em> drive insanely fast.");
	} else if(pref.equals("safety")){
		out.println("Our brakes won't lock up, no matter how bad a driver you are");
	} else if(pref.equals("maintenance")){
		out.println("Lost your tech job? No problem--you won't have to service these brakes for at least three years.");
	} else {
		out.println("Our brakes are the best.");
	}

--%>
<c:choose>
	<c:when test="${ userPref == 'performance' }">
		now you can stop even if you <em>do</em> drive insanely fast.
	</c:when>
	<c:when test="${ userPref == 'safety' }">
		Our brakes won't lock up, no matter how bad a driver you are
	</c:when>
	<c:when test="${ userPref == 'maintenance' }">
		Lost your tech job? No problem--you won't have to service these brakes for at least three years.
	</c:when>
	<c:otherwise>
		Our brakes are the best.
	</c:otherwise>
	
</c:choose>
<br>
<strong>The Brakes</strong><br>
2333333333333333333333333333333
</body>
</html>