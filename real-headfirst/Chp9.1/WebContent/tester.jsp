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
	<table>
		<%-- String[] items = (String[]) request.getAttribute("movieList");
			String var = null;
			for(int i = 0;i< items.length;i++){
				var = items[i];
			
		<tr><td><%= var %></td></tr>
		
		--%>
		
		<%-- } --%>
		<c:forEach var="listElement" items="${ movies }" varStatus="movieLoopCount">
			<c:forEach var="movie" items="${ listElement }" varStatus="outLoop">
				<tr>
					<td>${ movie }</td><td>Count-out:${ movieLoopCount.count }</td><td>Count-in:${ outLoop.count }</td>
				</tr>
			</c:forEach>
			
		</c:forEach>
	</table>

</body>
</html>