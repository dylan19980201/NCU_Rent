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
      <title>House to rent</title>
      <link rel="stylesheet" href="/NCURent/html/style.css">
      <link rel="icon" href="./images/favicon.png" type="image/gif" sizes="16x16">
      <script src="https://kit.fontawesome.com/b435954bf0.js" crossorigin="anonymous"></script>
    </head>

    <body>
      <jsp:include page="./header.jsp" />
      <main>
        </div>
        <!-- ........search results......... -->
        <form>
        <input type ="submit" value="查看詳細房屋資訊">
        <section>
          <div class="row mx-1 my-4" id="Housediv">
          <!-- 
            <div class="col-sm-12 col-md-6 col-lg-4">
              <div class="card">
                <img src="./images/card-img4.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">桃園市中壢區中央路100號</h5>
                  <p class="card-text">房東：柯小哲<br>房屋坪數：7坪<br>房屋租金：5000/月<br>房屋設備：單人床/熱水器/冷氣<br>屋齡：12年<br>其他備註：無</p>
                  <a href="../html/details.jsp" class="btn btn-primary">瀏覽</a>
                </div>
              </div>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-4">
              <div class="card">
                <img src="./images/card-img4.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">桃園市中壢區中央路152號</h5>
                  <p class="card-text">房東：蔣小安<br>房屋坪數：6.5坪<br>房屋租金：4800/月<br>房屋設備：單人床/熱水器/冷氣/冰箱<br>屋齡：9年<br>其他備註：無</p>
                  <a href="../html/details.jsp" class="btn btn-primary">瀏覽</a>
                </div>
              </div>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-4">
              <div class="card">
                <img src="./images/card-img4.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">桃園市中壢區中央路212號</h5>
                  <p class="card-text">房東：王小明<br>房屋坪數：6.5坪<br>房屋租金：4800/月<br>房屋設備：單人床/熱水器/冷氣/冰箱<br>屋齡：15年<br>其他備註：不能養寵物
                  </p>
                  <a href="../html/details.jsp" class="btn btn-primary">瀏覽</a>
                </div>
              </div>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-4">
              <div class="card">
                <img src="./images/card-img4.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">桃園市中壢區中央路216號</h5>
                  <p class="card-text">房東：蔡小文<br>房屋坪數：7.5坪<br>房屋租金：5200/月<br>房屋設備：雙人床/熱水器/冷氣/冰箱<br>屋齡：8年<br>其他備註：不能養寵物
                  </p>
                  <a href="../html/details.jsp" class="btn btn-primary">瀏覽</a>
                </div>
              </div>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-4">
              <div class="card mb-md-4">
                <img src="./images/card-img2.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">桃園市中壢區中央路232號</h5>
                  <p class="card-text">房東：陳小邁<br>房屋坪數：8坪<br>房屋租金：5600/月<br>房屋設備：雙人床/熱水器/冷氣/冰箱<br>屋齡:15年<br>其他備註：無</p>
                  <a href="../html/details.jsp" class="btn btn-primary">瀏覽</a>
                </div>
              </div>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-4">
              <div class="card">
                <img src="./images/card-img3.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">桃園市中壢區中央路312號</h5>
                  <p class="card-text">房東：侯小宜<br>房屋坪數：8坪<br>房屋租金：5400/月<br>房屋設備：雙人床/熱水器/冷氣/冰箱<br>屋齡:7年<br>其他備註：無</p>
                  <a href="../html/details.jsp" class="btn btn-primary">瀏覽</a>
                </div>
              </div>
            </div> 
            -->
          </div>
        </section>
      </main>
      <jsp:include page="./footer.jsp" />
    </body>
    
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
            $.ajax({
                url: '/NCURent/Post/getAllHouse',
                method: 'POST',
                dataType: 'json',
                data: $('form').serialize(),
                success: function(res){
                    if(res.status == "success"){
                    	var typeData = $.parseJSON(res.data); // create an object with the key of the array
                    	var divBody = "";
                    	$.each(typeData, function(i, n) {
							 divBody += "<div class='col-sm-12 col-md-6 col-lg-4'>";
							 divBody += "<div class='card'>";
							 divBody += "<img src='/NCURent/upload/"+n.PictureName+"' class='card-img-top'  height='285.61' alt='...'>"
							 divBody += "<div class='card-body'>";
							 divBody += "<h5 class='card-title'>"+n.HAddress+"</h5>";
							 divBody += "<p class='card-text'>房東："+n.LName+"<br>房屋坪數："+n.Size+"<br>房屋租金："+n.Rent+"/月<br>房屋設備："+n.Equipment+"<br>屋齡:"+n.HYear+"<br>其他備註："+n.GenderSpecific+"</p>"
							 divBody +=	"<a href='../html/details.jsp' class='btn btn-primary'>瀏覽</a>";
							 divBody +=	"</div>";
							 divBody +=	"</div>";
							 divBody +=	"</div>";
                    	});
                    	$("#Housediv").append(divBody);
                    }else{
                        $('.alert.alert-danger').css('display','block')
                    }
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) { 
                    alert("Status: " + textStatus); alert("Error: " + errorThrown); 
                } 
            });
  	</script>
	
    </html>