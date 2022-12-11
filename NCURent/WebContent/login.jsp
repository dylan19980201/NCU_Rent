<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <!-- <script src="rent.js"></script> -->
        <title>登入頁面</title>
    </head>
    <body>
        <div class="login-page">
            <div class="form">
                <form class="login-form" action ="/NCURent/Login/Login" method="post">
                    <input type="text" placeholder="username" name="id"/>
                    <input type="password" placeholder="password" name="password"/>
                    <button type="submit" value="登入" class="btn btn-outline-primary">login</button>
                </form>
                <p class="message"> <a href="registerchose.jsp">Create an account</a></p>
            </div>
        </div>
    </body>
</html>