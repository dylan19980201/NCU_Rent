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
              typedata = $.parseJSON(res.data);
              var divBody = "<table><tr><th>帳號</th><th>密碼</th><th>姓名</th><th>生日</th><th>性別</th><th>系所</th><th>電話</th><th>信箱</th><th></th></tr>";
              $.each(typedata, function (i, n) {
                divBody += "<tr>";
                divBody += "<td>" + n.ID + "</td>";
                divBody += "<td>" + n.Password + "</td>";
                divBody += "<td>" + n.Name + "</td>";
                divBody += "<td>" + n.Birth + "</td>";
                divBody += "<td>" + n.Gender + "</td>";
                divBody += "<td>" + n.Department + "</td>";
                divBody += "<td>" + n.Phone + "</td>";
                divBody += "<td>" + n.Email + "</td>";
                divBody += "<th><a del_id=" + n.ID + " class='btn btn-primary del_btn'>刪除</a></th>";
                divBody += "</tr>";
              });
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