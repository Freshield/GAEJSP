<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mine" uri="KathyClassicTags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<mine:classicOne/><br>
	Classic Tag Two:<br>
	<mine:classicTwo/><br>
	Classic test have body
	<mine:classicTest>
		This is the body
	</mine:classicTest>
	Classic iterator:<br>
	<table border="1">
		<mine:classicItrator>
			<tr><td>${ movie }</td></tr>
		</mine:classicItrator>
	
	</table><br>
	
	test parent:
	<mine:ClassicParent name="ClassicParentTag">
		<mine:SimpleInner></mine:SimpleInner>
	</mine:ClassicParent>

</body>
</html>