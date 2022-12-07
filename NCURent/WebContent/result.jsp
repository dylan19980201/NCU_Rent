<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*"  %>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<head>
	<meta charset="utf-8">
	<title>Insert title here</title>
</head>
<body>
	<div>
		<% if(session.getAttribute("id")!= null) {%>
			您好，<%= (session.getAttribute("name")).toString() %>
			<input type ="button" class="btn btn-outline-success" onclick="javascript:location.href='logout.jsp'" value="登出">
		<% }else{ %>
			查無使用者
		<% } %>
	</div>
</body>
</html>

<script>
	
</script>
