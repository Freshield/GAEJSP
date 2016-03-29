<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%-- include file="Header.jsp" 
	--%>
	<%-- include file="Header.jspf" --%>
	<jsp:include page="Header.jsp">
		<jsp:param value="We take the sting out of SOAP" name="subTitle"/>
	</jsp:include>
	<br>
	<em>We can help.</em><br><br>
	Contact us at:${ initParam.mainEmail }<br>
	<%@ include file="Footer.html" --%><br>

</body>
</html>