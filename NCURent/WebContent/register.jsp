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
	
	<form action ="Register" method="post">
		<div name = "type" value = "1">
			學生註冊 <%if(request.getAttribute("error")!=null) {%> <%= (request.getAttribute("error")) %> <% } %>
		</div>
		帳號:<input type="text" name="id" value = "test1">
		密碼:<input type="text" name="password" value = "test">
		姓名:<input type="text" name="name" value = "test">
		生日:<input type="text" name="birth" value = "test">
		性別:<input type="text" name="gender" value = "test">
		系所:<input type="text" name="department" value = "test">
		手機:<input type="text" name="phone" value = "test">
		信箱:<input type="text" name="email" value = "test">
		<input type="submit" value="註冊" class="btn btn-outline-primary">
	</form>
</body>
</html>