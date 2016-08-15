<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <%@page import="com.elitecore.model.User" %>  
 
 <link rel="stylesheet" type="text/css" href="Css/bootstrap.css"/> 
 	<link rel="stylesheet" type="text/css" href="Css/stylesheet.css"/>
 	<link rel="stylesheet" type="text/css" href="Css/jquery-confirm.css"/>
 	<script type="text/javascript" src="Js/jquery.js"></script> 
 	<script type="text/javascript" src="Js/bootstrap.js"></script>
 	<script type="text/javascript" src="Js/jquery-confirm.js"></script>
	<script type="text/javascript" src="Js/general.js"></script>

       	<div class="col-sm-12 lr0pad" id="query_manager_div">
       		<div class="col-sm-12 lr0pad" id="query_manager_header">
       			
       			<div class="col-sm-1 lr0pad">
       				<h4>#</h4>
       			</div>
       			<div class="col-sm-3 lr0pad">
       				<h4>Name</h4>
       			</div>
       			<div class="col-sm-4 lr0pad">
       				<h4>Query</h4>
       			</div>
       			<div class="col-sm-4 lr0pad">
       				<h4>Description</h4>
       			</div>
       			
       		</div>
       		<c:forEach var="query" items="${list}" varStatus="i">
	       		<div class="col-sm-12 lr0pad query_manager_row" data-id="${query.id}">
	       			
	       			<div class="col-sm-1 lr0pad">
	       				${((sessionScope.page_id - 1)*5) + i.index + 1}
	       			</div>
	       			<div class="col-sm-3 lr0pad">
	       				<span class="name_text">${query.name}</span>
	       			</div>
	       			<div class="col-sm-4 lr0pad">
	       				<span class="query_text">${query.query}</span>
	       			</div>
	       			<div class="col-sm-4 lr0pad" style="padding-right: 8px">
	       				<span class="description_text">${query.description}</span>
	       			</div>
	       		</div>
	       	</c:forEach>
       		
       	</div>
       	<div class="col-sm-12 lr0pad">
       		<center>
       		<%
       			int id = (Integer) session.getAttribute("page_id");
       		%>
       			<ul class="pagination">
       				<c:forEach var="i" begin="1" end="${count}" step="1">
						<li <% 
								if(id==(Integer)pageContext.getAttribute("i"))
								{ 
									out.println("class=\"active\""); 
								}%>>
								<a class="ajax_load set_page_id" ref="SearchFilter.html?page=${i}" rel="${i}">${i}</a></li>       				
       				</c:forEach>
				</ul>
       		</center>
      	</div>
