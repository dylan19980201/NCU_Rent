<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="house.css">
<link href="/NCURent/html/style.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<title>中央大學預約看房網</title>
<link rel="icon" href="https://upload.wikimedia.org/wikipedia/commons/3/3a/NCULogo.svg" type="image/gif" sizes="16x16">
<div class="wrapper">

  
</head>
 <header>
        <nav class="nav-top bg-red p-2 d-md-flex align-items-center">
            <div class="d-flex justify-content-center ps-md-2">
                <a href="#"><img class="logo" src="https://upload.wikimedia.org/wikipedia/commons/3/3a/NCULogo.svg" alt=""></a>
                <h1 class="fs-4"><a class="text-decoration-none text-white" href="/NCURent/html/index.jsp">中央大學預約看房網</a>
                </h1>
            </div>
            <div>
                <ul class="nav-link d-flex justify-content-center list-unstyled pt-3">
                    <li>
                        <a class="text-white text-decoration-none d-flex pe-4" href="#"><i
                                class="pe-1 mt-1 fas fa-search"></i><span class="nav-name d-none d-md-block">
                                <center>瀏覽房屋</center>
                            </span></a>
                    </li>
                    <% if((session.getAttribute("type")).equals("student")) {%>
                        <li>
                            <a class="text-white text-decoration-none d-flex pe-4" href="#"><i
                                    class="pe-1 mt-1 fas fa-upload"></i><span
                                    class="nav-name d-none d-md-block">刊登房東與房屋評價</span></a>
                        </li>
                        <li>
                            <a class="text-white text-decoration-none d-flex pe-4" href="#">
                            <form  action ='/NCURent/Post/GetStudentReview' method="post"><i
                                    class="pe-1 mt-1 fas fa-eye"></i><span
                                    class="nav-name d-none d-md-block">查看學生評價</span></a>
                                    <input type ="submit" class="btn btn-outline-success" onclick="javascript:location.href='../studentMainPage.jsp'" value="查看學生評價">
                        </li>
                        <li>
                            <a class="text-white text-decoration-none d-flex pe-4" href="/NCURent/html/sreservestate.jsp"><i
                                    class="pe-1 mt-1 fas fa-calendar-check"></i><span
                                    class="nav-name d-none d-md-block">查看預約資訊</span></a>
                        </li>
                                                <li>
                            <a class="text-white text-decoration-none d-flex pe-4" href="/NCURent/studentMainPage.jsp"><i
                                    class="pe-1 mt-1 fas fa-user"></i><span
                                    class="nav-name d-none d-md-block">我的帳戶</span></a>
                        </li>
                    <% } else if((session.getAttribute("type")).equals("landlord")) { %>
                        <li>
                            <a class="text-white text-decoration-none d-flex pe-4" href="/NCURent/housepost.jsp"><i
                                    class="pe-1 mt-1 fas fa-file-upload"></i><span
                                    class="nav-name d-none d-md-block">刊登房屋</span></a>
                            </li>
                        <li>
                        <li>
                            <a class="text-white text-decoration-none d-flex pe-4" href="#"><i
                                    class="pe-1 mt-1 fas fa-upload"></i><span
                                    class="nav-name d-none d-md-block">刊登學生評價</span></a>
                            </li>
                        <li>
                            <a class="text-white text-decoration-none d-flex pe-4" href="#"><i
                                    class="pe-1 mt-1 fas fa-eye"></i><span
                                    class="nav-name d-none d-md-block">查看房東與房屋評價</span></a>
                        </li>
                        <li>
                            <a class="text-white text-decoration-none d-flex pe-4" href="/NCURent/html/lreservestate.jsp"><i
                                    class="pe-1 mt-1 fas fa-calendar-check"></i><span
                                    class="nav-name d-none d-md-block">查看預約資訊</span></a>
                        </li>
                                                
                    <% } else { %>
                        <li>
                            <a class="text-white text-decoration-none d-flex pe-4" href="#"><i
                                    class="pe-1 mt-1 fas fa-eye"></i><span
                                    class="nav-name d-none d-md-block">查看學生評價</span></a>
                        </li>
                        <li>
                            <a class="text-white text-decoration-none d-flex pe-4" href="#"><i
                                    class="pe-1 mt-1 far fa-eye"></i><span
                                    class="nav-name d-none d-md-block">查看房東與房屋評價</span></a>
                        </li>
                        <li>
                            <a class="text-white text-decoration-none d-flex pe-4" href="/NCURent/html/results.jsp"><i
                                    class="pe-1 mt-1 fas fa-check"></i><span
                                    class="nav-name d-none d-md-block">審查刊登</span></a>
                            </li>
                        <li>
                            <a class="text-white text-decoration-none d-flex pe-4" href="#"><i
                                    class="pe-1 mt-1 fas fa-user-check"></i><span
                                    class="nav-name d-none d-md-block">管理會員帳號</span></a>
                            </li>
                    <% } %>
                        <li>
                            <a class="text-white text-decoration-none d-flex pe-4"
                                    href="/NCURent/logout.jsp"><i class="pe-1 mt-1 fas fa-sign-out-alt"></i><span
                                    class="nav-name d-none d-md-block">
                                    <center>登出</center>
                            </span></a>
                        </li>
                </ul>
            </div>
        </nav>
    </header>
<body>
    
    <div class="form"  action="/NCURent/Post/Add" method="post" enctype="multipart/form-data">
      <p align="left" style="font-size:20px;font-weight:bold;">上傳照片：</P>
      <input type="file" name="file" multiple="multipart" id="pic" />
      <img />
      <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
      <script>
        $('input').on('change', function(e){      
          const file = this.files[0];
          const objectURL = URL.createObjectURL(file);
          $('img').attr('src', objectURL);
        });
      </script>
      <input type="text" name="HAdress"placeholder="地址:">
   
      <input type="text" name="Rent"placeholder="租金：">
      <input type="text" name="Size"placeholder="坪數：">
      <input type="text" name="Hyear"placeholder="屋齡：">
      
      <input type="text" name="address"placeholder="備註：">
      <button type="submit" class="btn btn-outline-primary">請求刊登</button>
    </div>
</body>
