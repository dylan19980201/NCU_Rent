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
		房屋地址<input type="text" name="HAdress" >
		房屋地址<input type="text" name="HAdress" >
		房屋地址<input type="text" name="HAdress" >
		房屋地址<input type="text" name="HAdress" >
		房屋地址<input type="text" name="HAdress" >
		HYear, Rent, Size, Equipment, GenderSpecific
		地址<input type="text" name="birth" value = "test">
		
		<input type="submit" value="註冊" class="btn btn-outline-primary">
	</form>
	<input type ="button" class="btn btn-outline-success" onclick="javascript:location.href='register.jsp'" value="註冊帳號"></input>
</body>
</html>