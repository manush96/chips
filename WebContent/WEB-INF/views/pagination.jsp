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
       				<h4>Name</h4>
       			</div>
       			<div class="col-sm-3 lr0pad">
       				<h4>Query</h4>
       			</div>
       			<div class="col-sm-3 lr0pad">
       				<h4>Description</h4>
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
       		<c:forEach var="query" items="${list}" varStatus="j">
	       		<div class="col-sm-12 lr0pad query_manager_row" data-id="${query.id}">
	       			<div class="col-sm-1 lr0pad">
	       				<center>
	       					<input type="checkbox" name="selection[]" class="select_check" rel="${query.id }"/>
	       				</center>
	       			</div>
	       			<div class="col-sm-1 lr0pad">
	       				${((sessionScope.page_id - 1)*5) + j.index + 1}
	       			</div>
	       			<div class="col-sm-2 lr0pad">
	       				<span class="name_text">${query.name}</span>
	       			</div>
	       			<div class="col-sm-3 lr0pad">
	       				<span class="query_text">${query.query}</span>
	       			</div>
	       			<div class="col-sm-3 lr0pad" style="padding-right: 8px">
	       				<span class="description_text">${query.description}</span>
	       			</div>
	       			<div class="col-sm-2 lr0pad">
	        			<div class="col-sm-6 lr0pad">
	        				<button class="btn btn-primary edit_query_row" title="Edit" data-toggle="modal" data-target="#edit_query_modal" rel="${query.id}">
	        					<span class="glyphicon glyphicon-pencil"></span>
	        				</button>
	        				<button class="btn btn-danger remove_query_row" title="Delete" rel="${query.id}">
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
								<a class="ajax_load set_page_id" ref="viewquery.html?page=${i}&key=${key}" rel="${i }">${i }</a></li>       				
       				</c:forEach>
				</ul>
       		</center>
      		</div>
      		<div class="col-sm-12 lr0pad">
      			<button class="btn btn-danger" title="Delete Selected" id="delete_selected">
  					<span class="glyphicon glyphicon-trash"></span>
  					 Delete Selected
  				</button>
   			<button class="btn btn-success" title="Add" data-toggle="modal" data-target="#add_query_modal">
				<span class="glyphicon glyphicon-plus"></span>
				 Add
			</button>
			<div id="add_query_modal" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<div id="head" class="col-sm-6 lr0pad">
	                			<h2><span class="glyphicon glyphicon-list-alt"></span> Add Query</h2><br/>
	            			</div>
						</div>
						<div class="modal-body" style="padding-left: 60px">
							<form:form modelAttribute="querydto" action="AddQuery.html?page=1" class="form-horizontal" role="form" method="POST">
					            <div class="form-group">
						            <div class="input-group col-sm-11">
						                <span class = "input-group-addon"><i class="glyphicon glyphicon-th-list"></i></span>
						                <form:input path="name" type="text" class="form-control input-lg tip_danger_lg" id="name" name="name" pattern="^([a-zA-z0-9]{6,256})$" placeholder="Name" required="true" oninvalid="setCustomValidity('Please enter Full name')" oninput="setCustomValidity('')" data-toggle="tooltip" data-placement="right" title=""/>
						            </div>
						        </div>
						        <br>

					        <div class="form-group">
					           <div class="input-group col-sm-11">
					                <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
					                <form:input path="query" type="text" class="form-control input-lg tip_danger_lg" id="query" name="query" placeholder="Query" required="true" oninvalid="setCustomValidity('Please enter Query')" oninput="setCustomValidity('')" data-toggle="tooltip" data-placement="right" title=""/>
					            </div>
					            <p type="hidden">Note: Always put $ Symbol in place where you want Run Time Input value.</p>
					        </div>
			
					        <div class="form-group">
					            <div class="input-group col-sm-11">
					                <span class = "input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
					                <form:input path="description" type="text" class="form-control input-lg tip_danger_lg" id="pword" name="pword" placeholder="Description" required="true" oninvalid="setCustomValidity('Please Enter Description')" oninput="setCustomValidity('')" data-toggle="tooltip" data-placement="right" title=""/>
					            </div>
					        </div>
			
						<br/>
							<div class="col-sm-12 lr0pad">
								<div class="col-sm-6">
									<div class="form-group">
								            <form:input path="status" name="status" type="number"  class="form-control" id="no_of_var" placeholder="Number of user_inputs" min="0"/>
								    </div>
								</div>
								<div class="col-sm-6">
								    <button type="button" class="btn btn-primary" id="add_parameters">
								    	Add
								    </button>
								</div>
							</div>
							<div id="add_append_div" class="col-sm-12 lr0pad">
								
							</div>
							<div id="var_clone" class="col-sm-12 my_param_div lr0pad" style="display: none">
								<div class="col-sm-5">
							        <div class="form-group">
							            <form:input path="param_name" name="param_name" type="text" class="form-control" placeholder="Parameter name"/>
							        </div>
							    </div>
								<div class="col-sm-5">
									<div class="form-group">
							            <form:input path="param_type" name="param_type" type="text" class="form-control" placeholder="Parameter type"/>
							        </div>
							    </div>
							    
							</div>
				            <div class="form-group">        
				                <div class="">
				                    <button type="submit" id="submit" class="btn btn-success submit">
				                        <span class="glyphicon glyphicon-ok"></span> Add Query
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
			<div id="edit_query_modal" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<div id="head" class="col-sm-6 lr0pad">
	                			<h2><span class="glyphicon glyphicon-list-alt"></span> Edit Query</h2><br/>
	            			</div>
						</div>
						<div class="modal-body">
							<form:form modelAttribute="querydto" action="EditQuery.html" class="form-horizontal" role="form" method="POST">
					            <div class="form-group" style="display: none">
						            <div class="input-group col-sm-11">
						                <span class = "input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						                <form:input path="name" type="hidden" class="form-control input-lg tip_danger_lg" id="name" name="name" pattern="^([a-zA-z0-9]{6,256})$" placeholder="Name" required="true" oninvalid="setCustomValidity('Please enter Full name')" oninput="setCustomValidity('')" data-toggle="tooltip" data-placement="right" title=""/>
						            </div>
						        </div>
							<form:input path="id" type="hidden" class="form-control input-lg tip_danger_lg" id="id" name="id" />
					        <div class="form-group">
					           <div class="input-group col-sm-11">
					                <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
					                <form:input path="query" type="text" class="form-control input-lg tip_danger_lg" id="query" name="query" placeholder="Query" required="true" oninvalid="setCustomValidity('Please enter Query')" oninput="setCustomValidity('')" data-toggle="tooltip" data-placement="right" title=""/>
					            </div>
					        </div>
			
					        <div class="form-group">
					            <div class="input-group col-sm-11">
					                <span class = "input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
					                <form:input path="description" type="text" class="form-control input-lg tip_danger_lg" id="pword" name="pword" placeholder="Description" required="true" oninvalid="setCustomValidity('Please Enter Description')" oninput="setCustomValidity('')" data-toggle="tooltip" data-placement="right" title=""/>
					            </div>
					        </div>
			
						<br/>
				            <div class="form-group">        
				                <div class="">
				                    <button type="submit" id="submit" class="btn btn-success submit">
				                        <span class="glyphicon glyphicon-ok"></span> Save
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
			<span style="display: none" id="page_id"><%= id %></span>
	   </div>