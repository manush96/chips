<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <%@page import="com.elitecore.model.User" %>  

<div class="col-sm-offset-1 col-sm-10 lr0pad" id="wizard_div">
	<div class="col-sm-12 report_div" id="report_div_1">
		<form:form modelAttribute="Reportdto" action="" class="form-horizontal" role="form" method="POST">
				<div class="col-sm-offset-1 col-sm-8">
					<div class="form-group">
				    	<form:input path="report_name" type="text" class="form-control input-lg tip_danger_lg" id="report_name" name="report_name" placeholder="Report Name" required="true" title=""/>
				    </div>
				</div>
				<div class="col-sm-offset-1 col-sm-8">
				    <div class="form-group">
						<select class="select_list form-control" id="rep_db" data-placeholder="DataBase Name">
							<option value=""></option>
							<c:forEach items="${list1}" var="item1">
								<option value="${item1.id}">${item1.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="col-sm-offset-1 col-sm-8">
					<div class="form-group">
						<select class="select_list form-control" id="rep_query" data-placeholder="Query Name">
							<option value=""></option>
							<c:forEach items="${list}" var="item">
								<option value="${item.id}^${item.query}">${item.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="clearfix"></div><br/>
				<div class="col-sm-offset-1">
					<span class="myError h4" style="color: red"></span>
				</div>
	           	<div class="form-group">        
	               <div class="pull-right">
	                   <button type="button" id="goto_2" class="btn btn-info submit">
	                       Next <span class="glyphicon glyphicon-chevron-right"></span>
	                   </button>
	               </div>
	           	</div>
		</form:form>
	</div>
	<div class="col-sm-12 lr0pad report_div" id="report_div_2">
			
	</div>
</div>