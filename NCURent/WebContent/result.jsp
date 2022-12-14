<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*"  %>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<head>
	<meta charset="utf-8">
</head>
<body>
	<div>
		<% if(session.getAttribute("id")!= null) {%>
			您好，<%= (session.getAttribute("name")).toString()+(session.getAttribute("type")).toString() %>
			<input type ="button" class="btn btn-outline-success" onclick="javascript:location.href='../logout.jsp'" value="登出">
			<input type ="button" class="btn btn-outline-success" onclick="javascript:location.href='../deleteUser.jsp'" value="刪除帳號">
			
			<input type ="submit" class="btn btn-outline-success" onclick="javascript:location.href='../house_ver2.jsp'" value="查看詳細房屋資訊">
		<% }else{ %>
			查無使用者
		<% } %>
	</div>
</body>
</html>

<script>
	
</script>
