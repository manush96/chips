<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <%@page import="com.elitecore.model.User" %>  

<div class="col-sm-12 lr0pad" id="wizard_div">
	<div class="col-sm-12 lr0pad report_div" id="report_div_1">
		<form:form modelAttribute="Reportdto" action="" class="form-horizontal" role="form" method="POST">
				<div class="form-group">
			            <div class="input-group col-sm-11">
			                <span class = "input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
			                <form:input path="report_name" type="text" class="form-control input-lg tip_danger_lg" id="report_name" name="report_name" pattern="^([a-zA-z0-9]{6,256})$" placeholder="Report Name" required="true" oninvalid="setCustomValidity('Please enter Full name')" oninput="setCustomValidity('')" data-toggle="tooltip" data-placement="right" title=""/>
			            </div>
			        </div>
			    <div class="form-group">
					<select class="select_list form-control" id="rep_db" data-placeholder="DataBase Name">
						<option value=""></option>
						<c:forEach items="${list1}" var="item1">
							<option value="${item1.id}">${item1.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<select class="select_list form-control" id="rep_query" data-placeholder="Query Name">
						<option value=""></option>
						<c:forEach items="${list}" var="item">
							<option value="${item.id}^${item.query}">${item.name}</option>
						</c:forEach>
					</select>
				</div>       
		
			<br/>
		           <div class="form-group">        
		               <div class="pull-right">
		                   <button type="button" id="goto_2" class="btn btn-success submit">
		                       Next <span class="glyphicon glyphicon-chevron-right"></span>
		                   </button>
		               </div>
		           </div>
		</form:form>
	</div>
	<div class="col-sm-12 lr0pad report_div" id="report_div_2">
			
	</div>
</div>