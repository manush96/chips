<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page import="com.elitecore.model.User" %>
<html>
<head>
	<title>Login</title>
 	<!-- <link rel="stylesheet" type="text/css" href="Css/bootstrap.css"/> 
 	<link rel="stylesheet" type="text/css" href="Css/stylesheet.css"/> 
 	<script type="text/javascript" src="Js/bootstrap.js"></script>
	<script type="text/javascript" src="Js/general.js"></script>
	<script type="text/javascript" src="Js/jquery.js"></script>
	<script type="text/javascript" src="Js/login.js"></script>
	 -->
	 <link rel="stylesheet" type="text/css" href="CssAndJs/bootstrap.css"/> 
 	<link rel="stylesheet" type="text/css" href="CssAndJs/stylesheet.css"/> 
 	<script type="text/javascript" src="CssAndJs/bootstrap.js"></script>
	<script type="text/javascript" src="CssAndJs/general.js"></script>
	<script type="text/javascript" src="CssAndJs/jquery.js"></script>
	<script type="text/javascript" src="CssAndJs/login.js"></script>
	
</head>

<body>

${key}
<div id="header" class="container-fluid">
		<div class="col-sm-1">
		
				<img src="img/logo.png" style="height: 80px; width: 80px"/>
		</div>
		<div class="col-sm-11">
			<h1 class="text-center">Welcome to Customization and Configuration Panel!</h1>
		</div>
	</div>
	<div id="body" class="container-fluid">
		<div id="signin" class="col-sm-offset-1 col-sm-4">
			<div class="col-sm-12 lr0pad">
		            <div id="head" class="col-sm-6 lr0pad">
		                <h2><span class="glyphicon glyphicon-user"></span> Login</h2><br/>
		            </div>
		    </div>

	        <form:form modelAttribute="userdto" action="login.html" class="form-horizontal" role="form" method="POST">
	            <div class="form-group">
	                <div class="input-group col-sm-11">
	                    <span class = "input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
	                    <form:input path="username" type="text" class="form-control input-lg" id="username" size="25" name="username" placeholder="Username" required="true" oninvalid="setCustomValidity('Please enter valid Username')" oninput="setCustomValidity('')"/>
	                </div>
	            </div>

	            <div class="form-group">
	                <div class="input-group col-sm-11">
	                    <span class = "input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	                    <input type="password" class="form-control input-lg" id="password" name="password" placeholder="Password" required oninvalid="setCustomValidity('Please enter Password')" oninput="setCustomValidity('')">
	                </div>
	            </div><br/>
	            <div class="form-group">     
	                <div class="">
	                    <button type="submit" id="login" class="btn btn-success submit">
	                        <span class="glyphicon glyphicon-log-in"></span> Login
	                    </button>
	                </div>
	            </div>
	        </form:form>
	        <div class="row">
		    	<h4><a href="\" class="text-danger">Forgot Password?</a></h4>
		    </div>
		    <center>
	        <div class="row">
		        <h3>
		        	Don't have an account yet?
		        </h3>
		        <h4><a href="">Signup Now</a></h4>
		    </div>
		    </center>
		</div>

		<div id="signup" class="col-sm-offset-1 col-sm-4">
			<div class="col-sm-12 lr0pad">
		            <div id="head" class="col-sm-6 lr0pad">
		                <h2><span class="glyphicon glyphicon-list-alt"></span> Register</h2><br/>
		            </div>
		    </div>
	        <form:form modelAttribute="userdto" action="save.html" class="form-horizontal" role="form" method="POST">
	            <div class="form-group">
		            <div class="input-group col-sm-11">
		                <span class = "input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
		                <form:input path="username" type="text" class="form-control input-lg tip_danger_lg" id="name" name="name" pattern="^([a-zA-z0-9]{6,256})$" placeholder="Name" required="true" oninvalid="setCustomValidity('Please enter Full name')" oninput="setCustomValidity('')" data-toggle="tooltip" data-placement="right" title=""/>
		            </div>
		        </div>

		        <div class="form-group">
		           <div class="input-group col-sm-11">
		                <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
		                <form:input path="phone_no" type="text" class="form-control input-lg tip_danger_lg" id="contact" name="contact" pattern="[0-9]{10}" placeholder="Contact no" maxlength="10" required="true" oninvalid="setCustomValidity('Please enter a valid Contact number')" oninput="setCustomValidity('')" data-toggle="tooltip" data-placement="right" title=""/>
		            </div>
		        </div>

		        <div class="form-group">
		            <div class="input-group col-sm-11">
		                <span class = "input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
		                <form:input path="password" type="password" class="form-control input-lg tip_danger_lg" id="pword" name="pword" pattern="^([a-zA-z0-9]{6,256})$" placeholder="Password" required="true" oninvalid="setCustomValidity('Please choose a Password')" oninput="setCustomValidity('')" data-toggle="tooltip" data-placement="right" title=""/>
		            </div>
		        </div>

<br/>
	            <div class="form-group">        
	                <div class="">
	                    <button type="submit" id="submit" class="btn btn-success submit">
	                        <span class="glyphicon glyphicon-ok"></span> Signup
	                    </button>
	                </div>
	            </div>
	        </form:form>
		</div>
	</div>
	<div id="footer" class="container-fluid">
		<center>
			<h3>
				<a href="">Contact us</a>
				<a href="">Privacy Policy</a>
				<a href="">Cookies</a>
				<a href="">Copyright</a>
			</h3>
		</center>
	</div>
</body>
</html>