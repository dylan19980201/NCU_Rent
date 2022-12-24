<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ page import="java.util.*" %>


        <!DOCTYPE html>
        <html>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

        <head>
            <meta charset="utf-8">
            <title>中央大學預約看房網</title>
            <link rel="icon" href="https://upload.wikimedia.org/wikipedia/commons/3/3a/NCULogo.svg" type="image/gif"
                sizes="16x16">
            <script>
                var alertMessage = '<%= request.getAttribute("returnMessage") %>';
                if (alertMessage != 'null') {
                    alert(alertMessage)
                }
            </script>
        </head>

        <body>

            <form enctype="multipart/form-data">
                房屋地址:<input type="text" name="HAddress">
                屋齡:<input type="text" name="HYear">
                租金:<input type="text" name="Rent">
                坪數:<input type="text" name="Size">
                設備:<input type="text" name="Equipment">
                性別限制:<input type="text" name="GenderSpecific">
                <input type="file" name="file" />
                <input type="submit" value="請求刊登" class="btn btn-outline-primary">
                <img src="/NCURent/upload/house2.jpg">
            </form>
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