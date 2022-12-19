<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*"  %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="/NCURent/style.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <title>中央大學預約看房網</title>
        <link rel="icon" href="https://upload.wikimedia.org/wikipedia/commons/3/3a/NCULogo.svg" type="image/gif" sizes="16x16">
    </head>
    <body>
        <div class="login-page">
            <div class="form">
                <p><%if(request.getAttribute("error")!=null) {%> <%= (request.getAttribute("error")) %> <% } %></p>
                <label>登入</label> 
                <form class="login-form" action="/NCURent/Login/Login" method="post">
                	<div class="alert alert-danger" role="alert" style="display:none">
  						登入失敗!!
					</div>
                    <input type="text" placeholder="帳號(請輸入3~12位英數字)" pattern="[0-9||A-z]{3,12}"  name="id" pattern="[0-9A-z]{4,12}"/>
                    <input type="password" placeholder="密碼(請輸入3~16位英數字)" pattern="[0-9||A-z]{3,16}" name="password"/>
                    <button type="submit" value="登入" class="btn btn-outline-primary">login</button>
                </form>
                <p class="message"> <a href="/NCURent/registerchose.jsp">Create an account</a></p>
            </div>
        </div>
    </body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
	 $('form').on('submit', function(){
            $('input[type="submit"]').text('傳送中......');
            $.ajax({
                url: '/NCURent/Login/Login',
                method: 'POST',
                dataType: 'json',
                data: $('form').serialize(),
                success: function(res){
                    if(res.status == "success"){
                        location.href=res.page;
                    }else{
                        $('.alert.alert-danger').css('display','block')
                    }
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) { 
                    alert("Status: " + textStatus); alert("Error: " + errorThrown); 
                } 
            });
            return false;
        });
  </script>
</html>