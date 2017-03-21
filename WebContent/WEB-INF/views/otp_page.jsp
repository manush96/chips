<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%=session.getAttribute("OTP")%>
<%-- <%out.println(session.getAttribute("OTP")); %> --%>
	<form action="client_verify_otp.html" class="form-horizontal" role="form" method="POST">
	            <div class="form-group">
	                <div class="input-group col-sm-11">
	                    <span class = "input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
	                    <input type="text" class="form-control input-lg" id="otp" size="6" name="otp" placeholder="Enter OTP here!" required="true" oninvalid="setCustomValidity('Please enter valid OTP')" oninput="setCustomValidity('')"/>
	                </div>
	            </div>

	            <br/>
	            <div class="form-group">     
	                <div class="">
		            	<a href="">    	
		                    <button type="submit" id="verify_otp" class="btn btn-success submit">
		                        <span class="glyphicon glyphicon-log-in"></span> Verify And Start Session
		                    </button>
		                </a>
		            </div>
	            </div>
	        </form>

</body>
</html>