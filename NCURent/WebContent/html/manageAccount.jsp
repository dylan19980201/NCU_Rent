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

        <link rel="icon" href="https://upload.wikimedia.org/wikipedia/commons/3/3a/NCULogo.svg" type="image/gif"
          sizes="16x16">
        <script src="https://kit.fontawesome.com/b435954bf0.js" crossorigin="anonymous"></script>
    </head>
    <% if(session.getAttribute("id")!=null) {%>
      <jsp:include page="./header.jsp" />
      <% } %>

        <body>
          <main>
            <div class="text-center my-2">
              <a id="selectStudent" class="text-dark p-1 btn btn-warning text-decoration-none">學生</a>
              <a id="selectLandlord" class="text-dark p-1 btn btn-warning text-decoration-none">房東</a>
            </div>
            <section>
              <div class="d-md-flex justify-content-center">
                <div id="userDiv"></div>
              </div>
              <div class="d-md-flex justify-content-center">
                <div id="pagination"></div>
              </div>
            </section>
          </main>
          <jsp:include page="./footer.jsp" />
        </body>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css" />

        <script>
          $(function () {
            var student = [], landlord = [];
            getData();
            updatePage(student, 0);
            $(document).on("click", ".delBtn", function () {
              var id = $(this).attr("delID");
              var index = $(this).attr("index") - 1;
              var type = $(this).attr("type");
              deleteUser(id, index, type);
            });
            document.querySelector('#selectStudent').addEventListener('click', () => updatePage(student, 0));
            document.querySelector('#selectLandlord').addEventListener('click', () => updatePage(landlord, 1));
            function getData() {
              $.ajax({
                url: '/NCURent/Login/getAllUser',
                method: 'POST',
                dataType: 'json',
                async: false,
                success: function (res) {
                  if (res.status == "success") {
                    let i = 0;
                    const data = $.parseJSON(res.data);
                    const n = data.length;
                    for (; i < n; ++i) {
                      if (!data[i].Department) break;
                      student.push(data[i]);
                    }
                    for (; i < n; ++i) {
                      landlord.push(data[i]);
                    }
                  }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                  alert("Status: " + textStatus); alert("Error: " + errorThrown);
                }
              });
            }
            function updatePage(items, type) {
              var divBody = ""
              var dept = "";
              $('#pagination').pagination({
                dataSource: items,
                pageSize: 10,
                callback: function (data, pagination) {
                  var divBody = "<table class='table'><thead><tr><th scope='col'>#</th><th scope='col'>帳號</th><th scope='col'>密碼</th><th scope='col'>姓名</th><th scope='col'>生日</th><th scope='col'>性別</th><th scope='col'>系所</th><th scope='col'>電話</th><th scope='col'>信箱</th><th scope='col'></th></tr></thread>";
                  divBody += "<tbody>";
                  $.each(data, function (i, item) {
                    let index = ((pagination.pageNumber) - 1) * (pagination.pageSize) + i + 1;
                    dept = item.Department ? item.Department : "無";
                    divBody += "<tr>";
                    divBody += "<th scope='row'>" + index + "</th>";
                    divBody += "<td>" + item.ID + "</td>";
                    divBody += "<td>" + item.Password + "</td>";
                    divBody += "<td>" + item.Name + "</td>";
                    divBody += "<td>" + item.Birth + "</td>";
                    divBody += "<td>" + item.Gender + "</td>";
                    divBody += "<td>" + dept + "</td>";
                    divBody += "<td>" + item.Phone + "</td>";
                    divBody += "<td>" + item.Email + "</td>";
                    divBody += "<td><a delID=" + item.ID + " index=" + index + " type=" + type + " class='btn btn-primary delBtn'>刪除</a></th>";
                    divBody += "</tr>";
                  });
                  divBody += "</tbody>";
                  divBody += "</table>";
                  $("#userDiv").html(divBody);
                }
              })
            }

            function deleteUser(id, index, type) {
              $.ajax({
                url: '/NCURent/Login/deleteUser',
                method: 'POST',
                data: "delID=" + id,
                success: function () {
                  alert("刪除成功");
                  if (type == 0) {
                    student.splice(index, 1);
                    updatePage(student, type);
                  } else {
                    landlord.splice(index, 1);
                    updatePage(landlord, type);
                  }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                  alert("Status: " + textStatus); alert("Error: " + errorThrown);
                }
              });
            }
          });

        </script>


    </html>