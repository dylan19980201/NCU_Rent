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
                <label>學生註冊</label> <%if(request.getAttribute("error")!=null) {%> <%= (request.getAttribute("error")) %> <% } %>
            </div>
            <form class="register-form">
                <input type="hidden" name="type" value="1" required="required"/>
                <input type="text" name="id" placeholder="帳號" required="required"/>
                <input type="password" name="password" placeholder="密碼" required="required"/>
                <input type="text" name="name" placeholder="姓名" required="required"/>
                <input type="text" name="gender" placeholder="性別" required="required"/>
                <input type="date" name="birth" placeholder="生日" required="required"/>   
                <input type="text" name="phone" placeholder="手機號碼(請輸入09XXXXXXXX)" required="required" pattern="09\d{8}"/>   
                <input type="text" name="department" placeholder="系級" required="required"/>       
                <input type="text" name="email" placeholder="Email" required="required"/>
                <button type="submit" class="btn btn-outline-primary">create</button>
            </form>
            <p class="message">Already registered? <a href="login.jsp">Sign In</a></p>
        </div>

    </div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
	 $('form').on('submit', function(){
            $('input[type="submit"]').text('傳送中......');
            $.ajax({
                url: '/NCURent/Login/Register',
                method: 'POST',
                dataType: 'json',
                data: $('form').serialize(),
                success: function(res){
                    if(res.status == "success"){
                    	alert(res.message)
                        location.href=res.page;
                    }else{
                        alert(res.message)
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