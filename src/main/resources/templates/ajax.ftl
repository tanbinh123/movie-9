<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>index</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
    <p>
        账号:<input type="text" id="userAccount" name="userAccount" onkeyup="checkAccount()">
        <button id="userAccount1" >请输入账号</button>
    </p>
    <p>
        <div id="show"></div>
    </p>
</body>
<script>
    // function checkAccount(){
    //     $.ajax({
    //         url:'checkAccount',
    //         dataType:'text',    //返回的数据类型
    //         type:'get', //
    //         async:'true',   //true异步，false同步
    //         data:{
    //             'userAccount':$("#userAccount").val()
    //         },
    //         success:function(data){
    //             console.log(data);
    //             if(data==="1"){
    //                 console.log("data",1);
    //                 $("#userAccount1").html('此账号已经注册');
    //             }else{
    //                 console.log("data",0);
    //                 $("#userAccount1").html('此账号没有注册过，该账号可以使用');
    //             }
    //         }
    //     })
    // }

    // function checkAccount(){
    //     //console.log(123);
    //     $.ajax({
    //         url:'checkAccount1',//地址
    //         dataType:'text',//返回的数据类型
    //         type:'get',//请求方式
    //         async:true,//异步//false同步
    //         data:{'userAccount':$("#userAccount").val()},
    //         success:function(data){//回调函数  error
    //             $("#show").html('');//清空数据
    //             console.log(data);
    //            // var show=$("#show");
    //             var s=data.split(",");//s是一个数组
    //             console.log(s);
    //             for(var i=0;i<s.length;i++){
    //                 $("#show").append('<p><a href="javascript:work('+i+');" id="demo'+i+'">'+s[i]+'</a></p>');
    //             }
    //             $("#show").show();
    //         }
    //     })
    // }

    $(function(){
        $.ajax({
            url: 'checkAccount2',//地址
            dataType: 'json',//返回的数据类型
            type: 'get',//请求方式
            async: true,//异步//false同步
            //data: {'userAccount': $("#userAccount").val()},
            success: function (data) {//回调函数  error
                console.log(data);
                $("#show").append("<table><tr><td>name</td><td>sex</td><td>age</td></tr>");
                for(var i=0;i<data.length;i++){
                    $("#show").append("<tr><td>"+data[i].name+"</td><td>"+data[i].sex+"</td><td>"+data[i].age+"</td></tr>");
                }
                $("#show").append("</table>");
            }
        });

    });
</script>

</html> 