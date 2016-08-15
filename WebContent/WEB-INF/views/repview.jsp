<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@page import="com.elitecore.model.User" %>  
 	<div class="col-sm-12 lr0pad">
	     <div class="col-sm-5 lr0pad">
	         <div class="form-group">
				<input class="form-control" type="text" id="keyword" size="25" name="keyword" value="${key}" placeholder="Search" autofocus/>
	         </div>
	     </div>
	     <div class="col-sm-2">
	     	<button class="btn btn-success" type="button" id="get_queries">
	     		<span class="glyphicon glyphicon-search"></span> Search
	     	</button> 
	     </div>
	</div>
	<div id="query_records_div">		
       	<div class="col-sm-12 lr0pad" id="query_manager_div">
       		<div class="col-sm-12 lr0pad" id="query_manager_header">
       			<div class="col-sm-1 lr0pad">
       				
       			</div>
       			<div class="col-sm-1 lr0pad">
       				<h4>#</h4>
       			</div>
       			<div class="col-sm-2 lr0pad">
       				<h4>Report Name</h4>
       			</div>
       			<div class="col-sm-2 lr0pad">
       				<h4>Query Id</h4>
       			</div>
       			<div class="col-sm-2 lr0pad">
       				<h4>Database ID</h4>
       			</div>
       			<div class="col-sm-3 lr0pad">
       				<h4>Display Names</h4>
       			</div>
       			<div class="col-sm-2 lr0pad">
       				<h4>Edit/Delete</h4>
       			</div>
       		</div>
       		<c:if test="${fn:length(list) eq 0}">
       			<div class="col-sm-12">
			   		<h2>No matching records found!</h2>
			   	</div>
			</c:if>
       		<c:forEach var="report" items="${list}" varStatus="j">
	       		<div class="col-sm-12 lr0pad query_manager_row" data-id="${report.id}">
	       			<div class="col-sm-1 lr0pad">
	       				<center>
	       					<input type="checkbox" name="selection[]" class="select_check" rel="${report.id }"/>
	       				</center>
	       			</div>
	       			<div class="col-sm-1 lr0pad">
	       				${((sessionScope.page_id - 1)*5) + j.index + 1}
	       			</div>
	       			<div class="col-sm-2 lr0pad">
	       				<span class="name_text">${report.report_name}</span>
	       			</div>
	       			<div class="col-sm-2 lr0pad">
	       				<span class="query_text">${report.query_id}</span>
	       			</div>
	       			<div class="col-sm-2 lr0pad" style="padding-right: 8px">
	       				<span class="description_text">${report.db_id}</span>
	       			</div>
	       			<div class="col-sm-3 lr0pad" style="padding-right: 8px">
	       				<span class="description_text">${report.display_name}</span>
	       			</div>
	       			<div class="col-sm-2 lr0pad">
	        			<div class="col-sm-6 lr0pad">
	        				<button class="btn btn-primary edit_report_row" title="Edit" data-toggle="modal" data-target="#edit_report_modal" rel="${query.id}">
	        					<span class="glyphicon glyphicon-pencil"></span>
	        				</button>
	        				<button class="btn btn-danger remove_report_row" title="Delete" rel="${report.id}">
	        					<span class="glyphicon glyphicon-trash"></span>
	        				</button>
	        			</div>
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
								<a class="ajax_load set_page_id" ref="viewreport.html?page=${i}&key=${key}" rel="${i }">${i }</a></li>       				
       				</c:forEach>
				</ul>
       		</center>
      		</div>
      		<div class="col-sm-12 lr0pad">
      			<button class="btn btn-danger" title="Delete Selected" id="delete_selected_report">
  					<span class="glyphicon glyphicon-trash"></span>
  					 Delete Selected
  				</button>
   			<button class="btn btn-success" title="Add" data-toggle="modal" data-target="#add_report_modal">
				<span class="glyphicon glyphicon-plus"></span>
				 Add
			</button>
