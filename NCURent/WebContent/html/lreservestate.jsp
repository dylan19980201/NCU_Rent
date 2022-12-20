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
      <link rel="icon" href="https://upload.wikimedia.org/wikipedia/commons/3/3a/NCULogo.svg" type="image/gif"
        sizes="16x16">
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
      var result;
      getData();
      updatePage(result);
      $(document).on("click", ".update_btn", function () {
        var rid = $(this).attr("rid");
        var checktype = $(this).attr("checktype");
        updateReserve(rid,checktype);
      });
      function getData() {
        $.ajax({
          url: '/NCURent/Post/getAllReserve',
          method: 'POST',
          dataType: 'json',
          async: false,
          success: function (res) {
            if (res.status == "success") {
              result = $.parseJSON(res.data); // create an object with the key of the array
            } else {
              $('.alert.alert-danger').css('display', 'block')
            }
          },
          error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Status: " + textStatus); alert("Error: " + errorThrown);
          }
        });
      }
      function updatePage(items) {
        var divBody = "";
        var check = "";
        var btn = "";
        $.each(items, function (i, item) {
          item = item.map;
          check = item.CheckType ? "已確認" : "未確認";
          btn = item.CheckType ? "取消" : "確認";
          divBody += "<div class='col-sm-12 col-md-6 col-lg-4'>";
          divBody += "<div class='card'>";
          divBody += "<img src='/NCURent/upload/" + item.PictureName + "' class='card-img-top'  height='285.61' alt='...'>"
          divBody += "<div class='card-body'>";
          divBody += "<h5 class='card-title'>" + item.HAddress + "</h5>";
          divBody += "<p class='card-text'>學生：" + item.Name + "<br>電話：" + item.Phone + "<br>預約時間：" + item.RDate + "<br>房屋坪數：" + item.Size + "<br>房屋租金：" + item.Rent + "/月<br>房屋設備：" + item.Equipment + "<br>屋齡:" + item.HYear + "<br>其他備註：" + item.GenderSpecific + "<br>預約通過：" + check + "</p>"
          divBody += "<a rid=" + item.RID + " checktype=" + item.CheckType + " class='btn btn-primary update_btn'>" + btn + "</a>";
          divBody += "</div>";
          divBody += "</div>";
          divBody += "</div>";
        });
        $("#Housediv").append(divBody);
      }
      function updateReserve(rid,checktype) {
        $.ajax({
          url: '/NCURent/Post/updateReserve',
          method: 'POST',
          data: "RID=" + rid + "&CheckType=" + checktype,
          success: function () {
            alert("更新成功");
            window.location.reload();
          },
          error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Status: " + textStatus); alert("Error: " + errorThrown);
          }
        });
      }
    </script>

    </html>