<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="java.util.*" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>中央大學預約看房網</title>
			<!-- Bootstrap CSS -->
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
				crossorigin="anonymous">
			<title>中央大學預約看房網</title>
			<link rel="stylesheet" href="style.css">
			<link rel="icon" href="https://upload.wikimedia.org/wikipedia/commons/3/3a/NCULogo.svg" type="image/gif"
				sizes="16x16">
			<script src="https://kit.fontawesome.com/b435954bf0.js" crossorigin="anonymous"></script>
		</head>

		<body>
			<jsp:include page="./header.jsp" />
			<main>

				<h3 class="text-center my-2">我的刊登</h3>
				<div>
					<div class="text-center my-2">
						<a href="#" class="text-dark p-1 btn btn-warning text-decoration-none">處理中</a>
						<a href="#" class="text-dark p-1 btn btn-warning text-decoration-none">已發布</a>
						<a href="#" class="text-dark p-1 btn btn-warning text-decoration-none">已移除</a>
					</div>
				</div>
			</main>
			<jsp:include page="./footer.jsp" />
		</body>

		</html>