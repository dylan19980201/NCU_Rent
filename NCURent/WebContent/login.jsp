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
	<form action ="Login" method="post">
		使用者帳號:<input type="text" name="id">
		密碼:<input type="text" name="password">
		<input type="submit" value="登入" class="btn btn-outline-primary">
	</form>
	<input type ="button" class="btn btn-outline-success" onclick="javascript:location.href='http://localhost/NCURent/register.jsp'" value="註冊帳號"></input>
</body>
</html>