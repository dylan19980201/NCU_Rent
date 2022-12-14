<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>中央大學預約租屋網</title>
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
      <section>
        <div class="table-box bg-whitesmoke">
          <h2 class="t-h-text mt-3">施佳妏</h2>
          <div class="details-table">
            <div class="table-column">
              <ul class="list-unstyled">
                <li class="row-line">學號: 111423054</li>
                <li class="row-line">性別: 女</li>
                <li class="row-line">Email: Cindy82523091@gmail.com</li>
              </ul>
            </div>
            <div class="table-column">
              <ul class="list-unstyled">
                <li class="row-line">系級: 資管碩一</li>
                <li class="row-line">生日: 1999/6/24</li>
                <li class="row-line">評價: 5.0 (2則評價)</li>
              </ul>
            </div>

      </section>
      
           <h4 class="text-center my-2">我要評論</h4>
     <div class="map bg-whitesmoke">
  <p class="text-center my-2">評分</p>
  <center><jsp:include page="./stars.jsp" /></center>
  <p class="text-center my-2">評論</p>
  <center><textarea id="content"style="resize:none;width:800px;height:100px;" ></textarea></center><br>
   <center><input type="button" value="發布"/></center><br>
     </div>
     <!--引用jQuery-->
     <script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
     <!--引用SweetAlert2.js-->
     <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.0/sweetalert2.all.js"></script>
     <script type="text/javascript">
         swal.setDefaults({
             confirmButtonText: "確定",
             cancelButtonText: "取消"
         });
  
         $(function () {
             $("input:button").click(function () {
                 swal({
                     title: "確定發布？",
                     type: "question",
                     showCancelButton: true//顯示取消按鈕
                 }).then(
                     function (result) {
                         if (result.value) {
                           swal("完成!", "評論已發布", "success");
                         } 
                         else if (result.dismiss === "cancel"){
                             swal("取消", "評論尚未發布", "error");
                         }
                     });
             });
         });
     </script><br>

  		<h4 class="text-center my-2">評價一覽</h4>
      <section>
        <div class="map bg-whitesmoke">
          <h5 class="mb-3"><a class="text-decoration-none text-dark" href="#"><u>L00001</u></a></h5>
		  <h6>⭐⭐⭐⭐⭐　　　　　　　2022/12/14 13:00:00</h6>
		  <p>Good!</p>
		  <hr>	
		   <h5 class="mb-3"><a class="text-decoration-none text-dark" href="#"><u>L00002</u></a></h5>
		  <h6>⭐⭐⭐⭐⭐　　　　　　　2022/12/13 17:34:56</h6>
		  <p>Nice!</p>
		  <hr>	
        </div>
      </section>
    </main>
    <jsp:include page="./html/footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
  </body>
	</body>
	
</html>
