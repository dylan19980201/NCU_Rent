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
      <main>
        <section>
          <div class="table-box bg-whitesmoke">
            <h2 class="t-h-text mt-3">房屋細節</h2>
            <div class="details-table">
              <img src="./images/card-img4.jpg" Width="500" height="485">
              <div class="table-column">
                <ul class="list-unstyled">
                  <li class="row-line">
                    <h5>房屋地址:桃園市中壢區中央路100號<h5>
                  </li>
                  <li class="row-line">
                    <h5>房東:柯小哲<h5>
                  </li>
                  <li class="row-line">
                    <h5>房屋租金(每月):$5000<h5>
                  </li>
                  <li class="row-line">
                    <h5>房屋坪數：7坪<h5>
                  </li>
                  <li class="row-line">
                    <h5>房屋年齡: 12年<h5>
                  </li>
                  <li class="row-line">
                    <h5>電費:4.5元/度<h5>
                  </li>
                  <li class="row-line">
                    <h5>水費(每月):$200<h5>
                  </li>
                  <li class="row-line">
                    <h5>有無陽台:無<h5>
                  </li>
                  <li class="row-line">
                    <h5>其他備註:無<h5>
                  </li>
                </ul>
                <p class="apply-btn"><a class="bg-primary p-2 px-4 text-white text-decoration-none" href="#">確認</a></p>
                <p class="apply-btn"><a class="bg-primary p-2 px-4 text-white text-decoration-none" href="#">刪除</a></p>
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

    </html>