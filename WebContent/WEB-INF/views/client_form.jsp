<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>

<form:form modelAttribute="Clientdto" action="client_otp.html" class="form-horizontal" role="form" method="POST">
	            <div class="form-group">
	                <div class="input-group col-sm-11">
	                    <span class = "input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
	                    <form:input path="username" type="text" class="form-control input-lg" id="username" size="25" name="username" placeholder="Username" required="true" oninvalid="setCustomValidity('Please enter valid Username')" oninput="setCustomValidity('')"/>
	                </div>
	            </div>

	            <div class="form-group">
	                <div class="input-group col-sm-11">
	                    <span class = "input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	                    <input type="text" path="contact" class="form-control input-lg" id="contact" name="contact" placeholder="Contact Number" required oninvalid="setCustomValidity('Please enter Contact Number')" oninput="setCustomValidity('')">
	                </div>
	            </div><br/>
	            <div class="form-group">     
	                <div class="">
		            	<a href="client_otp">    	
		                    <button type="submit" id="login" class="btn btn-success submit">
		                        <span class="glyphicon glyphicon-log-in"></span> Login
		                    </button>
		                </a>
		            </div>
	            </div>
	        </form:form>

</body>
</html>