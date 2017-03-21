<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@page import="com.elitecore.model.Client" %>  
 	<div class="col-sm-12 lr0pad">
	     <div class="col-sm-5 lr0pad">
	         <div class="form-group">
				<input class="form-control" type="text" id="keyword" size="25" name="keyword" value="${key}" placeholder="Search by Contact Number" autofocus/>
	         </div>
	     </div>
	     <div class="col-sm-2">
	     	<button class="btn btn-success" type="button" id="get_Clients">
	     		<span class="glyphicon glyphicon-search"></span> Search
	     	</button> 
	     </div>
	</div>
	<div id="query_records_div">		
       	<div class="col-sm-12 lr0pad" id="query_manager_div">
       		<div class="col-sm-12 lr0pad" id="query_manager_header">
       			<div class="col-sm-1 lr0pad">
					<div class="col-sm-6 lr0pad"></div>
					<div class="col-sm-6 lr0pad">#</div>
				</div>
				<div class="col-sm-0 lr0pad"></div>
       			<div class="col-sm-2 lr0pad">
       				<h4>Client Name</h4>
       			</div>
       			<div class="col-sm-2 lr0pad">
       				<h4>Contact</h4>
       			</div>
       			<div class="col-sm-2 lr0pad">
       				<h4>Blocked/Unblocked</h4>
       			</div>
       			<div class="col-sm-2 lr0pad">
       				<h4>Privileges</h4>
       			</div>
       			<div class="col-sm-2 lr0pad">
       				<h4>Delete</h4>
       			</div>
       		</div>
       		<c:if test="${fn:length(list) eq 0}">
       			<div class="col-sm-12">
			   		<h2>No matching records found!</h2>
			   	</div>
			</c:if>
       		<c:forEach var="client" items="${list}" varStatus="j">
	       		<div class="col-sm-12 lr0pad query_manager_row" data-id="${client.id}">
	       			<div class="col-sm-1 lr0pad">
						<div class="col-sm-6 lr0pad">
							<center>
								<input type="checkbox" name="selection[]" class="select_check"
									rel="${client.id }" />
							</center>
						</div>
						<div class="col-sm-6 lr0pad">
							<p>${((sessionScope.page_id - 1)*5) + j.index + 1}</p>
						</div>
					</div>
					<div class="col-sm-0 lr0pad">
						<span value="${client.id}" class="client_id"></span>
					</div>
	       			<div class="col-sm-2 lr0pad">
	       				<span class="name_text">${client.username}</span>
	       			</div>
	       			<div class="col-sm-2 lr0pad">
	       				<span class="query_text">${client.contact}</span>
	       			</div>
	       			<div class="col-sm-2 lr0pad">
	       				<span class="description_text">${client.blocked}
	       				<c:if test="${client.blocked=='0'}">
	       					<button class="btn btn-danger remove_report_row" title="Block" rel="${report.id}">
        						<span class="glyphicon glyphicon-list">Block</span>
        					</button>        				
						</c:if>
						<c:if test="${client.blocked=='1'}">
							<button class="btn btn-danger remove_report_row" title="UnBlock" rel="${report.id}">
        						<span class="glyphicon glyphicon-list">Unblock</span>
        					</button> 
						</c:if>
	       					       				
        				
	       				</span>
	       			</div>
	       			<div class="col-sm-2 lr0pad">
	       				<span class="description_text">${client.privilege}
	       				
	       				<c:if test="${client.privilege=='0'}">
	       					<button class="btn btn-danger remove_report_row" title="Grant" rel="${report.id}">
        						<span class="glyphicon glyphicon-user">Grant</span>
        					</button>
        				</c:if>
        				
        				<c:if test="${client.privilege=='1'}">
	       					<button class="btn btn-danger remove_report_row" title="Revoke" rel="${report.id}">
        						<span class="glyphicon glyphicon-user">Revoke</span>
        					</button>
        				</c:if>
	       				</span>
	       			</div>
	       			<div class="col-sm-2 lr0pad">        				
        				<button class="btn btn-danger remove_report_row" title="Delete" rel="${report.id}">
        					<span class="glyphicon glyphicon-trash"></span>
        				</button>        				
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
								<a class="ajax_load set_page_id" ref="viewclient.html?page=${i}&key=${key}" rel="${i }">${i }</a></li>       				
       				</c:forEach>
				</ul>
       		</center>
      		</div>
      		<div class="col-sm-12 lr0pad">
      			<button class="btn btn-danger" title="Delete Selected" id="delete_selected_client">
  					<span class="glyphicon glyphicon-trash"></span>
  					 Delete Selected
  				</button>
   			
			