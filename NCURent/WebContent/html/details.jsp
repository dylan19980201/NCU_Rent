<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <%@ page import="java.util.*" %>

    <!doctype html>
    <html lang="en">

    <head>
      <!-- Required meta tags -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">

      <!-- Bootstrap CSS -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
      <title>中央大學預約看房網</title>
      <link rel="stylesheet" href="style.css">
      <link rel="icon" href="https://upload.wikimedia.org/wikipedia/commons/3/3a/NCULogo.svg" type="image/gif" sizes="16x16">
      <script src="https://kit.fontawesome.com/b435954bf0.js" crossorigin="anonymous"></script>
    </head>

    <body>
      <jsp:include page="./header.jsp" />
      <main>
        <section>
          <div class="table-box bg-whitesmoke">
            <h2 class="t-h-text mt-3">房屋細節</h2>
            <div class="details-table">
              <img src="" Width="500" height="485" id="housePicture">
              <div class="table-column">
                <ul class="list-unstyled">
                  <li class="row-line">
                    <h5>房屋地址:<label id='HAddress'></label><h5>
                  </li>
                  <li class="row-line">
                    <h5>房東:<label id='LName'></label><h5>
                  </li>
                  <li class="row-line">
                    <h5>房屋租金(每月):<label id='Rent'></label><h5>
                  </li>
                  <li class="row-line">
                    <h5>房屋坪數：<label id='Size'></label><h5>
                  </li>
                  <li class="row-line">
                    <h5>房屋年齡:<label id='HYear'></label><h5>
                  </li>
                  <li class="row-line">
                    <h5>設備:<label id='Equipment'></label><h5>
                  </li>
                  <li class="row-line">
                    <h5>男/女限制:<label id='GenderSpecific'></label><h5>
                  </li>
                  <li class="row-line">
                    <h5>刊登時間:<label id='PostDatetime'></label><h5>
                  </li>
                </ul>
                <% if((session.getAttribute("type")).equals("student")) {%>
                <p class="apply-btn"><a class="bg-primary p-2 px-4 text-white text-decoration-none" id="reservebutton">預約看房</a></p>
                <% }%>
              </div>
            </div>
          </div>
        </section>
              </section>
           <h4 class="text-center my-2">我要評論</h4>
           
     <div class="map bg-whitesmoke">
  <form  id="commentForm">
  <p class="text-center my-2">評分</p>
  <center><jsp:include page="../stars.jsp" /></center>
  <p class="text-center my-2">評論</p>
  <center><textarea name="RlContent" style="resize:none;width:800px;height:100px;" ></textarea></center><br>
   <center><input type="submit" value="發布"/></center><br>
   </form>
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
	        <div class="map bg-whitesmoke" id="houseReview">	
	        </div>
	      </section>
        
      </main>
      
      <jsp:include page="./footer.jsp" />
    </body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
    $(document).ready(function(){  
    	loadfunction();
     });
    $('form').on('submit', function(){
		let getUrlString = location.href;
    	let url = new URL(getUrlString);
    	let id = url.searchParams.get('id');
    	let star = $("#starAmount").text();
        $.ajax({
            url: '/NCURent/Post/AddHouseReview',
            method: 'POST',
            dataType: 'json',
            data: $('form').serialize() + "&HID="+id+"&RlhStar="+star,
            success: function(res){
                if(res.status == "success"){
                	$('#commentForm').trigger("reset");
                    loadfunction();
                }else{
                    $('.alert.alert-danger').css('display','block')
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) { 
                alert("Status: " + textStatus); alert("Error: " + errorThrown); 
            } 
        });
        return false;
    });
	function loadfunction(){
		var getUrlString = location.href;
    	var url = new URL(getUrlString);
    	var id = url.searchParams.get('id'); 
    	$.ajax({
            url: '/NCURent/Post/GetHouseData',
            method: 'post',
            dataType: 'json',
            data: {HID : id},
            success: function(res){
                if(res.status == "success"){
                	var typeData = $.parseJSON(res.data.houseData);
                	var reviewData = $.parseJSON(res.data.houseReviewData);
               		$("#housePicture").attr("src","/NCURent/upload/"+typeData.pictureName);
                	$('#HAddress').text(typeData.HAddress);
                	$('#LName').text(typeData.LName);
                	$('#Rent').text(typeData.rent);
                	$('#Size').text(typeData.size);
                	$('#HYear').text(typeData.HYear);
                	$('#Equipment').text(typeData.equipment);
                	$('#GenderSpecific').text(typeData.genderSpecific);
                	$('#PostDatetime').text(typeData.postDateTime);
                	$('#reservebutton').attr('href', "./reserve.jsp?id="+id)
                	var divBody="";
                	$("#houseReview").empty();
                	$.each(reviewData, function(i,n){
                		divBody += "<h5 class='mb-3'><a class='text-decoration-none text-dark' href='../studentMainPage.jsp?id="+n.SID+"'><u>"+n.SID+"</u></a></h5>";
                		divBody += "<h5>";
                		for(let i=0; i < n.RlhStar; i++){
                			divBody += "⭐";
                		}
                		divBody += "</h5>";
                		divBody += "<p>"+n.RlContent+"</p>";
                		divBody += "<h5><div style='text-align:right;font-size:15px;margin:0px 10px 0px 0px;color:grey;'><I>"+n.RlhDatetime+"</I></div></h5>";
                		<% if (session.getAttribute("type").equals("administrator")) { %> divBody += "<button type='submit' id='"+n.RlhID+"' class='btn btn-primary deleteBtn' onclick=initDeleteBtn(this)>刪除</button>"<% } %>
                		divBody += "<hr>"
                	});
                	$("#houseReview").append(divBody);
                }else{
                    $('.alert.alert-danger').css('display','block')
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) { 
                alert("Status: " + textStatus); alert("Error: " + errorThrown); 
            } 
        });
	}
	function initDeleteBtn(e){
		$.ajax({
	          url: '/NCURent/Post/DeleteHouseReview',
	          method: 'POST',
	          dataType: 'json',
	          data: { RlhID : e.id},
	          async: false,
	          success: function (res) {
	            if (res.status == "success") {
	            	loadfunction();
	            } else {
	              $('.alert.alert-danger').css('display', 'block');
	            }
	          },
	          error: function (XMLHttpRequest, textStatus, errorThrown) {
	            alert("Status: " + textStatus); alert("Error: " + errorThrown);
	          }
	     });
	}
	</script>
    </html>