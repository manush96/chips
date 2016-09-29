<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<script type="text/javascript" src="Js/chart.js"></script>
</head>
<body>
	<%
		String[] temp = request.getParameter("y").split(",");
		int i = temp.length;
	%>
	<canvas id="myChart" width="600" height="300"></canvas>
	<script>
		var colors = ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)']
		var ctx = document.getElementById("myChart");
		var myChart = new Chart(ctx, {
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
		});
	</script>
</body>
</html>