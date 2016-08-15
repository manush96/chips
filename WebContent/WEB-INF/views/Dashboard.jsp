<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>

	<link rel="stylesheet" type="text/css" href="Css/bootstrap.css"/> 
 	<link rel="stylesheet" type="text/css" href="Css/stylesheet.css"/>
 	<link rel="stylesheet" type="text/css" href="Css/jquery-confirm.css"/>
 	<link rel="stylesheet" type="text/css" href="Css/select2.css"/>
 	<script type="text/javascript" src="Js/jquery.js"></script> 
 	<script type="text/javascript" src="Js/bootstrap.js"></script>
 	<script type="text/javascript" src="Js/select2.js"></script>
 	<script type="text/javascript" src="Js/jquery-confirm.js"></script>
	<script type="text/javascript" src="Js/general.js"></script>
	
	<!-- <link rel="stylesheet" type="text/css" href="CssAndJs/bootstrap.css"/> 
 	<link rel="stylesheet" type="text/css" href="CssAndJs/stylesheet.css"/> 
 	<script type="text/javascript" src="CssAndJs/jquery.js"></script>
 	<script type="text/javascript" src="CssAndJs/bootstrap.js"></script>
	<script type="text/javascript" src="CssAndJs/general.js"></script>
	<script type="text/javascript" src="CssAndJs/login.js"></script> -->

</head>
<body>
	<div id="header" class="container-fluid">
		<div class="col-sm-1">
			<img src="img/logo.png" style="height: 80px; width: 80px"/>
		</div>
		<div class="col-sm-11">
			<h1 class="text-center">Heyyy!</h1>
			
			<h2>Welcome ${key}</h2>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="logout.html">Logout</a>
			<span id="session_url" style="display: none">
			<% 
				String url = (String) session.getAttribute("url"); 
				if(!(url.equals(""))) 
					out.println(url); 
			%></span>
		</div>
	</div>
	<div id="body" class="container-fluid">
		<div id="sidebar-wrapper" class="col-sm-2 lr0pad">
            <ul class="sidebar-nav">
                <li>
                    <a class="ajax_load" ref="viewquery.html?page=1" id="dashboard_link"><span class="glyphicon glyphicon-share"></span> Dashboard</a>
                </li>
                <li>
       				<a ref="keyword.html" class="ajax_load" ><span class="glyphicon glyphicon-ok"></span> Search Keyword</a>
                </li>
                <li>
                    <a class="ajax_load" ref="hello.html"><span class="glyphicon glyphicon-ok"></span> About</a>
                </li>
                <li>
                    <a class="ajax_load" ref="viewdb.html?page=1"><span class="glyphicon glyphicon-ok"></span> DB Master</a>
                </li>
                <li>
                    <a class="ajax_load" ref="reportconfig.html"><span class="glyphicon glyphicon-ok"></span> Report</a>
                </li>
                <li>
                    <a href="#"><span class="glyphicon glyphicon-ok"></span> Services</a>
                </li>
                <li>
                    <a href="#"><span class="glyphicon glyphicon-ok"></span> Contact</a>
                </li>

            </ul>
        </div>
        <div class="col-sm-10" id="content_div">
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