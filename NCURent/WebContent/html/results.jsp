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
    <title>House to rent</title>
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
              <a class="text-white text-decoration-none d-flex pe-4" href="#"><i class="pe-1 mt-1 fas fa-search"></i><span class="nav-name d-none d-md-block"><center>管理系統</center></span></a>
            </li>
            <li>
              <a class="text-white text-decoration-none d-flex pe-4" href="#"><i class="pe-1 mt-1 fas fa-user"></i><span class="nav-name d-none d-md-block">審查刊登</span></a>
            </li>
            <li>
              <a class="text-white text-decoration-none d-flex pe-4" href="#"><i class="pe-1 mt-1 fas fa-rss"></i><span class="nav-name d-none d-md-block">管理會員帳號</span></a>
            </li>
            <li>
              <a class="text-white text-decoration-none d-flex" href="#"><i class="pe-1 mt-1 fas fa-bars"></i><span class="nav-name d-none d-md-block"><center>審查房東與房屋評價&nbsp</center></span></a>
            </li>
	    <li>
              <a class="text-white text-decoration-none d-flex pe-4" href="#"><i class="pe-1 mt-1 fas fa-search"></i><span class="nav-name d-none d-md-block"><center>&nbsp審查學生評價</center></span></a>
            </li>
          </ul>
        </div>
      </nav>
    </header>
    <main>
      </div>
      <!-- ........search results......... -->
      <section>
        <div class="row mx-1 my-4">
          <div class="col-sm-12 col-md-6 col-lg-4">
            <div class="card">
              <img src="./images/card-img4.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">桃園市中壢區中央路100號</h5>
                <p class="card-text">房東：柯小哲<br>房屋坪數：7坪<br>房屋租金：5000/月<br>房屋設備：單人床/熱水器/冷氣<br>屋齡：12年<br>其他備註：無</p>
                <a href="./check.jsp" class="btn btn-primary">審查</a>
              </div>
            </div>
          </div>
	 <div class="col-sm-12 col-md-6 col-lg-4">
            <div class="card">
              <img src="./images/card-img4.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">桃園市中壢區中央路152號</h5>
                <p class="card-text">房東：蔣小安<br>房屋坪數：6.5坪<br>房屋租金：4800/月<br>房屋設備：單人床/熱水器/冷氣/冰箱<br>屋齡：9年<br>其他備註：無</p>
                <a href="./check.jsp" class="btn btn-primary">審查</a>
              </div>
            </div>
          </div>
	 <div class="col-sm-12 col-md-6 col-lg-4">
            <div class="card">
              <img src="./images/card-img4.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">桃園市中壢區中央路212號</h5>
                <p class="card-text">房東：王小明<br>房屋坪數：6.5坪<br>房屋租金：4800/月<br>房屋設備：單人床/熱水器/冷氣/冰箱<br>屋齡：15年<br>其他備註：不能養寵物</p>
                <a href="./check.jsp" class="btn btn-primary">審查</a>
              </div>
            </div>
          </div>
 	<div class="col-sm-12 col-md-6 col-lg-4">
            <div class="card">
              <img src="./images/card-img4.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">桃園市中壢區中央路216號</h5>
                <p class="card-text">房東：蔡小文<br>房屋坪數：7.5坪<br>房屋租金：5200/月<br>房屋設備：雙人床/熱水器/冷氣/冰箱<br>屋齡：8年<br>其他備註：不能養寵物</p>
                <a href="./check.jsp" class="btn btn-primary">審查</a>
              </div>
            </div>
          </div>
          <div class="col-sm-12 col-md-6 col-lg-4">
            <div class="card mb-md-4">
              <img src="./images/card-img2.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">桃園市中壢區中央路232號</h5>
                <p class="card-text">房東：陳小邁<br>房屋坪數：8坪<br>房屋租金：5600/月<br>房屋設備：雙人床/熱水器/冷氣/冰箱<br>屋齡:15年<br>其他備註：無</p>
                <a href="./check.jsp" class="btn btn-primary">審查</a>
              </div>
            </div>
          </div>
          <div class="col-sm-12 col-md-6 col-lg-4">
            <div class="card">
              <img src="./images/card-img3.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">桃園市中壢區中央路312號</h5>
                <p class="card-text">房東：侯小宜<br>房屋坪數：8坪<br>房屋租金：5400/月<br>房屋設備：雙人床/熱水器/冷氣/冰箱<br>屋齡:7年<br>其他備註：無</p>
                <a href="./check.jsp" class="btn btn-primary">審查</a>
              </div>
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