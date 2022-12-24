<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.*" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>中央大學預約看房網</title>
            <!-- Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
                crossorigin="anonymous">
            <title>中央大學預約看房網</title>
            <link rel="stylesheet" type="text/css" href="house.css">
            <link rel="icon" href="https://upload.wikimedia.org/wikipedia/commons/3/3a/NCULogo.svg" type="image/gif"
                sizes="16x16">
            <script src="https://kit.fontawesome.com/b435954bf0.js" crossorigin="anonymous"></script>
        </head>

        <body>
            <jsp:include page="./html/header.jsp" />

            <br>
            <form class="form" enctype="multipart/form-data">
                <h4 align="center" style="font-weight:bold">刊登房屋</h4><br>
                <nobr align="left" style="font-size:20px;font-weight:bold">地址：</nobr>
                <input type="text" name="HAddress" id="HAddress" maxlength="128" required="required">
                <nobr align="left" style="font-size:20px;font-weight:bold;">租金：</nobr>
                <input type="number" name="Rent" id="Rent" required="required">
                <nobr align="left" style="font-size:20px;font-weight:bold;">坪數：</nobr>
                <input type="number" name="Size" id="Size" max="100" min="1" required="required">
                <nobr align="left" style="font-size:20px;font-weight:bold;">屋齡：</nobr>
                <input type="number" name="HYear" id="HYear" max="100" min="1" required="required">

                <div class="news-filter ">
                    <nobr align="left" style="font-size:20px;font-weight:bold;">性別限制：</nobr>
                    <select class="news-filter" name="GenderSpecific" id="GenderSpecific" required="required">
                        <option selected></option>
                        <option value="男">男</option>
                        <option value="女">女</option>
                        <option value="無">無</option>
                    </select>
                </div>
                <nobr align="left" style="font-size:20px;font-weight:bold;">設備：</nobr>
                <input type="text" name="Equipment" id="Equipment" maxlength="128" required="required">
                <nobr align="left" style="font-size:20px;font-weight:bold;">上傳照片：</nobr>
                <input type="file" name="file" id="file" style="width:78%" />
                <nobr align="center"><img style='display:none' /></nobr>
                <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
                <script>
                    $('input').on('change', function (e) {
                        const file = this.files[0];
                        const objectURL = URL.createObjectURL(file);
                        $('img').attr('style', 'display:inline')
                        $('img').attr('src', objectURL);
                    });
                </script>
                <div class="mx-auto text-center my-2">
                    <button type="submit" class="btn btn-outline-primary">請求刊登</button>
                </div>

            </form>

            <jsp:include page="./html/footer.jsp" />
        </body>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script>
            $('form').on('submit', function () {
                $('input[type="submit"]').text('傳送中......');
                $.ajax({
                    url: '/NCURent/Post/AddPost',
                    method: 'POST',
                    dataType: 'json',
                    contentType: false, //required
                    processData: false, // required
                    mimeType: 'multipart/form-data',
                    data: new FormData(this),
                    success: function (res) {
                        if (res.status == "success") {
                            $("#HAddress").val('');
                            $("#Rent").val('');
                            $("#Size").val('');
                            $("#HYear").val('');
                            $("#GenderSpecific").val('');
                            $("#Equipment").val('');
                            $("#file").val('');
                            $('img').attr('style', "display:none")
                            alert(res.message)
                        } else {
                            alert(res.message)
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Status: " + textStatus); alert("Error: " + errorThrown);
                    }
                });
                return false;
            });
        </script>

        </html>