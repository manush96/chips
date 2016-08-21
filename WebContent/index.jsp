<%@page import="com.elitecore.model.User"%>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<center>
	<h1 style="color: Aqua">Welcome to Customization and Configuration
		Portal</h1>
	<h2 style="color: lightgreen">Welcome to Landing Page</h2>
	<h3>
		<a href="hello.html">Click Here to Proceed...!</a>
	</h3>
</center>
<%
	User user = new User();
	user.setUserName("vatsal");
	session.setAttribute("user", user);
	session.setAttribute("url", "viewquery.html?page=1");
	response.sendRedirect("profile.html");
	
%>