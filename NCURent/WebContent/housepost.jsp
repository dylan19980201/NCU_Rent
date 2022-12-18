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
  
<body>
    <jsp:include page="./html/header.jsp" />
    <form class="form" enctype="multipart/form-data">
      <input type="text" name="HAddress" id="HAddress" placeholder="地址:">
   
      <input type="text" name="Rent" id="Rent" placeholder="租金：">
      <input type="text" name="Size" id="Size" placeholder="坪數：">
      <input type="text" name="HYear" id="HYear" placeholder="屋齡：">
      <input type="text" name="GenderSpecific" id="GenderSpecific" placeholder="性別限制:男/女/無">
      <input type="text" name="Equipment"  id="Equipment" placeholder="設備：">
      <p align="left" style="font-size:20px;font-weight:bold;">上傳照片：</p>
      <input type="file" name="file" id="file"/>
      <p align="center"><img style='display:none'/></p>
      <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
      <script>
        $('input').on('change', function(e){      
          const file = this.files[0];
          const objectURL = URL.createObjectURL(file);
          $('img').attr('style','display:inline')
          $('img').attr('src', objectURL);
        });
      </script>
      <button type="submit" class="btn btn-outline-primary">請求刊登</button>
    </form>
</body>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
	 $('form').on('submit', function(){
            $('input[type="submit"]').text('傳送中......');
            $.ajax({
                url: '/NCURent/Post/AddPost',
                method: 'POST',
                dataType: 'json',
                contentType: false, //required
                processData: false, // required
                mimeType: 'multipart/form-data',
                data: new FormData(this),
                success: function(res){
                    if(res.status == "success"){
                    	$("#HAddress").val('');
                        $("#Rent").val('');
                        $("#Size").val('');
                        $("#HYear").val('');
                        $("#GenderSpecific").val('');
                        $("#Equipment").val('');
                        $("#file").val('');
                        $('img').attr('style',"display:none")
                        alert(res.message)
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
