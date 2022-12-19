<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
    <link href="/NCURent/html/style.css" rel="stylesheet" type="text/css">
    <header>
        <nav class="nav-top bg-red p-2 d-md-flex align-items-center">
            <div class="d-flex justify-content-center ps-md-2">
                <a href="#"><img class="logo" src="https://upload.wikimedia.org/wikipedia/commons/3/3a/NCULogo.svg" alt=""></a>
                <h1 class="fs-4"><a class="text-decoration-none text-white" href="/NCURent/html/index.jsp">中央大學預約看房網</a>
                </h1>
            </div>
            <div>
                <ul class="nav-link d-flex justify-content-center list-unstyled pt-3">
                    <li>
                        <a class="text-white text-decoration-none d-flex pe-4" href="#"><i
                                class="pe-1 mt-1 fas fa-search"></i><span class="nav-name d-none d-md-block">
                                <center>瀏覽房屋</center>
                            </span></a>
                    </li>
                    <% if((session.getAttribute("type")).equals("student")) {%>
                        <li>
                            <a class="text-white text-decoration-none d-flex pe-4" href="#"><i
                                    class="pe-1 mt-1 fas fa-upload"></i><span
                                    class="nav-name d-none d-md-block">刊登房東與房屋評價</span></a>
                        </li>
                        <li>
                            <a class="text-white text-decoration-none d-flex pe-4" href="#">
                           <i
                                    class="pe-1 mt-1 fas fa-eye"></i><span
                                    class="nav-name d-none d-md-block">查看學生評價</span></a>
                        </li>
                        <li>
                            <a class="text-white text-decoration-none d-flex pe-4" href="/NCURent/html/sreservestate.jsp"><i
                                    class="pe-1 mt-1 fas fa-calendar-check"></i><span
                                    class="nav-name d-none d-md-block">查看預約資訊</span></a>
                        </li>
                                                <li>
                            <a class="text-white text-decoration-none d-flex pe-4" href="/NCURent/studentMainPage.jsp"><i
                                    class="pe-1 mt-1 fas fa-user"></i><span
                                    class="nav-name d-none d-md-block">我的帳戶</span></a>
                        </li>
                    <% } else if((session.getAttribute("type")).equals("landlord")) { %>
                        <li>
                            <a class="text-white text-decoration-none d-flex pe-4" href="/NCURent/housepost.jsp"><i
                                    class="pe-1 mt-1 fas fa-file-upload"></i><span
                                    class="nav-name d-none d-md-block">刊登房屋</span></a>
                            </li>
                        <li>
                        <li>
                            <a class="text-white text-decoration-none d-flex pe-4" href="#"><i
                                    class="pe-1 mt-1 fas fa-upload"></i><span
                                    class="nav-name d-none d-md-block">刊登學生評價</span></a>
                            </li>
                        <li>
                            <a class="text-white text-decoration-none d-flex pe-4" href="#"><i
                                    class="pe-1 mt-1 fas fa-eye"></i><span
                                    class="nav-name d-none d-md-block">查看房東與房屋評價</span></a>
                        </li>
                        <li>
                            <a class="text-white text-decoration-none d-flex pe-4" href="/NCURent/html/lreservestate.jsp"><i
                                    class="pe-1 mt-1 fas fa-calendar-check"></i><span
                                    class="nav-name d-none d-md-block">查看預約資訊</span></a>
                        </li>
                                                
                    <% } else { %>
                        <li>
                            <a class="text-white text-decoration-none d-flex pe-4" href="/NCURent/checkReview.jsp"><i
                                    class="pe-1 mt-1 fas fa-eye"></i><span
                                    class="nav-name d-none d-md-block">查看學生評價</span></a>
                        </li>
                        <li>
                            <a class="text-white text-decoration-none d-flex pe-4" href="#"><i
                                    class="pe-1 mt-1 far fa-eye"></i><span
                                    class="nav-name d-none d-md-block">查看房東與房屋評價</span></a>
                        </li>
                        <li>
                            <a class="text-white text-decoration-none d-flex pe-4" href="/NCURent/html/results.jsp"><i
                                    class="pe-1 mt-1 fas fa-check"></i><span
                                    class="nav-name d-none d-md-block">審查刊登</span></a>
                            </li>
                        <li>
                            <a class="text-white text-decoration-none d-flex pe-4" href="/NCURent/html/manageAccount.jsp"><i
                                    class="pe-1 mt-1 fas fa-user-check"></i><span
                                    class="nav-name d-none d-md-block">管理會員帳號</span></a>
                            </li>
                    <% } %>
                        <li>
                            <a class="text-white text-decoration-none d-flex pe-4"
                                    href="/NCURent/logout.jsp"><i class="pe-1 mt-1 fas fa-sign-out-alt"></i><span
                                    class="nav-name d-none d-md-block">
                                    <center>登出</center>
                            </span></a>
                        </li>
                </ul>
            </div>
        </nav>
    </header>