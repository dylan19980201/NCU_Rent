<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*"  %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <title>中央大學預約租屋網</title>
    <link rel="stylesheet" href="style.css">
    <link rel="icon" href="./images/favicon.png" type="image/gif" sizes="16x16">
    <script src="https://kit.fontawesome.com/b435954bf0.js" crossorigin="anonymous"></script>
  </head>
  <body>
    <header>
      <nav class="nav-top bg-red p-2 d-md-flex align-items-center">
        <div class="d-flex justify-content-center ps-md-2">
            <a href="#"><img class="logo" src="./images/favicon.png" alt=""></a>
            <h1 class="fs-4"><a class="text-decoration-none text-white" href="./index.jsp">中央大學預約看房網</a></h1>
        </div>
        <div>
          <ul class="nav-link d-flex justify-content-center list-unstyled pt-3">
	    <li>
              <a class="text-white text-decoration-none d-flex pe-4" href="#"><i class="pe-1 mt-1 fas fa-search"></i><span class="nav-name d-none d-md-block"><center>瀏覽房屋</center></span></a>
            </li>
            <li>
              <a class="text-white text-decoration-none d-flex pe-4" href="#"><i class="pe-1 mt-1 fas fa-user"></i><span class="nav-name d-none d-md-block">刊登房東與房屋評價</span></a>
            </li>
            <li>
              <a class="text-white text-decoration-none d-flex pe-4" href="#"><i class="pe-1 mt-1 fas fa-search"></i><span class="nav-name d-none d-md-block">查看學生評價</span></a>
            </li>
            <li>
              <a class="text-white text-decoration-none d-flex pe-4" href="#"><i class="pe-1 mt-1 fas fa-user"></i><span class="nav-name d-none d-md-block"><center>登入</center></span></a>
            </li>
          </ul>
        </div>
      </nav>
    </header>
    <main>
      <section>
        <div class="table-box bg-whitesmoke">
          <h2 class="t-h-text mt-3">房屋細節</h2>
          <div class="details-table">
	   <img src="./images/card-img4.jpg" Width="500" height="485">
            <div class="table-column">
              <ul class="list-unstyled">
                <li class="row-line"><h5>房屋地址:桃園市中壢區中央路100號<h5></li>
                <li class="row-line"><h5>房東:柯小哲<h5></li>
	        <li class="row-line"><h5>房屋租金(每月):$5000<h5></li>
                <li class="row-line"><h5>房屋坪數：7坪<h5></li>
		<li class="row-line"><h5>房屋年齡: 12年<h5></li>
                <li class="row-line"><h5>電費:4.5元/度<h5></li>
	        <li class="row-line"><h5>水費(每月):$200<h5></li>
                <li class="row-line"><h5>有無陽台:無<h5></li>
		<li class="row-line"><h5>其他備註:無<h5></li>
              </ul>
	      <p class="apply-btn"><a class="bg-primary p-2 px-4 text-white text-decoration-none" a href="./reserve.jsp">預約看房</a></p>
            </div>
          </div>
        </div>
      </section>
    </main>
   <footer>
      <div class="bg-dark">
      <section>
        <div>
          <ul class="footer-link d-flex flex-wrap justify-content-center list-unstyled pt-4">
            <li class="py-2 px-3"><a class="text-decoration-none text-white fs-6" href="#">主頁</a></li>
            <li class="py-2 px-3"><a class="text-decoration-none text-white fs-6" href="#">搜尋</a></li>
            <li class="py-2 px-3"><a class="text-decoration-none text-white fs-6" href="#">關於我們</a></li>
              <img class="logo bg-white rounded-circle" src="./images/favicon.png" alt=""></a></li>
            <li class="py-2 px-3"><a class="text-decoration-none text-white fs-6" href="#">FACEBOOK</a></li>
            <li class="py-2 px-3"><a class="text-decoration-none text-white fs-6" href="#">TWITTER</a></li>
            <li class="py-2 px-3"><a class="text-decoration-none text-white fs-6" href="#">部落格</a></li>
          </ul>
        </div>  
      </section>
          <!-- .......footer part - 2........ -->
      <section>
        <div class="footer-2">
          <div class="f-2-content px-3 py-2">
              <h6 class="text-white text-center">訂閱</h6>
              <div class="sub-box d-flex">
                <input type="text" class="sub-text-box w-100" placeholder="@example.com" id="mail" name="email">
                <button type="button" class="bg-secondary text-white fs-6">送出</button>
              </div>
          </div>
          <div class="f-2-content text-white px-3 py-2 text-center">
            <h6>關於我們</h6>
            <p>中央大學預約看房網是一個提供學生及房東交換租屋資訊的平台。</p>
          </div>
        </div>
      </section>  
      </div>
      <!-- ............footer part -3........... -->
      <section>
        <div class="d-md-flex justify-content-md-between bg-light-dark py-3">
          <div class="social">
            <ul class="list-unstyled d-flex justify-content-center ms-4">
              <li class="me-4"><a href="#"><i class="fab fa-facebook-f text-secondary fs-4"></i></a></li>
              <li class="me-4"><a href="#"><i class="fab fa-twitter text-secondary fs-4"></i></a></li>
              <li class="me-4"><a href="#"><i class="fas fa-rss text-secondary fs-4"></i></a></li>
              <li class="me-4"><a href="#"><i class="fab fa-google text-secondary fs-4"></i></a></li>
              <li class="me-4"><a href="#"><i class="fab fa-instagram-square text-secondary fs-4"></i></a></li>
            </ul>
          </div>
          <div class="me-4 text-secondary text-center">
            <small class="fs-6">&copy; 中央大學預約看房網 2022.</small>
          </div>
        </div>
      </section>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
  </body>
</html>