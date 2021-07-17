<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>chat</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script>
        function checkNick(){
            $.ajax({
                url: 'checkNick',//地址
                dataType: 'text',//返回的数据类型
                type: 'get',//请求方式
                async: true,//异步//false同步
                data: {'nick': $("#nick").val().trim()},
                success: function (data) {
                    // console.log(data);
                    if(data=='-1'){
                        $("#nick1").html('该账号可以注册');
                        document.getElementById("btn").disabled="";
                    }else{
                        $("#nick1").html('该账号已经注册，请重新输入');
                        document.getElementById("btn").disabled="disabled";
                    }

                }
            });
        }
    </script>
</head>
<body>
<form action="login" method="post">
<#--    chinasoft@product-sa-->
    <p>昵称:<input type="text" name="nick" id="nick" onblur="checkNick();"><span id="nick1">请输入昵称</span></p>
    <p><input type="submit" disabled="disabled" id="btn"></p>
</form>
</body>
</html>