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
	<form method="post" action="/NCURent/Post/AddPost" enctype="multipart/form-data">
		房屋地址:<input type="text" name="HAddress" >
		屋齡:<input type="text" name="HYear" >
		租金:<input type="text" name="Rent" >
		坪數:<input type="text" name="Size" >
		設備:<input type="text" name="Equipment" >
		性別限制:<input type="text" name="GenderSpecific" >
	    <input type="file" name="file" />
	    <input type="submit" value="請求刊登" class="btn btn-outline-primary">
	    <img src="upload/house2.jpg">
  	</form>
</body>


<script>

</script>


</html>
