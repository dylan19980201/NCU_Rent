<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/NCURent/style.css">
    <title>中央大學預約看房網</title>
<link rel="icon" href="https://upload.wikimedia.org/wikipedia/commons/3/3a/NCULogo.svg" type="image/gif" sizes="16x16">
</head>
<body>
    <div class=".register-page">
        <div class="form">
            <div>
                <label>房東註冊</label> <%if(request.getAttribute("error")!=null) {%> <%= (request.getAttribute("error")) %> <% } %>
            </div>
            <form class="register-form" action ="/NCURent/Login/Register" method="post">
                <input type="hidden" name="type" value="2" required="required"/>
                <input type="text" name="id" placeholder="帳號(請輸入3~12位英數字)" pattern="[0-9||A-z]{3,12}" required="required"/>
                <input type="password" name="password" placeholder="密碼(請輸入3~16位英數字)" pattern="[0-9||A-z]{3,16}" required="required"/>
                <input type="text" name="name" placeholder="姓名" required="required"/>
                <select class="form-select" name="gender"  style="width:100%;height:40px; margin: 0 0 15px; ;" required="required"  >
                <option value="" selected>性別</option>
                <option value="男">男</option>
                <option value="女">女</option>
                </select>
                <input type="date" name="birth" placeholder="生日" required="required"/>
                <input type="text" name="phone" placeholder="手機號碼(請輸入09XXXXXXXX)" required="required" pattern="09\d{8}"/>
                <input type="email" name="email" placeholder="Email" required="required"/>
                <button type="submit" value="註冊" class="btn btn-outline-primary">create</button>      
            </form>
            <p class="message">Already registered? <a href="login.jsp">Sign In</a></p>
        </div>
    </div>
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
</body>
</html>