<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="attempts_changed.html" class="form-horizontal" role="form" method="POST">
	            <div class="form-group">
	                <div class="input-group col-sm-11">
	                    <span class = "input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
	                    <input type="text" class="form-control input-lg" id="Max_attempt" size="1" name="Max_attempt" placeholder="Enter Maximum Allowed attempts here!" required="true" oninvalid="setCustomValidity('Please enter valid Attempt Number')" oninput="setCustomValidity('')"/>
	                </div>
	            </div>

	            <br/>
	            <div class="form-group">     
	                <div class="">
		            	<a href="">    	
		                    <button type="submit" id="verify_attempt" class="btn btn-success submit">
		                        <span class="glyphicon glyphicon-log-in"></span> Verify And Change Attempt Limit
		                    </button>
		                </a>
		            </div>
	            </div>
	        </form>


</body>
</html>