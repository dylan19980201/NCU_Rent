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
      <title>中央大學預約租屋網</title>
      <link rel="stylesheet" href="style.css">
      <link rel="icon" href="./images/favicon.png" type="image/gif" sizes="16x16">
      <script src="https://kit.fontawesome.com/b435954bf0.js" crossorigin="anonymous"></script>
    </head>

    <body>
      <jsp:include page="./header.jsp" />
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
              <img src="./images/card-img4.jpg" Width="500" height="420">
              <div class="table-column">
                <ul class="list-unstyled">
                  <form action="/NCURent/Login/Login" method="post">
                    <input type="hidden" name="hid" value="11101"/>
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

    </html>