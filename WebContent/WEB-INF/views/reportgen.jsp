<%@page import="java.util.*" %>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="Css/bootstrap.css"/> 
 	<link rel="stylesheet" type="text/css" href="Css/stylesheet.css"/>
 	<script type="text/javascript" src="Js/jquery.js"></script> 
 	<script type="text/javascript" src="Js/bootstrap.js"></script>
</head>
<body>
	<%
		List<Map<String,Object>> list=(List<Map<String,Object>>)session.getAttribute("list");
		Map<String,Object> m=list.get(0);
	%>
	<div id="myDiv" class="col-sm-12" style="margin-top: 50px;">
		<table class="table table-bordered table-striped" id="report_table" align="center" style="box-shadow: -3px 3px 3px gray;">
		<thead>
			<tr class="bg-primary">
				<th><center>#</center></th>
				<%
				for(Map.Entry<String, Object> entry:m.entrySet())
				{
					%>
					<th><center><%out.println(entry.getKey());%></center></th>
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
					<td><center><%= i+1%></center></td>
					<%
					for(Map.Entry<String, Object> entry:m.entrySet())
					{
						%>
						<td><center><%out.println(entry.getValue());%></center></td>
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
				<a href="http://www.web2pdfconvert.com/convert">
				<button class="btn btn-danger">
					<span class="glyphicon glyphicon-download-alt"></span> Save as PDF
				</button>
				</a>
				<a ref="save_as_excel.html">
					<button class="btn btn-success" id="save_as_excel">
						<span class="glyphicon glyphicon-list-alt"></span> Save as Excel
					</button>
				</a>
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