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
	<div class="col-sm-offset-2 col-sm-8" style="margin-top: 50px; padding: 50px; box-shadow: -8px 8px 5px gray; border: 2px solid #ccc; border-top: 7px solid black">
		<c:forEach items="${list}" var="i">
			<div class="row">
				<div class="form-group">		
					<input type="text" class="form-control input-lg" id="${i}" size="20" name="${i}" placeholder="Value of ${i}"/>
				</div>
			</div>
			<div class="clearfix"></div><br/>
		</c:forEach>
		<div class="row">
			<button type="submit" class="btn btn-success">
				<span class="glyphicon glyphicon-cog"></span> Generate
			</button>
		</div>
	</div>
</form>
</body>
</html>