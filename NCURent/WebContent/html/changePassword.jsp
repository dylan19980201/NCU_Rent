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
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
                    rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
                    crossorigin="anonymous">
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
                                <h2 class="t-h-text mt-3">更改密碼</h2>
                                <div class="d-md-flex justify-content-center">
                                    <a>請輸入新的密碼：</a><input id="inputPassword" type="password" value=""
                                        placeholder="密碼(請輸入3~16位英數字)" pattern="[0-9||A-z]{3,16}" required />
                                    <a>請再次確認密碼：</a><input id="verifyPassword" type="password" value=""
                                        placeholder="密碼(請輸入3~16位英數字)" pattern="[0-9||A-z]{3,16}" required />
                                    <a id='submit' class='btn btn-primary'>更正密碼</a>
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
                $("#submit").click(function () {
                    const inputPassword = document.getElementById("inputPassword").value;
                    const verifyPassword = document.getElementById("verifyPassword").value;
                    if (inputPassword != verifyPassword) {
                        alert("密碼與確認密碼不同!");
                    } else if (inputPassword.length < 3 || inputPassword.length > 16) {
                        alert("密碼長度請介於3~16!");
                    } else {
                        changePassword(inputPassword);
                    }
                });
                function changePassword(password) {
                    $.ajax({
                        url: '/NCURent/Login/updateUser',
                        method: 'POST',
                        data: "password=" + password,
                        success: function () {
                            alert("更改成功");
                            window.location.href = '/NCURent/html/index.jsp';
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus); alert("Error: " + errorThrown);
                            window.location.href = '/NCURent/html/changePassword.jsp';
                        }
                    });
                }
            });
        </script>

        </html>