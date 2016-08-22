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
		<div class="col-sm-2">
			<img src="img/logo.png" style="height: 80px; width: 80px"/>
		</div>
		<div class="col-sm-8">
			<h2 class="text-center">Welcome ${key}</h2>
		</div>
		<div class="col-sm-1 col-sm-offset-1">
			
			<h2 style="text-align: right"><a href="logout.html"><span class="glyphicon glyphicon-off"></span></a></h2>
			<span id="session_url" style="display: none">
			<% 
				String url = (String) session.getAttribute("url"); 
				if(!(url.equals(""))) 
					out.println(url); 
			%></span>
		</div>
	</div>
	<hr/>
	<div id="body" class="container-fluid">
		<div id="sidebar-wrapper" class="col-sm-2 lr0pad">
            <ul class="sidebar-nav">
                <li class="active_sidelink sidelink">
                    <a class="ajax_load" ref="viewquery.html?page=1" id="dashboard_link"><span class="glyphicon glyphicon-home"></span> Dashboard</a>
                </li>
                
                <li class="sidelink">
                    <a class="ajax_load" ref="viewdb.html?page=1"><span class="glyphicon glyphicon-th-list"></span> Manage DB</a>
                </li>
                <li class="sidelink">
                    <a class="ajax_load" ref="reportconfig.html"><span class="glyphicon glyphicon-cog"></span> Generate Report</a>
                </li>
                <li class="sidelink">
                    <a ref="viewreport.html?page=1" class="ajax_load"><span class="glyphicon glyphicon-list-alt"></span> View Reports</a>
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