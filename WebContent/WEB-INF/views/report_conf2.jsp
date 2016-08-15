 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form:form modelAttribute="Reportdto" action="" class="form-horizontal" role="form" method="POST">
	<div id="var_clone" class="col-sm-12 my_param_div lr0pad">
		<div class="col-sm-5">
	        <div class="form-group">
	            <form:input path="" name="param_name" type="text" class="form-control" value="${list}" disabled="true"/>
	        </div>
	    </div>
		<br/><br/><br/>
		<div class="col-sm-5">
			<div class="form-group">
	            <form:input path="display_name" name="display_name" type="text" class="form-control" placeholder="Display Name"/>
	        </div>
	    </div>
		<br/><br/>
		<div class="form-group">
			<div class="pull-right">
				<button type="button" id="goto_3" class="btn btn-success submit">
					Next <span class="glyphicon glyphicon-chevron-right"></span>
				</button>
			</div>
		</div>
	</div>
</form:form>