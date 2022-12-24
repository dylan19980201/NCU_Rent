<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <%@ page import="java.util.*" %>

    <!doctype html>
    <html lang="en">

    <head>
      <% if (session.getAttribute("id")==null){ String redirectURL="/NCURent/login.jsp" ;
        response.sendRedirect(redirectURL); } %>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <title>中央大學預約看房網</title>
        <link rel="stylesheet" href="style.css">
        <link rel="icon" href="https://upload.wikimedia.org/wikipedia/commons/3/3a/NCULogo.svg" type="image/gif"
          sizes="16x16">
        <script src="https://kit.fontawesome.com/b435954bf0.js" crossorigin="anonymous"></script>
    </head>

    <body>
      <% if(session.getAttribute("id")!=null) {%>
        <jsp:include page="./header.jsp" />
        <% } %>
          <main>
            <section>
              <div class="table-box bg-whitesmoke">
                <h2 class="t-h-text mt-3">房屋細節</h2>
                <div class="details-table">
                  <img src="" Width="500" height="485" id="housePicture">
                  <div class="table-column">
                    <ul class="list-unstyled">
                      <li class="row-line">
                        <h5>房屋地址:<label id='HAddress'></label>
                          <h5>
                      </li>
                      <li class="row-line">
                        <h5>房東:<label id='LName'></label>
                          <h5>
                      </li>
                      <li class="row-line">
                        <h5>房屋租金(每月):<label id='Rent'></label>
                          <h5>
                      </li>
                      <li class="row-line">
                        <h5>房屋坪數：<label id='Size'></label>
                          <h5>
                      </li>
                      <li class="row-line">
                        <h5>房屋年齡:<label id='HYear'></label>
                          <h5>
                      </li>
                      <li class="row-line">
                        <h5>設備:<label id='Equipment'></label>
                          <h5>
                      </li>
                      <li class="row-line">
                        <h5>男/女限制:<label id='GenderSpecific'></label>
                          <h5>
                      </li>
                      <li class="row-line">
                        <h5>刊登時間:<label id='PostDatetime'></label>
                          <h5>
                      </li>
                    </ul>
                    <div>
                      <p class="btn apply-btn">
                        <a id="confirm_btn" class="bg-primary p-2 px-4 text-white text-decoration-none">確認</a>
                        <a id="reject_btn" class="bg-primary p-2 px-4 text-white text-decoration-none">刪除</a>
                        <br>
                      </p>
                    </div>
                  </div>
                </div>
            </section>
          </main>
          <jsp:include page="./footer.jsp" />
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
            crossorigin="anonymous"></script>
    </body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
      $(function () {
        var getUrlString = location.href;
        var url = new URL(getUrlString);
        var id = url.searchParams.get('id');
        var result;
        getData();
        update(result);
        $("#confirm_btn").click(function () {
          confirm(id);
        });
        $("#reject_btn").click(function () {
          reject(id);
        });

        function getData() {
          $.ajax({
            url: '/NCURent/Post/GetHouseData',
            method: 'POST',
            dataType: 'json',
            data: "HID=" + id,
            async: false,
            success: function (res) {
              if (res.status == "success") {
                result = $.parseJSON(res.data.houseData);
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
          $("#housePicture").attr("src", "/NCURent/upload/" + data.pictureName);
          $('#HAddress').text(data.HAddress);
          $('#LName').text(data.LName);
          $('#Rent').text(data.rent);
          $('#Size').text(data.size);
          $('#HYear').text(data.HYear);
          $('#Equipment').text(data.equipment);
          $('#GenderSpecific').text(data.genderSpecific);
          $('#PostDatetime').text(data.postDateTime);
        }

        function confirm(hid) {
          $.ajax({
            url: '/NCURent/Post/checkHouse',
            method: 'POST',
            data: "HID=" + hid,
            success: function () {
              alert("審核成功");
              window.location.href = '/NCURent/html/results.jsp';
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
              alert("Status: " + textStatus); alert("Error: " + errorThrown);
              window.location.href = '/NCURent/html/results.jsp';
            }
          });
        }

        function reject(hid) {
          $.ajax({
            url: '/NCURent/Post/deleteHouse',
            method: 'POST',
            data: "HID=" + hid,
            success: function () {
              alert("刪除成功");
              window.location.href = '/NCURent/html/results.jsp';
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
              alert("Status: " + textStatus); alert("Error: " + errorThrown);
              window.location.href = '/NCURent/html/results.jsp';
            }
          });
        }

      });
    </script>

    </html>