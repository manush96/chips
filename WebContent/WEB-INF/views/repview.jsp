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
	     	<button class="btn btn-success" type="button" id="get_reports">
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
       				<h4>Report Name</h4>
       			</div>
       			<div class="col-sm-2 lr0pad">
       				<h4>Query Id</h4>
       			</div>
       			<div class="col-sm-2 lr0pad">
       				<h4>Database ID</h4>
       			</div>
       			<div class="col-sm-2 lr0pad">
       				<h4>Display Names</h4>
       			</div>
       			<div class="col-sm-2 lr0pad">
       				<h4>Schedule/Delete/Execute</h4>
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
						<div class="col-sm-6 lr0pad">
							<center>
								<input type="checkbox" name="selection[]" class="select_check"
									rel="${report.id }" />
							</center>
						</div>
						<div class="col-sm-6 lr0pad">
							<p>${((sessionScope.page_id - 1)*5) + j.index + 1}</p>
						</div>
					</div>
					<div class="col-sm-0 lr0pad">
						<span value="${report.id}" class="report_id"></span>
					</div>
	       			<div class="col-sm-2 lr0pad">
	       				<span class="name_text">${report.report_name}</span>
	       			</div>
	       			<div class="col-sm-2 lr0pad">
	       				<span class="query_text">${report.query_id}</span>
	       			</div>
	       			<div class="col-sm-2 lr0pad">
	       				<span class="description_text">${report.db_id}</span>
	       			</div>
	       			<div class="col-sm-2 lr0pad">
	       				<span class="description_text">${report.display_name}</span>
	       			</div>
	       			<div class="col-sm-2 lr0pad">
        				<button class="btn btn-primary schedule_report" title="Schedule" data-toggle="modal" data-target="#scheduler_modal" rel="${report.id}">
        					<span class="glyphicon glyphicon-time"></span>
        				</button>
        				<button class="btn btn-danger remove_report_row" title="Delete" rel="${report.id}">
        					<span class="glyphicon glyphicon-trash"></span>
        				</button>
        				<a href="reportgenerator.html?query_id=${report.query_id}&disp_name=${report.display_name}&db_id=${report.db_id}" target="_blank">
	        				<button class="btn btn-success execute_report" title="Execute" rel="${report.id}">
	        					<span class="glyphicon glyphicon-cog"></span>
	        				</button>
        				</a>
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
   			<button class="btn btn-success ajax_load" ref="reportconfig.html" title="Add" data-toggle="modal" data-target="#add_report_modal">
				<span class="glyphicon glyphicon-plus"></span>
				 Add
			</button>
			<div id="scheduler_modal" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<div id="head" class="col-sm-6 lr0pad">
	                			<h2><span class="glyphicon glyphicon-list-alt"></span> Add Scheduler</h2><br/>
	            			</div>
						</div>
						<div class="modal-body">
							<div id="edit_body" class="col-sm-12">
								<form:form modelAttribute="scheduler" action="scheduletask.html" class="form-horizontal" role="form" method="POST">
									<form:input path="id" type="hidden" id="id" name="id" />
									<form:input path="report_id" type="hidden" id="report_id" name="report_id" value=""/>
									<form:input path="start_time" type="hidden" id="start_time" name="start_time" />
									<form:input path="freq_hour" type="hidden" id="freq_hour" name="freq_hour" />
							        <div class="form-group">
							           <div class="input-group col-sm-11">
							                <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
							                <form:input path="job_name" type="text" class="form-control input-lg tip_danger_lg" id="job" name="job" placeholder="Job Name" required="true" oninvalid="setCustomValidity('Please enter Job Name')" oninput="setCustomValidity('')" title="Job Title"/>
							            </div>
							        </div>
					
							        <div class="form-group">
							            <div class="input-group col-sm-11">
							                <span class = "input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
							                <form:input path="email_id" type="text" class="form-control input-lg tip_danger_lg" id="email_id" name="email_id" placeholder="Report Email" required="true" oninvalid="setCustomValidity('Please enter an email')" oninput="setCustomValidity('')" title="Email address"/>
							            </div>
							        </div>
							        <div class="col-sm-12 lr0pad">
							        	<h4>Start Time:</h4>
							        	<div class="col-sm-3">
								        	<div class="form-group">
									            <input type="number" id="start_hrs" class="form-control" min="0" max="23" placeholder="Hours" value="0"/>
									        </div>
									    </div>
									    <div class="col-sm-3 col-sm-offset-1">
									        <div class="form-group">
									            <input type="number" id="start_mins" class="form-control" min="0" max="59" placeholder="Minutes" value="0"/>
									        </div>
									    </div>
							        </div>
							        
							        <div class="col-sm-12 lr0pad">
							        	<h4>Interval:</h4>
							        	<div class="col-sm-3">
								        	<div class="form-group">
									            <input type="number" id="int_days" class="form-control" min="0" max="30" placeholder="Days" value="0"/>
									        </div>
									    </div>
									    <div class="col-sm-3 col-sm-offset-1">
									        <div class="form-group">
									            <input type="number" id="int_hrs" class="form-control" min="0" max="23" placeholder="Hours" value="0"/>
									        </div>
									    </div>
							        </div>
							        
						            <div class="form-group">        
						                <div class="">
						                    <button type="submit" id="scheduler_submit" class="btn btn-success submit">
						                        <span class="glyphicon glyphicon-ok"></span> Save
						                    </button>
						                </div>
						            </div>
					        </form:form>
					        
						</div>
					</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>