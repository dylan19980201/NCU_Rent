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

    <body>
      <jsp:include page="./header.jsp" />
      <main>
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
                url: '/NCURent/Post/getAllReserve',
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
							 divBody += "<img src='/NCURent/upload/"+n.map.PictureName+"' class='card-img-top'  height='285.61' alt='...'>"
							 divBody += "<div class='card-body'>";
							 divBody += "<h5 class='card-title'>"+n.map.HAddress+"</h5>";
							 divBody += "<p class='card-text'>房東："+n.map.Name+"<br>電話："+n.map.Phone+"<br>預約時間："+n.map.RDate+"<br>房屋坪數："+n.map.Size+"<br>房屋租金："+n.map.Rent+"/月<br>房屋設備："+n.map.Equipment+"<br>屋齡:"+n.map.HYear+"<br>其他備註："+n.map.GenderSpecific+"</p>"
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