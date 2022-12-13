<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="house.css">
<title>刊登</title>
<div class="wrapper">

  
</head>
<body>
    <jsp:include page= "/html/header.jsp" />
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
      <input type="text" name="Landlord"placeholder="房東：">
      <input type="text" name="Rent"placeholder="租金：">
      <input type="text" name="Size"placeholder="坪數：">
      <input type="text" name="Hyear"placeholder="屋齡：">
      <input type="text" name="address"placeholder="電費：">
      <input type="text" name="address"placeholder="水費：">
      <input type="text" name="address"placeholder="有無陽台：">
      <input type="text" name="address"placeholder="備註：">
      <button type="submit" class="btn btn-outline-primary">請求刊登</button>
    </div>
</body>
