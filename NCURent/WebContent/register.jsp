<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*"  %>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<head>
	<meta charset="utf-8">
	<title>中央大學預約看房網</title>
<link rel="icon" href="https://upload.wikimedia.org/wikipedia/commons/3/3a/NCULogo.svg" type="image/gif" sizes="16x16">
</head>
<body>
	
	<form action ="/NCURent/Login/Register" method="post">
		<div>
			<label>學生註冊</label> <%if(request.getAttribute("error")!=null) {%> <%= (request.getAttribute("error")) %> <% } %>
			<input type="text" name="type" value = "1">
		</div>
		帳號:<input type="text" name="id" value = "test1">
		密碼:<input type="text" name="password" value = "test">
		姓名:<input type="text" name="name" value = "test">
		生日:<input type="text" name="birth" value = "2000-01-01">
		性別:<input type="text" name="gender" value = "男">
		系所:<input type="text" name="department" value = "test">
		手機:<input type="text" name="phone" value = "test">
		信箱:<input type="text" name="email" value = "test">
		<input type="submit" value="註冊" class="btn btn-outline-primary">
	</form>
</body>
</html>