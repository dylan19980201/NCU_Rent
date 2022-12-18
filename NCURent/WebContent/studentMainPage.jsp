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
      <section>
        <div class="table-box bg-whitesmoke">
          <h2 class="t-h-text mt-3"><label id="name"></label></h2>
          <div class="details-table">
            <div class="table-column">
              <ul class="list-unstyled">
                <li class="row-line">學號: <label id="sid"></label></li>
                <li class="row-line">性別: <label id="gender"></label></li>
                <li class="row-line">Email: <label id="email"></label></li>
              </ul>
            </div>
            <div class="table-column">
              <ul class="list-unstyled">
                <li class="row-line">系級: <label id="department"></label></li>
                <li class="row-line">生日: <label id="birth"></label></li>
                <li class="row-line">評價: <label id="star"></label>(<label id="amount"></label>則評論)</li>
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
  		<h5>留言:<label id='RsContent'></label><h5>
      <section>
        <div class="map bg-whitesmoke" id="studentCommentTable">
        </div>
      </section>
    </main>
    <jsp:include page="./html/footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
  </body>
	</body>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
	$(document).ready(function(){  
    	var getUrlString = location.href;
    	var url = new URL(getUrlString);
    	var id = url.searchParams.get('id'); 
    	$.ajax({
            url: '/NCURent/Post/GetStudentReview',
            method: 'post',
            dataType: 'json',
            data: {SID : id},
            success: function(res){
                if(res.status == "success"){
                	var reviewData = $.parseJSON(res.data.studentReviewData);
                	var studentData = $.parseJSON(res.data.studentData);
                	$("#name").text(studentData.name);
                	$("#sid").text(studentData.ID);
                	$("#department").text(studentData.department);
                	$("#gender").text(studentData.gender);
                	$("#birth").text(studentData.birth);
                	$("#email").text(studentData.email);
                	$("#star").text(studentData.star ? studentData.star : "尚未評價");
                	$("#amount").text(studentData.amount ? studentData.amount : "0");
                	var divBody="";
                	$.each(reviewData, function(i,n){
                		divBody += "<h5 class='mb-3'><a class='text-decoration-none text-dark'><u>"+n.LID+"</u></a></h5>";
                		divBody += "<h5>";
                		for(let i=0; i < n.RsStar; i++){
                			divBody += "⭐";
                		}
                		divBody += "</h5>";
                		divBody += "<p>"+n.RsContent+"</p>";
                		divBody += "<h5><div style='text-align:right;font-size:15px;margin:0px 10px 0px 0px;color:grey;'><I>"+n.RsDateTime+"</I></div></h5>"
                		divBody += "<hr>"
                	});
                	$("#studentCommentTable").append(divBody);
                }else{
                    $('.alert.alert-danger').css('display','block')
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) { 
                alert("Status: " + textStatus); alert("Error: " + errorThrown); 
            } 
        });
     });
	</script>
</html>
