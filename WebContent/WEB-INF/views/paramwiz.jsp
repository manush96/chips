<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="CssAndJs/bootstrap.css"/> 
 	<link rel="stylesheet" type="text/css" href="CssAndJs/stylesheet.css"/> 
 	<script type="text/javascript" src="CssAndJs/bootstrap.js"></script>
	<script type="text/javascript" src="CssAndJs/general.js"></script>
	<script type="text/javascript" src="CssAndJs/jquery.js"></script>
	<script type="text/javascript" src="CssAndJs/login.js"></script>
</head>
<!-- <body> -->
<form action="paramquery.html" method="get">
<%
System.out.println((String) session.getAttribute("query")+"this is it");

%>

<c:forEach items="${list}" var="i">
<br/>
<input type="text" class="form-control input-lg" id="${i}" size="20" name="${i}" placeholder="Value of ${i}" required="true" oninvalid="setCustomValidity('Please enter valid Username')" oninput="setCustomValidity('')"/>
</c:forEach>
<br/>
<input type="submit">
</form>
</body>
</html>