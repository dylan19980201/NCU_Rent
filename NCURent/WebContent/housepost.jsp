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
      <p align="left" style="font-size:20px;font-weight:bold;">地址：</p>
      <input type="text" name="HAddress" id="HAddress" required="required">
   
     
      <p align="left" style="font-size:20px;font-weight:bold;">租金：</p>
      <input type="text" name="Rent" id="Rent" required="required">
      <p align="left" style="font-size:20px;font-weight:bold;">坪數：</p>
      <input type="text" name="Size" id="Size" >
      <p align="left" style="font-size:20px;font-weight:bold;">屋齡：</p>
      <input type="text" name="HYear" id="HYear" >
      <p align="left" style="font-size:20px;font-weight:bold;">性別限制：</p>
      <select class="form-select" name="GenderSpecific" id="GenderSpecific" style="width:100%;height:40px; margin: 0 0 15px; ;" required="required"  >
        <option selected></option>
        <option value="男">男</option>
        <option value="女">女</option>
        <option value="無">無</option>
        </select>
       <p align="left" style="font-size:20px;font-weight:bold;">設備：</p>
      <input type="text" name="Equipment"  id="Equipment" >
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
      <div class="mx-auto">
          <button type="submit" class="btn btn-outline-primary" >請求刊登</button>
      </div>
     
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
