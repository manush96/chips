<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <%@page import="com.elitecore.model.User" %>  


<form:form modelAttribute="Reportdto" action="" class="form-horizontal" role="form" method="POST">
		<div class="form-group">
	            <div class="input-group col-sm-11">
	                <span class = "input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
	                <form:input path="report_name" type="text" class="form-control input-lg tip_danger_lg" id="report_name" name="report_name" pattern="^([a-zA-z0-9]{6,256})$" placeholder="Report Name" required="true" oninvalid="setCustomValidity('Please enter Full name')" oninput="setCustomValidity('')" data-toggle="tooltip" data-placement="right" title=""/>
	            </div>
	        </div>

        <div class="form-group">
           <div class="input-group col-sm-11">
                <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                <form:input path="display_name" type="text" class="form-control input-lg tip_danger_lg" id="query" name="query" placeholder="Query" required="true" oninvalid="setCustomValidity('Please enter Query')" oninput="setCustomValidity('')" data-toggle="tooltip" data-placement="right" title=""/>
            </div>
        </div>
		<div class="form-group">
			<select class="select_list form-control" data-placeholder="Query Name">
				<option value=""></option>
				<c:forEach items="${list}" var="item">
					<option value="${item.id}">${item.name}</option>
				</c:forEach>
			</select>
		</div>       

	<br/>
           <div class="form-group">        
               <div class="">
                   <button type="submit" id="submit" class="btn btn-success submit">
                       <span class="glyphicon glyphicon-ok"></span> Add Query
                   </button>
               </div>
           </div>
</form:form>	