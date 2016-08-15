<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<body>

<form:form modelAttribute="SearchKeyWord" action="SearchFilter.html?page=1" class="form-horizontal" role="form" method="POST">
	            <div class="form-group">
	                <div class="input-group col-sm-11">
	                    <span class = "input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
<form:input path="keyword" type="text" id="keyword" size="25" name="keyword" placeholder="keyword" required="true"/>
	                </div>
	            </div>

				<div class="form-group">     
	                <div class="">
	                    <button type="submit" id="Search" class="btn btn-success submit">
	                        <span class="glyphicon glyphicon-log-in"></span> Search
	                    </button>
	                </div>
	            </div>
</form:form>
</body>
</html>