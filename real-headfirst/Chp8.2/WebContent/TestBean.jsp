<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="mydog" class="foo.Dog">
		create
		<jsp:setProperty name="mydog" property="name" value="puppy"/><br>
	</jsp:useBean>
	here
	<jsp:getProperty name="mydog" property="name"/><br>
	
	use el :${mydog.name}<br>

	Request param name is:${ param.name }<br>
	Request param empID is:${ param.empID }<br>
	Request param food is:${ param.food }<br>
	Request param First food is:${ paramValues.food[0] }<br>
	Request param Second food is:${ paramValues.food[1] }<br>
	
	Request param name:${ paramValues.name[0] }<br>
	
	Header is :${ header.host }<br>
	
	Method is :${ pageContext.request.method }<br>
	
	context param is :${ initParam.mainEmail }<br>
	
	use pageScope get name is: ${ requestScope.name }

</body>
</html>