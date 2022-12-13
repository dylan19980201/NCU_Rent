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
	<form  action ='/NCURent/Post/GetHouseData' method="post">
		<div>
			地址<%= (request.getAttribute("HAddress")) %>
			屋齡<%= (request.getAttribute("HYear")) %>
			性別限制<%= (request.getAttribute("GenderSpecific")) %>
			租金<%= (request.getAttribute("Rent")) %>
			坪數<%= (request.getAttribute("Size")) %>
			設備<%= (request.getAttribute("Equipment")) %>
			房屋編號<%= (request.getAttribute("HID")) %>
			房東編號<%= (request.getAttribute("LID")) %>
			照片名稱<%= (request.getAttribute("PictureName")) %>
			刊登日期<%= (request.getAttribute("PostDateTime")) %>
		</div>
	</form>
</body>
</html>