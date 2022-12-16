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
      <link rel="stylesheet" href="/NCURent/html/style.css">
      <link rel="icon" href="https://upload.wikimedia.org/wikipedia/commons/3/3a/NCULogo.svg" type="image/gif" sizes="16x16">
      <script src="https://kit.fontawesome.com/b435954bf0.js" crossorigin="anonymous"></script>
    </head>
	<jsp:include page="./header.jsp" />
    <body>
    <main>

       <div class="bg-whitesmoke my-4 mx-3 p-4">
      <h5 class="text-center mb-4"><i class="pe-1 mt-1 fas fa-filter"></i>條件篩選</h5> 
      <div class="d-md-flex justify-content-center">
          <ul class="select-box list-unstyled d-md-flex">
            <li>
                <select name="size" id="size" style="height:40px; width:120px">
                <option value="size">坪數</option>
                <option value="size1">0-5</option>
                <option value="size2">6-10</option>
                <option value="size3">11-15</option>
                <option value="size4">16-20</option>
                <option value="size5">20坪以上</option>
              </select>
            </li>
            <li> 
              <select name="year" id="year" style="height:40px; width:120px">
                <option value="year">屋齡</option>
                <option value="year1">0-5</option>
                <option value="year2">6-10</option>
                <option value="year3">11-15</option>
                <option value="year4">16-20</option>
                <option value="year5">20年以上</option>
              </select>
            </li>
            <li>
              <nobr>　　租金</nobr>
              <input type="search" style="height:40px; width:85px" placeholder="$ 最小值">
              <nobr>——</nobr>
              <input type="search" style="height:40px; width:85px" placeholder="$ 最大值">
            </li>
            <nobr>　　</nobr>
           <input type="search" style="height:40px; width:150px" placeholder="請輸入關鍵字">
          </ul>
          <div class="result-btn">          	
              <a href="#" class="text-white p-1 btn btn-primary text-decoration-none" style="height:35px; width:65px"><i class="fas fa-search"></i>搜尋</a>
              <nobr> </nobr>
              <a href="#" class="text-dark p-1 btn btn-warning text-decoration-none" style="height:35px; width:65px"><i class="fas fa-trash-alt"></i>清除</a>
          </div>

      </div>
      </div>
        <!-- ........search results......... -->
        
        <section>
          <div class="row mx-1 my-4" id="Housediv">
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
							 divBody +=	"<a href='../html/details.jsp?id="+n.HID+"' class='btn btn-primary'>瀏覽</a>";
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