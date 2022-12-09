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
	 <form name="homePost" enctype="multipart/form-data" method="post" action="/strutsapp/upload.do">
	    <input type="file" name="file"> <br>
	    <input type="submit"value="送出">
 	</form>
	<button type="submit" class="btn btn-outline-primary">Submit</button>
</body>


<script>

</script>


</html>
