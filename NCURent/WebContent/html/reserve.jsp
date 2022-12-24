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
        <title>中央大學預約租屋網</title>
        <link rel="stylesheet" href="style.css">
        <link rel="icon" href="https://upload.wikimedia.org/wikipedia/commons/3/3a/NCULogo.svg" type="image/gif"
          sizes="16x16">
        <script src="https://kit.fontawesome.com/b435954bf0.js" crossorigin="anonymous"></script>
    </head>

    <body>
      <% if(session.getAttribute("id")!=null) {%>
        <jsp:include page="./header.jsp" />
        <% } %>
          <style>
            .button1 {
              background-color: #008CBA;
            }

            p {
              text-align: center;
            }
          </style>
          <main>
            <section>
              <div class="table-box bg-whitesmoke">
                <h2 class="t-h-text mt-3">預約看房</h2>
                <div class="details-table">
                  <img src="" Width="500" height="420" id="housePicture">
                  <div class="table-column">
                    <ul class="list-unstyled">
                      <form action="/NCURent/Post/addReserve" method="post">
                        <input type="hidden" name="hid" value="" id="HID" />
                        <li class="row-line">
                          <h5><label for="checkIn" pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}">看房時間</label>
                            <input type="datetime-local" name="reservetime" class="form-control" id="checkIn"
                              aria-describedby="textHelp">
                          </h5>
                        </li>
                    </ul>
                    <p><input type="submit" value="確認送出"></p>
                    </form>
                  </div>
                </div>
              </div>
            </section>
          </main>
          <jsp:include page="./footer.jsp" />
    </body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
      $(document).ready(function () {
        var getUrlString = location.href;
        var url = new URL(getUrlString);
        var id = url.searchParams.get('id');
        $.ajax({
          url: '/NCURent/Post/GetHouseData',
          method: 'post',
          dataType: 'json',
          data: { HID: id },
          success: function (res) {
            if (res.status == "success") {
              var typeData = $.parseJSON(res.data.houseData);
              $("#housePicture").attr("src", "/NCURent/upload/" + typeData.pictureName);
            } else {
              $('.alert.alert-danger').css('display', 'block')
            }
          },
          error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Status: " + textStatus); alert("Error: " + errorThrown);
          }
        });
      });
      $('form').on('submit', function () {
        var getUrlString = location.href;
        var url = new URL(getUrlString);
        var id = url.searchParams.get('id');
        $('#HID').attr("value", id);
        $.ajax({
          url: '/NCURent/Post/addReserve',
          method: 'POST',
          dataType: 'json',
          data: $('form').serialize(),
          success: function (res) {
            if (res.status == "success") {
              location.href = res.page;
            } else {
              $('.alert.alert-danger').css('display', 'block')
            }
          },
          error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Status: " + textStatus); alert("Error: " + errorThrown);
          }
        });
      });
    </script>

    </html>