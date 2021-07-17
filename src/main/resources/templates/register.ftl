<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册</title>

</head>
<body style="background-color: antiquewhite">
<div style="text-align: center; margin-top: 150px;">
    <span style="color: aqua;font-size: 45px">注册</span>

    <form action="insertUser" method="post" onsubmit="return check();">
        <p style="font-size:25px ">名称：<input style="font-size:25px " type="text" name="USER_NAME" maxlength="10" id="USER_NAME" placeholder="请输入用户名" onblur="checkName();">
            <span style="color: pink;font-size: 20px" id="msg"></span>

        <p style="font-size:25px ">年龄：<input style="font-size:25px " type="text" name="USER_AGE" maxlength="10" id="USER_AGE" placeholder="请输入用户年龄" onblur="checkAge();">
            <span style="color: pink;font-size: 20px" id="msg2"></span>

        <p style="font-size:25px ">性别：<input style="font-size:25px;" type="radio" value="男" name="sex" checked="checked">男
        <input style="font-size:25px;" type="radio" value="女" name="sex">女</p>
        <input type="hidden" name="USER_SEX" id="USER_SEX">
        <input type="submit" style="font-size: 30px;background-color: skyblue;margin-right: 50px">
        <input type="reset"  style="font-size: 30px;background-color: azure">
    </form>
    <script>
        // 验证名字是否合法
        function checkName() {
            // 去空格 trim()
            var name = document.getElementById("USER_NAME").value.trim();
            if (name == ''){
                document.getElementById("msg").innerHTML = "名称不能为空";
                return false;
            } else {
                document.getElementById("msg").innerHTML = "名称合法!";
                return true;
            }
        }

        // 验证年龄是否合法
        function checkAge() {
            // 去空格 trim()
            var age = document.getElementById("USER_AGE").value.trim();
            if (age == ''){
                document.getElementById("msg2").innerHTML = '年龄不能为空！';
                return false;
            } else if (age <= 0){
                document.getElementById("msg2").innerHTML = '年龄不合法！';
                return false;
            } else {
                document.getElementById("msg2").innerHTML = '年龄合法！';
                return true;
            }
        }

        function check() {
            var box = document.getElementsByName("sex");
            var sexValue = "";
            for (var i = 0; i < box.length; i++){
                if (box[i].checked){
                    sexValue = box[i].value;
                    break;
                }
            }
            document.getElementById("USER_SEX").value = sexValue;
            if (checkName() && checkAge()){
                return true;
            } else {
                return false;
            }
        }
    </script>
</div>
</body>
</html>