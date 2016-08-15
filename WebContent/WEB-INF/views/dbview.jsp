<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <%@page import="com.elitecore.model.User" %>  

       	<div class="col-sm-12 lr0pad" id="query_manager_div">
       		<div class="col-sm-12 lr0pad" id="query_manager_header">
       			<div class="col-sm-2 lr0pad">
       				
       			</div>
       			<div class="col-sm-1 lr0pad">
       				<h4>#</h4>
       			</div>
       			<div class="col-sm-1 lr0pad">
       				<h4>Name</h4>
       			</div><div class="col-sm-1 lr0pad">
       				<h4>Username</h4>
       			</div><div class="col-sm-1 lr0pad">
       				<h4>Password</h4>
       			</div><div class="col-sm-1 lr0pad">
       				<h4>URL</h4>
       			</div><div class="col-sm-1 lr0pad">
       				<h4>Description</h4>
       			</div><div class="col-sm-1 lr0pad">
       				<h4>Max pool size</h4>
       			</div><div class="col-sm-1 lr0pad">
       				<h4>Min pool size</h4>
       			</div>
       			<div class="col-sm-2 lr0pad">
       				<h4>Edit/Delete</h4>
       			</div>
       		</div>
       		<c:forEach var="db" items="${list}" varStatus="i">
	       		<div class="col-sm-12 lr0pad query_manager_row" data-id="${db.id}">
	       			<div class="col-sm-2 lr0pad">
	       				<center>
	       					<input type="checkbox" name="selection[]" class="select_check" rel="${db.id }"/>
	       				</center>
	       			</div>
	       			<div class="col-sm-1 lr0pad">
	       				${((sessionScope.page_id - 1)*5) + i.index + 1}
	       			</div>
	       			<div class="col-sm-1 lr0pad">
	       				<span class="name_text">${db.name}</span>
	       			</div>
	       			<div class="col-sm-1 lr0pad">
	       				<span class="query_text">${db.username}</span>
	       			</div>
	       			<div class="col-sm-1 lr0pad" style="padding-right: 8px">
	       				<span class="description_text">${db.password}</span>
	       			</div>
	       			<div class="col-sm-1 lr0pad" style="padding-right: 8px">
	       				<span class="description_text">${db.url}</span>
	       			</div>
	       			<div class="col-sm-1 lr0pad" style="padding-right: 8px">
	       				<span class="description_text">${db.max_pool_size}</span>
	       			</div>
	       			<div class="col-sm-1 lr0pad" style="padding-right: 8px">
	       				<span class="description_text">${db.min_pool_size}</span>
	       			</div>
	       			<div class="col-sm-1 lr0pad" style="padding-right: 8px">
	       				<span class="description_text">${db.description}</span>
	       			</div>
	       			
	       			
	       			<div class="col-sm-2 lr0pad">
	        			<div class="col-sm-6 lr0pad">
	        				<button class="btn btn-primary edit_query_row" title="Edit" data-toggle="modal" data-target="#edit_query_modal" rel="${query.id}">
	        					<span class="glyphicon glyphicon-pencil"></span>
	        				</button>
	        				<button class="btn btn-danger remove_query_row" title="Delete" rel="${db.id}">
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
								<a class="ajax_load set_page_id" ref="viewdb.html?page=${i}" rel="${i }">${i }</a></li>       				
       				</c:forEach>
			</ul> 
       		</center>
      		</div>
      		<div class="col-sm-12 lr0pad">
      			<button class="btn btn-danger" title="Delete Selected" id="delete_selected">
  					<span class="glyphicon glyphicon-trash"></span>
  					 Delete Selected
  				</button>
   			<button class="btn btn-success" title="Add" data-toggle="modal" data-target="#add_db_modal">
				<span class="glyphicon glyphicon-plus"></span>
				 Add
			</button>
			<div id="add_db_modal" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<div id="head" class="col-sm-6 lr0pad">
	                			<h2><span class="glyphicon glyphicon-list-alt"></span> Add Database</h2><br/>
	            			</div>
						</div>
						<div class="modal-body" style="padding-left: 60px">
							<form:form modelAttribute="DBMasterDto" action="adddb.html?page=1" class="form-horizontal" role="form" method="POST">
					            
					        <div class="form-group">
					           <div class="input-group col-sm-11">
					                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
					                <form:input path="username" type="text" class="form-control input-lg tip_danger_lg" placeholder="Username"/>
					            </div>
					        </div>
					        <div class="form-group">
					           <div class="input-group col-sm-11">
					                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
					                <form:input path="password" type="text" class="form-control input-lg tip_danger_lg" placeholder="Password"/>
					            </div>
					        </div>
					        <div class="form-group">
						            <div class="input-group col-sm-11">
						                <span class = "input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						                <form:input path="name" type="text" class="form-control input-lg tip_danger_lg" id="name" placeholder="Database name"/>
						            </div>
						        </div>
						<div class="form-group">
					           <div class="input-group col-sm-11">
					                <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
					                <form:input path="url" type="text" class="form-control input-lg tip_danger_lg" placeholder="Database URL"/>
					            </div>
					        </div>
					        
						<div class="form-group">
					           <div class="input-group col-sm-11">
					                <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
					                <form:input path="min_pool_size" type="number" class="form-control input-lg tip_danger_lg" placeholder="Minimum pool size"/>
					            </div>
					        </div>					
						<div class="form-group">
					           <div class="input-group col-sm-11">
					                <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
					                <form:input path="max_pool_size" type="number" class="form-control input-lg tip_danger_lg" placeholder="Maximum pool size"/>
					            </div>
					        </div>
						
					        <div class="form-group">
					            <div class="input-group col-sm-11">
					                <span class = "input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
					                <form:input path="description" type="text" class="form-control input-lg tip_danger_lg" id="description" placeholder="Description"/>
					            </div>
					        </div>
				            <div class="form-group">        
				                <div class="">
				                    <button type="submit" id="submit" class="btn btn-success submit">
				                        <span class="glyphicon glyphicon-plus"></span> Add Database
				                    </button>
				                </div>
				            </div>
				        </form:form>
					</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		