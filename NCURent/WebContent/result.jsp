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
<<<<<<< HEAD
			<input type ="button" class="btn btn-outline-success" onclick="javascript:location.href='logout.jsp'" value="登出">
			<input type ="button" class="btn btn-outline-success" onclick="javascript:location.href='deleteUser.jsp'" value="刪除帳號">
			<input type ="button" class="btn btn-outline-success" onclick="javascript:location.href='house.jsp'" value="查看詳細房屋資訊">
=======
			<input type ="button" class="btn btn-outline-success" onclick="javascript:location.href='../logout.jsp'" value="登出">
			<input type ="button" class="btn btn-outline-success" onclick="javascript:location.href='../deleteUser.jsp'" value="刪除帳號">
>>>>>>> 95d6d8dcd15035d802c6a7665bf8ab4f5701b743
		<% }else{ %>
			查無使用者
		<% } %>
	</div>
</body>
</html>

<script>
	
</script>
