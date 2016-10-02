<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="Css/bootstrap.css"/> 
 	<link rel="stylesheet" type="text/css" href="Css/stylesheet.css"/>
 	<script type="text/javascript" src="Js/bootstrap.js"></script>
	<script type="text/javascript" src="Js/jquery.js"></script>
	<script type="text/javascript" src="Js/chart.js"></script>
	
</head>
<body>
	<%
		String[] temp = request.getParameter("y").split(",");
		int i = temp.length;
	%>
	<br/>
	<div class="col-sm-8 col-sm-offset-2">
		<select class="form-control" id="graph_type" name="graph_type" style="cursor: pointer">
			<option value="pie" selected>Pie Chart</option>
			<option value="bar">Bar Chart</option>
			<option value="line">Line Chart</option>
			<option value="radar">Radar Chart</option>
			<option value="doughnut">Doughnut Chart</option>
			<option value="polarArea">Polar Area Chart</option>
		</select>
	</div>
	<div class="clearfix"></div><hr/>
	<canvas id="myChart" width="600" height="300"></canvas>
	<script>
		var colors = ['rgba(255, 99, 132, 0.4)', 'rgba(54, 162, 235, 0.4)', 'rgba(255, 206, 86, 0.4)',
		                'rgba(75, 192, 192, 0.4)', 'rgba(153, 102, 255, 0.4)', 'rgba(255, 159, 64, 0.4)']
		var ctx = document.getElementById("myChart");
		var config = {
			    type: '<%=(String)request.getParameter("graph_type")%>',
			    data: {
			        labels: [<%=(String)request.getParameter("x")%>],
			        datasets: [{
			            label: '# of Votes',
			            data: [<%=(String)request.getParameter("y")%>],
			            backgroundColor: [
			              <% 
			              for(int p=0; p<i; p++)
			              {
			            	out.println("colors["+(p%6)+"],");
			              }
			              %>
			            ],
			            borderColor: [
						<% 
						for(int p=0; p<i; p++)
						{
							out.println("colors["+(p%6)+"],");
						}
						%> 
			            ],
			            borderWidth: 1,
			        }]
			    },
			    options: {
			        scales: {
			        	xAxes:[{
			        		barThickness: 30
			        	}],
			            yAxes: [{
			                ticks: {
			                    beginAtZero:true
			                }
			            }]
			        }
			    }
			};
		var temp = jQuery.extend(true, {}, config);
		var myChart = new Chart(ctx, temp);
	</script>
	<script type="text/javascript">
		$(document).ready(function()
		{
			$("#graph_type").change(function()
			{
				if (myChart) {
				    myChart.destroy();
				  }
				var temp = jQuery.extend(true, {}, config);
				temp.type = $(this).val();
				myChart = new Chart(ctx, temp);
			});
		});
	</script>
</body>
</html>