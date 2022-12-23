<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="java.util.*" %>
		<!DOCTYPE html>
		<html>

		<head>
		    <%
			 	if (session.getAttribute("id")==null){
			    	String redirectURL = "/NCURent/login.jsp";
			    	response.sendRedirect(redirectURL);
			 	}
			%>
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
			<% if(session.getAttribute("id")!=null) {%><jsp:include page="./header.jsp" /><% } %>
			<main>
				<h3 class="text-center my-2">我的刊登</h3>
				<div>
					<div class="text-center my-2">
						<a id="unchecked_btn" class="text-dark p-1 btn btn-warning text-decoration-none">處理中</a>
						<a id="checked_btn" class="text-dark p-1 btn btn-warning text-decoration-none">已發布</a>
						<a id="all_btn" class="text-dark p-1 btn btn-warning text-decoration-none">全部</a>
					</div>
					<section>
						<div class="row mx-1 my-4" id="Housediv">
						</div>
					</section>
				</div>
			</main>
			<jsp:include page="./footer.jsp" />
		</body>

		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script>
			$(function () {
				var result;
				getData();
				updatePage(result, 2);
				document.querySelector('#unchecked_btn').addEventListener('click', () => updatePage(result, 0));
				document.querySelector('#checked_btn').addEventListener('click', () => updatePage(result, 1));
				document.querySelector('#all_btn').addEventListener('click', () => updatePage(result, 2));
				function getData() {
					$.ajax({
						url: '/NCURent/Post/getAllHouse',
						method: 'POST',
						dataType: 'json',
						data: "type=" + 1,
						async: false,
						success: function (res) {
							if (res.status == "success") {
								result = $.parseJSON(res.data);
							} else {
								$('.alert.alert-danger').css('display', 'block');
							}
						},
						error: function (XMLHttpRequest, textStatus, errorThrown) {
							alert("Status: " + textStatus); alert("Error: " + errorThrown);
						}
					});
				}

				function updatePage(items, type) {
					var divBody = "";
					var houseStatus = "";
					$.each(items, function (i, item) {
						if (match(item, type)) {
							houseStatus = item.AID ? "已發布" : "處理中";
							divBody += "<div class='col-sm-12 col-md-6 col-lg-4'>";
							divBody += "<div class='card'>";
							divBody += "<img src='/NCURent/upload/" + item.PictureName + "' class='card-img-top'  height='285.61' alt='...'>"
							divBody += "<div class='card-body'>";
							divBody += "<h5 class='card-title'>" + item.HAddress + "</h5>";
							divBody += "<p class='card-text'>房東：" + item.LName + "<br>房屋坪數：" + item.Size + "<br>房屋租金：" + item.Rent + "/月<br>房屋設備：" + item.Equipment + "<br>屋齡:" + item.HYear + "<br>其他備註：" + item.GenderSpecific + "<br>刊登狀態：" + houseStatus + "</p>"
							divBody += "</div>";
							divBody += "</div>";
							divBody += "</div>";
						}
					});
					$("#Housediv").html(divBody);
				}

				function match(item, type) {
					if (type == 0) {
						if (!item.AID) return true;
						return false;
					} else if (type == 1) {
						if (item.AID) return true;
						return false;
					} else {
						return true;
					}
				}
			});
		</script>

		</html>