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
    <jsp:include page="./header.jsp" />

    <body>
      <main>

        <div class="bg-whitesmoke my-4 mx-3 p-4">
          <h5 class="text-center mb-4"><i class="pe-1 mt-1 fas fa-filter"></i>條件篩選</h5>
          <div class="d-md-flex justify-content-center">
            <ul class="select-box list-unstyled d-md-flex">
              <li>
                <select name="size" id="size" style="height:40px; width:120px">
                  <option value="0-2147483647">坪數</option>
                  <option value="0-5">0-5</option>
                  <option value="6-10">6-10</option>
                  <option value="11-15">11-15</option>
                  <option value="16-20">16-20</option>
                  <option value="20-2147483647">20坪以上</option>
                </select>
              </li>
              <li>
                <select name="year" id="year" style="height:40px; width:120px">
                  <option value="0-2147483647">屋齡</option>
                  <option value="0-5">0-5</option>
                  <option value="6-10">6-10</option>
                  <option value="11-15">11-15</option>
                  <option value="16-20">16-20</option>
                  <option value="20-2147483647">20年以上</option>
                </select>
              </li>
              <li>
                <nobr>　　租金</nobr>
                <input type="search" style="height:40px; width:85px" id="minPrice" value="" placeholder="$ 最小值">
                <nobr>——</nobr>
                <input type="search" style="height:40px; width:85px" id="maxPrice" value="" placeholder="$ 最大值">
              </li>
              <nobr>　　</nobr>
              <input type="search" style="height:40px; width:150px" id="keyword" value="" placeholder="請輸入關鍵字">
            </ul>
            <div class="result-btn">
              <a id="search" class="text-white p-1 btn btn-primary text-decoration-none"
                style="height:35px; width:65px"><i class="fas fa-search"></i>搜尋</a>
              <nobr> </nobr>
              <a class="text-dark p-1 btn btn-warning text-decoration-none" style="height:35px; width:65px"><i
                  class="fas fa-trash-alt"></i>清除</a>
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
      $(function () {
        var result;
        GetData();
        update(result);
        document.querySelector('#search').addEventListener('click', () => update(result));
        function GetData() {
          console.log("do");
          $.ajax({
            url: '/NCURent/Post/getAllHouse',
            method: 'POST',
            dataType: 'json',
            data: $('form').serialize(),
            async: false,
            success: function (res) {
              if (res.status == "success") {
                result = $.parseJSON(res.data);
              } else {
                $('.alert.alert-danger').css('display', 'block');
              }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
              alert("Status: " + textStatus); alert("Error: " + errorThrown);
            }
          });
        }

        function update(data) {
          var divBody = "";
          var size = document.getElementById("size").value.split('-');
          var year = document.getElementById("year").value.split('-');
          var minPrice = document.getElementById("minPrice").value != "" ? document.getElementById("minPrice").value : 0;
          var maxPrice = document.getElementById("maxPrice").value != "" ? document.getElementById("maxPrice").value : 2147483647;
          var keyword = document.getElementById("keyword").value;
          $.each(data, function (i, n) {
            if (match(n, size, year, minPrice, maxPrice, keyword)) {
              divBody += "<div class='col-sm-12 col-md-6 col-lg-4'>";
              divBody += "<div class='card'>";
              divBody += "<img src='/NCURent/upload/" + n.PictureName + "' class='card-img-top'  height='285.61' alt='...'>"
              divBody += "<div class='card-body'>";
              divBody += "<h5 class='card-title'>" + n.HAddress + "</h5>";
              divBody += "<p class='card-text'>房東：" + n.LName + "<br>房屋坪數：" + n.Size + "<br>房屋租金：" + n.Rent + "/月<br>房屋設備：" + n.Equipment + "<br>屋齡:" + n.HYear + "<br>其他備註：" + n.GenderSpecific + "</p>"
              divBody += "<a href='../html/details.jsp?id=" + n.HID + "' class='btn btn-primary'>瀏覽</a>";
              divBody += "</div>";
              divBody += "</div>";
              divBody += "</div>";
            }
          });
          $("#Housediv").html(divBody);
        }

        function match(item, size, year, minPrice, maxPrice, keyword) {
          if(!item.AID) return false;
          if (item.Size >= parseInt(size[0]) && item.Size <= parseInt(size[1]) && item.HYear >= parseInt(year[0]) && item.HYear <= parseInt(year[1]) && item.Rent >= parseInt(minPrice) && item.Rent <= parseInt(maxPrice)) {
            if (keyword == "") {
              return true;
            } else {
              for (const c of keyword) {
                if (item.HAddress.includes(c) > 0) {
                  return true;
                }
              }
            }
          }
          return false;
        }
      });
    </script>

    </html>