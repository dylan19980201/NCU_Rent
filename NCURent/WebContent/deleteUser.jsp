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
	<div>
		<div>
			<label>刪除帳號</label> <%if(request.getAttribute("error")!=null) {%> <%= (request.getAttribute("error")) %> <% } %>
		</div>
		<form action ="/NCURent/Login/DeleteUser" method="post">
			使用者帳號:<input type="text" name="id">
			密碼:<input type="text" name="password">
			<input type="submit" value="刪除帳號" class="btn btn-outline-primary">
		</form>
	</div>
</body>
</html>

<script>
	
</script>
