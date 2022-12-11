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
                <form class="login-form" action ="/NCURent/Login/Login" method="post">
                    <input type="text" placeholder="username" name="id"/>
                    <input type="password" placeholder="password" name="password"/>
                    <button type="submit" value="登入" class="btn btn-outline-primary">login</button>
                </form>
                <p class="message"> <a href="/NCURent/registerchose.jsp">Create an account</a></p>
            </div>
        </div>
    </body>
</html>