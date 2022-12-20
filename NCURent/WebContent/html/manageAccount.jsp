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

      <link rel="icon" href="https://upload.wikimedia.org/wikipedia/commons/3/3a/NCULogo.svg" type="image/gif"
        sizes="16x16">
      <script src="https://kit.fontawesome.com/b435954bf0.js" crossorigin="anonymous"></script>
    </head>
    <jsp:include page="./header.jsp" />

    <body>
      <main>
        <section>
          <div class="d-md-flex justify-content-center">
            <div id="userDiv">
            </div>
          </div>

        </section>
      </main>
      <jsp:include page="./footer.jsp" />
    </body>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script>
      $(function () {
        $(document).on("click", ".del_btn", function () {
          var id = $(this).attr("del_id");
          del(id);
        });

        $.ajax({
          url: '/NCURent/Login/getAllUser',
          method: 'POST',
          dataType: 'json',
          success: function (res) {
            if (res.status == "success") {
              items = $.parseJSON(res.data);
              var divBody = ""
              var divBody = "<table class='table'><thead><tr><th scope='col'>#</th><th scope='col'>身分</th><th scope='col'>帳號</th><th scope='col'>密碼</th><th scope='col'>姓名</th><th scope='col'>生日</th><th scope='col'>性別</th><th scope='col'>系所</th><th scope='col'>電話</th><th scope='col'>信箱</th><th scope='col'></th></tr></thread>";
              divBody += "<tbody>";
              var dept = "";
              var type = "";
              $.each(items, function (i, item) {
                dept = item.Department ? item.Department : "無";
                type = item.Department ?"學生":"房東";
                divBody += "<tr>";
                divBody += "<th scope='row'>" + i + "</th>";
                divBody += "<td>" + type + "</td>";
                divBody += "<td>" + item.ID + "</td>";
                divBody += "<td>" + item.Password + "</td>";
                divBody += "<td>" + item.Name + "</td>";
                divBody += "<td>" + item.Birth + "</td>";
                divBody += "<td>" + item.Gender + "</td>";
                divBody += "<td>" + dept + "</td>";
                divBody += "<td>" + item.Phone + "</td>";
                divBody += "<td>" + item.Email + "</td>";
                divBody += "<td><a del_id=" + item.ID + " class='btn btn-primary del_btn'>刪除</a></th>";
                divBody += "</tr>";
              });
              divBody += "</tbody>";
              divBody += "</table>";
              $("#userDiv").html(divBody);
            } else {
              $('.alert.alert-danger').css('display', 'block');
            }
          },
          error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Status: " + textStatus); alert("Error: " + errorThrown);
          }
        });
        function del(id) {
          $.ajax({
            url: '/NCURent/Login/deleteUser',
            method: 'POST',
            data: "delID=" + id,
            success: function () {
              alert("刪除成功");
              window.location.reload();
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
              alert("Status: " + textStatus); alert("Error: " + errorThrown);
            }
          });
        }
      });

    </script>


    </html>