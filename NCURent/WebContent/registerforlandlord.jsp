<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/NCURent/style.css">
    <title>註冊</title>
</head>
<body>
    <div class=".register-page">
        <div class="form">
            <div>
                <label>房東註冊</label> <%if(request.getAttribute("error")!=null) {%> <%= (request.getAttribute("error")) %> <% } %>
            </div>
            <form class="register-form" action ="/NCURent/Login/Register" method="post">
                <input type="hidden" name="type" value="2" />
                <input type="text" name="id" placeholder="帳號"/>
                <input type="password" name="password" placeholder="密碼"/>
                <input type="text" name="name" placeholder="姓名"/>
                <input type="text" name="gender" placeholder="性別"/>
                <input type="text" name="birth" placeholder="生日"/>
                <input type="text" name="phone" placeholder="手機號碼"/>
                <input type="text" name="email" placeholder="Email"/>
                <button type="submit" value="註冊" class="btn btn-outline-primary">create</button>      
            </form>
            <p class="message">Already registered? <a href="login.jsp">Sign In</a></p>
        </div>
    </div>
</body>