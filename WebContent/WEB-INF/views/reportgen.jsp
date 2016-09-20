<%@page import="java.util.*" import="com.elitecore.services.*" import="java.io.*" import="org.jsoup.Jsoup" %>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="Css/bootstrap.css"/> 
 	<link rel="stylesheet" type="text/css" href="Css/stylesheet.css"/>
 	<script type="text/javascript" src="Js/jquery.js"></script> 
 	<script type="text/javascript" src="Js/bootstrap.js"></script>
 	<script>
 	$(document).ready(function()
	{
		$("#html_val_pdf").val($("#myDiv").html());
		$("#html_val_mail").val($("#myDiv").html());
		$("#html_val_mail").val($("#myDiv").html());
		//$("#html_val").val().removeClass().removeAttr("id");
		
	});

 	</script>
</head>
<body>
	<%	List<Map<String,Object>> list=(List<Map<String,Object>>)session.getAttribute("list");
		Map<String,Object> m=list.get(0);
	%>
	<div id="myDiv" class="col-sm-12" style="margin-top: 50px;">
		<table class="table table-bordered table-striped" id="report_table"  style="box-shadow: -3px 3px 3px gray;">
		<thead>
			<tr class="bg-primary">
				<th>#</th>
				<%
				for(Map.Entry<String, Object> entry:m.entrySet())
				{
					%>
					<th><%out.println(entry.getKey());%></th>
					<%
				}%>
			</tr>
		</thead>
		<tbody>
			<% 
			for(int i=0;i<list.size();i++)
			{
				m=list.get(i);
				%>
				<tr>
					<td><%= i+1%></td>
					<%
					for(Map.Entry<String, Object> entry:m.entrySet())
					{
						%>
						<td><%out.println(entry.getValue());%></td>
						<%
					}%>
				</tr>
				<%
			}
			%>
		</tbody>
		</table>
	</div>
	<div class="clearfix"></div><br/>
	<div class="col-sm-12">
		<div class="pull-right">
			<div class="form-group">
			<% String str=request.getRequestURL()+"?";
			Enumeration<String> paramNames = request.getParameterNames();
			while (paramNames.hasMoreElements())
			{
			    String paramName = paramNames.nextElement();
			    String[] paramValues = request.getParameterValues(paramName);
			    for (int i = 0; i < paramValues.length; i++) 
			    {
			        String paramValue = paramValues[i];
			        str=str + paramName + "=" + paramValue;
			    }
			    str=str+"&";
			}
			String s=str.substring(0,str.length()-1);  %>
			<form method="post" action="convertor.html">
				<input type="hidden" name="html_val_pdf" id="html_val_pdf"/>
				<input type="submit" id="abc" class="btn btn-danger" value="Create PDF"/>
				
			</form>
				
					<button class="btn btn-primary edit_db_row" title="Edit"
						data-toggle="modal" data-target="#edit_db_modal">
						Send mail
					</button>
				<br/>
				<a ref="save_as_excel.html">
					<button class="btn btn-success" id="save_as_excel">
						<span class="glyphicon glyphicon-list-alt"></span> Save as Excel
					</button>
				</a>
			</div>
		</div>
	</div>
	
	<div id="edit_db_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div id="head" class="col-sm-6 lr0pad">
						<h2>
							<span class="glyphicon glyphicon-list-alt"></span> Send mail
						</h2>
						<br />
					</div>
				</div>
				<div class="modal-body">
					<form  action="mailto.html"
						class="form-horizontal" role="form" method="POST">
						<div class="form-group">
							<div class="input-group col-sm-11">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-phone"></i></span>
								<input  type="text" name="mailid"
									class="form-control input-lg tip_danger_lg"
									placeholder="Enter mail" />
							</div>
								
						</div>
						<div class="form-group">
							<div class="input-group col-sm-11">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-phone"></i></span>
								<input type="text" name="name"
									class="form-control input-lg tip_danger_lg"
									placeholder="Enter filename" />
							</div>
				<input type="hidden" name="html_val_mail" id="html_val_mail"/>
				
						<button type="submit" id="submit" class="btn btn-success submit">
									<span class="glyphicon glyphicon-plus"></span>send mail
								</button>
						</div>					
					</form>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	$(document).ready(function()
	{
		$("#save_as_excel").click(function()
		{
	        var dt = new Date();
	        var day = dt.getDate();
	        var month = dt.getMonth() + 1;
	        var year = dt.getFullYear();
	        var hour = dt.getHours();
	        var mins = dt.getMinutes();
	        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
	        
			var tab_text="<table border='4px'><tr>";
		    var textRange; var j=0;
		    tab = document.getElementById("report_table"); // id of table
			
		    for(j = 0 ; j < tab.rows.length ; j++) 
		    {     
		        tab_text=tab_text+tab.rows[j].innerHTML+"</tr>";
		        //tab_text=tab_text+"</tr>";
		    }
		
		    tab_text=tab_text+"</table>";
		    tab_text= tab_text.replace(/<A[^>]*>|<\/A>/g, "");//remove if u want links in your table
		    tab_text= tab_text.replace(/<img[^>]*>/gi,""); // remove if u want images in your table
		    tab_text= tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params
		    
	    	var data_type = 'data:application/vnd.ms-excel';
	    	var a = document.createElement('a');
	    	
	    	a.href = data_type + ', ' + encodeURIComponent(tab_text);
	        a.download = 'Report_' + postfix + '.xls';
	        a.click();	        
		
		});
	});
</script>

</body>
</html>