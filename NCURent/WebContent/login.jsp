<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*"  %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="/NCURent/style.css">
        <title>登入頁面</title>
    </head>
    <body>
        <div class="login-page">
            <div class="form">
                <p><%if(request.getAttribute("error")!=null) {%> <%= (request.getAttribute("error")) %> <% } %></p>
                <label>登入</label> 
                <form class="login-form" action="/NCURent/Login/Login" method="post">
                    <input type="text" placeholder="username" name="id"/>
                    <input type="password" placeholder="password" name="password"/>
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
                	console.log(res);
                    if(res.message == "success"){
                        alert("成功");
                        location.href=res.page;
                    }else{
                        alert('登入失敗');
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