<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="myTags" uri="simpleTags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<myTags:simple1>
		This is the body<br>
	</myTags:simple1>
	<myTags:simple3>
		${ message }<br>
	</myTags:simple3>
	<table>
		<myTags:simple4>
			<tr><td>${ movie }</td></tr>
		</myTags:simple4>
	</table>
	<% List movieCollection = new ArrayList();
		movieCollection.add("monsoon wedding");
		movieCollection.add("saved");
		movieCollection.add("fahrenheit 9/11");
		request.setAttribute("movieCollection", movieCollection);
		
	%>
	<table>
		<myTags:simple5 movieList="${ movieCollection }">
			<tr><td>${ movie }</td></tr>
		</myTags:simple5>
	</table>
	<jsp:include page="badTagInclude.jsp"></jsp:include>
	<br>back in the page after invoking the tag

</body>
</html>