<%@page import="java.util.*" %>
<%

List<Map<String,Object>> list=(List<Map<String,Object>>)session.getAttribute("list");
for(int i=0;i<list.size();i++)
{
	Map<String,Object> m=list.get(i);
	for(Map.Entry<String, Object> entry:m.entrySet()){
		out.println(entry.getKey());%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%
		out.print(entry.getValue());%><br/><%
	}
}
%>