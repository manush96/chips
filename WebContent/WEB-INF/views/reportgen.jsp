<%@page import="java.util.*" %>
<%

	List<Map<String,Object>> list=(List<Map<String,Object>>)session.getAttribute("list");
	
	boolean first=true;
	%>
	<table border="1" cellspacing="1" cellpadding="4" width="600" align="center">
	<% 
	for(int i=0;i<list.size();i++)
	{
		
		if(first)//will print column names
		{
			first=false;
			Map<String,Object> m=list.get(i);
			%>
			<tr bgcolor="skyblue">
			<%
			for(Map.Entry<String, Object> entry:m.entrySet())
			{
				%>
				<th><center><%out.println(entry.getKey());%></center></th>
				<%
			}%>
			</tr>
			<% 			
		}		
		if(!first)
		{	
			Map<String,Object> m=list.get(i);
			%>
			<tr>
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
	}
	%>
	</table>
	<%
%>