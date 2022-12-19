<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>中央大學預約看房網</title>
		    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <title>中央大學預約看房網</title>
    <link rel="stylesheet" href="style.css">
    <link rel="icon" href="https://upload.wikimedia.org/wikipedia/commons/3/3a/NCULogo.svg" type="image/gif" sizes="16x16">
    <script src="https://kit.fontawesome.com/b435954bf0.js" crossorigin="anonymous"></script>
	</head>
	<body>
		 <jsp:include page="./html/header.jsp" />
      <main>

  		<h3 class="text-center my-2">所有評價</h3>
  		 <div>
  		  <div class="apply-btn">
              <a href="#" class="text-dark p-1 btn btn-warning text-decoration-none">房東與房屋評價</a>
              <a href="#" class="text-dark p-1 btn btn-warning text-decoration-none">學生評價</a>
          </div>
              <br>
              <br>              
          </div>
      <section>
        <div class="map bg-whitesmoke">
          <h5 class="mb-3"><a class="text-decoration-none text-dark" href="#"><u>L00001</u></a></h5>
		  <h6>⭐⭐⭐⭐⭐　　　　　　　2天前</h6>
		  <p>Good!</p>
		  <form  method="post" action ='/NCURent/Post/DeleteStudentReview' >
          <p class="apply-btn">
          <input  type ="submit" class="nav-name d-none d-md-block" value = "刪除" href="/NCURent/checkReview.jsp""></p>
          </form>
		  <hr>	
		   <h5 class="mb-3"><a class="text-decoration-none text-dark" href="#"><u>L00002</u></a></h5>
		  <h6>⭐⭐⭐⭐⭐　　　　　　　3天前</h6>
		  <p>Nice!</p>
		  <form  method="post" action ='/NCURent/Post/DeleteHouseReview' >
		   <p class="apply-btn"><input type ="submit" value = "刪除房屋評論" class="bg-primary p-1 px-3 text-white text-decoration-none" href="#"></p>
		   </form>
		  <hr>	
        </div>
      </section>
    </main>
    <jsp:include page="./html/footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
  </body>
	</body>
	
</html>
